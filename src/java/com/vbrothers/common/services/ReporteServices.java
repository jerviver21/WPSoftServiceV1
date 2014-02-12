
package com.vbrothers.common.services;

import com.vbrothers.common.dominio.Archivo;
import com.vbrothers.common.dominio.Reporte;
import com.vbrothers.common.dto.ResultReporteDTO;
import com.vbrothers.common.exceptions.ParametroException;
import com.vbrothers.util.FilesUtils;
import com.vbrothers.util.FormatType;
import com.vbrothers.util.ReportsManager;
import java.io.File;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;

/**
 * @author Jerson Viveros
 */
@Stateless
public class ReporteServices extends AbstractFacade<Reporte> implements ReporteServicesLocal {
    //Tipos de archivo, deben estar en la tabla tipo_archivo
    final int TIPO_REPORTE_XLS = 1;
    final int TIPO_REPORTE_PDF = 2;
    final int TIPO_REPORTE_TXT = 3;
    
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Resource(mappedName = "java:jboss/datasources/PostgreSQLDS2")
    private DataSource dataSource;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReporteServices() {
        super(Reporte.class);
    }

    @Override
    public List<Reporte> findAll(){
        List<Reporte> Reporte = em.createNamedQuery("Reporte.findAll").getResultList();
        return Reporte;
    }

    @Override
    public Reporte find(Object id){
        Reporte reporte = em.find(Reporte.class, id);
        if(reporte != null){
            System.out.println(reporte.getNombre()+": No Params: "+reporte.getParametrosReporte().size()+" - No Archivos: "+reporte.getArchivos().size());
        }
        return reporte;
    }

    @Override
    public ResultReporteDTO generarReporte(Reporte reporte, Map<String, Object> params) throws ParametroException, Exception{
        ResultReporteDTO resultado = new ResultReporteDTO();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        String rutaDescarga = locator.getParameter("rutaDescarga");
        String rutaReporte = locator.getParameter("rutaReporte");
        if(rutaDescarga == null){
            throw new ParametroException("No existe el parámetro: rutaDescarga");
        }
        if(rutaReporte == null){
            throw new ParametroException("No existe el parámetro: rutaReporte");
        }


        //Definimos el nombre del directorio en donde se guardaran los archivos
        Calendar fecha = Calendar.getInstance();
        int difNombreArchivo = (int)(Math.random()*1000);
        String nomDirectorio = rutaDescarga+File.separator+format.format(fecha.getTime())+File.separator+reporte.getNombre()+difNombreArchivo;

        File directorio = new File(nomDirectorio);
        if(directorio.exists() && directorio.isFile()){
            directorio.delete();
        }
        if(!directorio.exists()){
            directorio.mkdirs();
        }
        System.out.println("Directorio: "+nomDirectorio);
        //Para cada archivo del reporte, generamos el jasper
        String nombreArchivo = nomDirectorio+File.separator;

        List<Archivo> archivosReporte = reporte.getArchivos();
        System.out.println("Num archs:"+archivosReporte.size());
        List<String>  rutaArchivos = new ArrayList<String>();
        for(Archivo archivo : archivosReporte){
            nombreArchivo = nombreArchivo + generarNombreArchivo(archivo.getNombreArchivo(), params).trim();
            System.out.println("--> "+nombreArchivo);
            int tipoReporte = archivo.getTipoArchivo().getId();
            File out = new File(nombreArchivo);
            ReportsManager reportsManager = new ReportsManager(rutaReporte+File.separator + archivo.getNombreJasper(), null, params, dataSource.getConnection());
            if(tipoReporte == TIPO_REPORTE_PDF){
                out = reportsManager.getReport(out, FormatType.valueOf("PDF"));
            }else if(tipoReporte == TIPO_REPORTE_TXT){
                out = reportsManager.getReport(out, FormatType.valueOf("TXT"));
            }else{
                out = reportsManager.getReport(out, FormatType.valueOf("XLS"));
            }
            rutaArchivos.add(nombreArchivo);
        }
        String rutaZip = nomDirectorio+".ZIP";
        FilesUtils.comprimirArchivo(rutaArchivos, rutaZip);
        resultado.setRutaZip(rutaZip);
            
        

        return resultado;
    }


    private String generarNombreArchivo(String nombre, Map<String, Object> parametros) throws Exception{
        String[] datosNombre = nombre.split(";");
        if(datosNombre.length == 1){
            Set<String> pks = parametros.keySet();
            for(String pk : pks){
                nombre = nombre.replaceAll("P\\{"+pk+"\\}", parametros.get(pk)+"");
            }
        }else{
            nombre = "";
            for(String datoNombre : datosNombre){
                String prefix;
                String nMethod;
                String param;
                String[] paramsMethod;
                if(datoNombre.indexOf("String.format") != -1 ){
                    prefix = datoNombre.replaceAll("(.*)String.*", "$1");
                    nMethod = datoNombre.replaceAll(".*String\\.(.*?)\\(.*", "$1");
                    paramsMethod = datoNombre.replaceAll(".*String\\..*?\\((.*)\\)","$1").split(",");
                    Class[] tiposParams = new Class[]{String.class, Object[].class};
                    Object[] datosParams = new Object[paramsMethod.length];
                    for(int i = 0; i < paramsMethod.length; i++){
                        String p = paramsMethod[i];
                        if(p.matches("P\\{.*\\}")){
                            datosParams[i] = new Object[]{parametros.get(p.replaceAll("P\\{(.*)\\}", "$1"))};
                        }else{
                            datosParams[i] = p.replaceAll("\"", "");
                        }
                    }
                    Class clase = String.class;
                    Method m1 = clase.getMethod(nMethod, tiposParams);
                    nombre = nombre + prefix + m1.invoke(null, datosParams);
                }else if(datoNombre.matches(".*P\\{.*")){

                    prefix = datoNombre.replaceAll("(.*)P\\{.*", "$1");
                    param = datoNombre.replaceAll("(.*)P\\{(.*?)\\}.*", "$2");
                    nMethod = datoNombre.replaceAll(".*P\\{.*?\\}\\.(.*?)\\(.*", "$1");
                    paramsMethod = datoNombre.replaceAll(".*P\\{.*?\\}\\..*?\\((.*)\\)", "$1").split(",");

                    Class[] tiposParams = new Class[paramsMethod.length];
                    Object[] datosParams = new Object[paramsMethod.length];
                    for(int i = 0; i < paramsMethod.length; i++){
                        tiposParams[i] = String.class;
                        datosParams[i] = paramsMethod[i].replaceAll("\"", "");
                    }


                    Class clase = String.class;
                    Method m1 = clase.getMethod(nMethod, tiposParams);
                    String dato = parametros.get(param).toString();
                    if(parametros.get(param) instanceof Date){
                        dato = new SimpleDateFormat("yyyy-MM-dd").format((Date)parametros.get(param));
                    }
                    nombre = nombre + prefix + m1.invoke(dato, datosParams);
                }else{
                    nombre = nombre+datoNombre;
                }
            }
        }
        return nombre;
    }

    @Override
    public List<Reporte> getReportesByProcesoAndRol(int proceso, Set<String> roles) {
        String criterioRol = "";
        if(roles != null){
            for(String rol : roles){
                if(criterioRol.equals("")){
                    criterioRol += " r.roles LIKE '%"+rol+"%' ";
                }else{
                    criterioRol += " OR r.roles LIKE '%"+rol+"%' ";
                }

            }
        }
        return em.createQuery("SELECT r FROM Reporte r "
                    + "WHERE r.proceso.id = "+proceso+" AND  ("+criterioRol+")").getResultList();
    }


 
}

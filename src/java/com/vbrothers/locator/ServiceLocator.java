package com.vbrothers.locator;
import com.vbrothers.common.services.CommonServicesLocal;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.naming.InitialContext;

/**
 * @author Jerson Viveros
 */
public class ServiceLocator {
    public static int MENU_X_ID = 1;
    public static int GRUPO_X_ID = 2;
    public static int ROL_X_ID = 3;
    public static int PARAMETROS = 4;
    public static int REPORTES_X_ID = 5;
    public static int CONTRATISTAS_X_ID = 7;
    public static int PROYECTOS_X_ID = 9;
    public static int SECTORES_X_ID = 10;
    public static int EQUIPOS_X_ID = 11;
    public static int EMPLEADOS_X_ID = 8;
    public static int DISCIPLINA_X_ID = 14;
    public static int PELIGROS_X_ID = 15;
    public static int TIPOID_X_ID = 6;
    public static int GRUPOS_AUTORIDAD_AREA = 16;
    public static int EQUIPOS_X_SECTOR_ID = 17;
    public static int LENGUAJES = 18;
    //Representa un data, por tanto en la base de datos - tabla data, este debe tener id = 6

  

    private Map cache;
    private static ServiceLocator instance;

    private CommonServicesLocal commonFacade;

    static{
        try {
            instance = new ServiceLocator();
        } catch (Exception e) {
            System.err.println(e);
            e.printStackTrace(System.err);
        }
    }

    private ServiceLocator() throws Exception{
        try {
            InitialContext contexto = new InitialContext();
            commonFacade = (CommonServicesLocal)contexto.lookup("global/WPSoftWebV1/CommonServices!com.vbrothers.common.services.CommonServicesLocal");
            cache = Collections.synchronizedMap(new HashMap());
        } catch (Exception e) {
            System.err.println(e);
            e.printStackTrace(System.err);
        }
    }

    private ServiceLocator(Map cache) {
        this.cache = cache;
    }


    public static ServiceLocator getInstance(){
        return instance;
    }

    public Map getConditionalRefTable(int TABLA, String param1, String param2, Set<String> roles){
        //Como estas tablas están relacionadas con el rol, no se guardan en cache
        String criterioRol = "";
        if(roles != null){
            for(String rol : roles){
                if(criterioRol.equals("")){
                    criterioRol += " roles LIKE '%"+rol+"%' ";
                }else{
                    criterioRol += " OR roles LIKE '%"+rol+"%' ";
                }

            }
        }
        Map resultado = null;
        if(TABLA == REPORTES_X_ID){
            resultado = commonFacade.getReferenceTable("SELECT id, nombre "
                    + "FROM reporte "
                    + "WHERE id_proceso = "+param1+" AND  ("+criterioRol+")");
        }else if(TABLA == CONTRATISTAS_X_ID){
            String consulta = "";
            if(param2 == null){
                consulta = "SELECT id, nombre "
                    + "FROM contratista "
                    + (param1 == null?"":"WHERE usuario = '"+param1+"'");
            }else{
                consulta = "SELECT id, nombre "
                    + "FROM contratista "
                    + (param1 == null?"WHERE activo = "+param2:"WHERE usuario = '"+param1+"'");
            }
            resultado = commonFacade.getReferenceTable(consulta);
        }else if(TABLA == EMPLEADOS_X_ID){
            String consulta = "";
            if(param2 == null){
                consulta = "SELECT id, nombres_apellidos "
                    + "FROM empleado "
                    + (param1 == null?"":(param1.equals("PROPIO")?"WHERE id_contratista is null":"WHERE id_contratista = "+param1+" "));
            }else{
                consulta = "SELECT id, nombres_apellidos "
                    + "FROM empleado "
                    + (param1 == null?"WHERE activo = "+param2:(param1.equals("PROPIO")?"WHERE id_contratista is null and activo = "+param2:"WHERE id_contratista = "+param1+"  and activo = "+param2));
            }
                    
            resultado = commonFacade.getReferenceTable(consulta);
        }else if(TABLA == PROYECTOS_X_ID){
            String consulta = "SELECT id, nombre "
                    + "FROM proyecto "
                    + (param1 == null?"":"WHERE id_estado = "+param1);
            resultado = commonFacade.getReferenceTable(consulta);
        }
        return resultado;
    }


    public Map getReferenceTable(int TABLA){
        Map resultado = (Map)cache.get(TABLA);
        if(resultado == null){
            if(TABLA == MENU_X_ID){
                resultado = commonFacade.getReferenceTable(MENU_X_ID);
                cache.put(MENU_X_ID, resultado);
            }else if(TABLA == GRUPO_X_ID){
                resultado = commonFacade.getReferenceTable(GRUPO_X_ID);
                cache.put(GRUPO_X_ID, resultado);
            }else if(TABLA == ROL_X_ID){
                resultado = commonFacade.getReferenceTable(ROL_X_ID);
                cache.put(ROL_X_ID, resultado);
            }else if(TABLA == TIPOID_X_ID){
                resultado = commonFacade.getReferenceTable(TIPOID_X_ID);
                cache.put(TIPOID_X_ID, resultado);
            }else if(TABLA == PARAMETROS){
                getParameter("");
                resultado = (Map)cache.get(TABLA);
            }else if(TABLA == EQUIPOS_X_ID){
                resultado = commonFacade.getReferenceTable(TABLA);
                cache.put(TABLA, resultado);
            }else if(TABLA == SECTORES_X_ID){
                resultado = commonFacade.getReferenceTable(TABLA);
                cache.put(TABLA, resultado);
            }else if(TABLA == DISCIPLINA_X_ID){
                resultado = commonFacade.getReferenceTable(TABLA);
                cache.put(TABLA, resultado);
            }else if(TABLA == PELIGROS_X_ID){
                resultado = commonFacade.getReferenceTable(TABLA);
                cache.put(TABLA, resultado);
            }else if(TABLA == GRUPOS_AUTORIDAD_AREA){
                String rolAutArea = getParameter("rolAutArea");
                resultado = commonFacade.getReferenceTable("SELECT g.codigo as cod1, g.codigo as cod2 "
                        + "FROM groups g, group_rol gr, rol r "
                        + "WHERE g.id = gr.id_group AND gr.id_rol = r.id "
                        + "AND r.codigo = '"+rolAutArea+"'");
                cache.put(TABLA, resultado);
            }else if(TABLA == EQUIPOS_X_SECTOR_ID){
                resultado = commonFacade.getReferenceTable(TABLA);
                cache.put(TABLA, resultado);
            }else if(TABLA == LENGUAJES){
                resultado = commonFacade.getReferenceTable("SELECT id, nombre "
                        + "FROM idiomas ");
                cache.put(TABLA, resultado);
            }

        }
        return resultado;
    }

    public void restartCache(){
        cache = new HashMap();
    }

    public String getParameter(String parametro){
        Map parametros = (Map)cache.get(PARAMETROS);
        if(parametros == null){
            parametros = commonFacade.getReferenceTable("SELECT nombre, valor FROM parametro");
            cache.put(PARAMETROS, parametros);
        }
        return (String)parametros.get(parametro);
    }

}

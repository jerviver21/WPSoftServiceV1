package com.vbrothers.locator;
import com.vbrothers.common.services.CommonServicesLocal;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import javax.naming.InitialContext;

/**
 * @author Jerson Viveros
 */
public class ServiceLocator {
    //En el módulo de reportes los siguientes identificadores representan el data, que permite tipos de datos de combo
    //Identificador de cache para parametros
    public static int PARAMETROS = 0;
    //Identificadores de cache para combos
    public static int COMB_ID_MENU = 1;
    public static int COMB_ID_GRUPO = 2;
    public static int COMB_ID_ROL = 3;
    public static int COMB_ID_SECTOR = 5;
    public static int COMB_ID_DISCIPLINA = 6;
    public static int COMB_ID_PELIGRO = 7;
    public static int COMB_ID_TIPOID = 8;
    public static int COMB_ID_IDIOMA = 9;
    public static int COMB_ID_ESTADOSPERMISOS = 10;
    public static int COMB_ID_ESTADOSPROYECTO = 11;
    public static int COMB_ID_CERTIFICADO = 12;
    //Identificadores de cache para subcombos
    public static int SUBC_SECTOR_EQUIPO = 100;

    //Guarda mapas con par llave-valor que se utilizan en la aplicación
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


    public Map getDataForCombo(int TABLA){
        Map resultado = (Map)cache.get(TABLA);
        if(resultado == null){
            if(TABLA == COMB_ID_MENU){
                resultado = commonFacade.getReferenceTableForCombo("SELECT id, nombre FROM menu");
                cache.put(TABLA, resultado);
            }else if(TABLA == COMB_ID_GRUPO){
                resultado = commonFacade.getReferenceTableForCombo("SELECT id, codigo FROM groups");
                cache.put(TABLA, resultado);
            }else if(TABLA == COMB_ID_ROL){
                resultado = commonFacade.getReferenceTableForCombo("SELECT id, codigo FROM rol");
                cache.put(TABLA, resultado);
            }else if(TABLA == COMB_ID_TIPOID){
                resultado = commonFacade.getReferenceTableForCombo("SELECT id, codigo FROM tipo_id");
                cache.put(TABLA, resultado);
            }else if(TABLA == COMB_ID_SECTOR){
                resultado = commonFacade.getReferenceTableForCombo("SELECT id, nombre FROM sector");
                cache.put(TABLA, resultado);
            }else if(TABLA == COMB_ID_CERTIFICADO){
                resultado = commonFacade.getReferenceTableForCombo("SELECT id, nombre FROM certificado");
                cache.put(TABLA, resultado);
            }else if(TABLA == COMB_ID_DISCIPLINA){
                resultado = commonFacade.getReferenceTableForCombo("SELECT id, nombre FROM disciplina");
                cache.put(TABLA, resultado);
            }else if(TABLA == COMB_ID_PELIGRO){
                resultado = commonFacade.getReferenceTableForCombo("SELECT id, nombre FROM peligro");
                cache.put(TABLA, resultado);
            }else if(TABLA == COMB_ID_IDIOMA){
                resultado = commonFacade.getReferenceTableForCombo("SELECT id, nombre FROM idiomas ");
                cache.put(TABLA, resultado);
            }else if(TABLA == COMB_ID_ESTADOSPERMISOS){
                resultado = commonFacade.getReferenceTableForCombo("SELECT * FROM estado_permiso ");
                cache.put(TABLA, resultado);
            }else if(TABLA == COMB_ID_ESTADOSPROYECTO){
                resultado = commonFacade.getReferenceTableForCombo("SELECT * FROM estados_proyecto ");
                cache.put(TABLA, resultado);
            }else if(TABLA == PARAMETROS){
                resultado = commonFacade.getReferenceTableForCombo("SELECT nombre, valor FROM parametro");
                cache.put(PARAMETROS, resultado);
            }

        }
        //System.out.println("- "+resultado.size());
        return resultado;
    }
    
    public Map getDataForSubcombo(int TABLA){
        Map resultado = (Map)cache.get(TABLA);
        if(resultado == null){
            if(TABLA == SUBC_SECTOR_EQUIPO){
                resultado = commonFacade.getReferenceTableForSubcombo("SELECT sec.id as ID_SEC, eq.id as ID_EQ, eq.nombre as NOMBRE "
                        + "FROM equipo eq, sector sec "
                        + "WHERE eq.id_sector = sec.id ");
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
            parametros = commonFacade.getReferenceTableForCombo("SELECT nombre, valor FROM parametro");
            cache.put(PARAMETROS, parametros);
        }
        return (String)parametros.get(parametro);
    }

}

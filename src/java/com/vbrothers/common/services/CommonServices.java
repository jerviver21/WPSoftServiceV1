package com.vbrothers.common.services;


import com.vbrothers.usuarios.services.MenusServicesLocal;
import com.vbrothers.usuarios.services.ResourcesServicesLocal;
import com.vbrothers.usuarios.services.RolesServicesLocal;
import com.vbrothers.util.Log;
import java.math.BigInteger;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.logging.Level;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author Jerson Viveros
 */
@Stateless
public class CommonServices implements CommonServicesLocal {
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;
    
    @EJB
    ResourcesServicesLocal resourceService;
    @EJB
    MenusServicesLocal menuService;
    @EJB
    ReporteServicesLocal reporteService;
    @EJB
    RolesServicesLocal rolService;


    @Override
    public int executeUpdate(String query){
        return em.createNativeQuery(query).executeUpdate();
    }

    @Override
    public List<String> executeQuery(String query){
        List<String> registros = new ArrayList<String>();
        List<Object[]> datos = em.createNativeQuery(query).getResultList();
        for(Object[] registro : datos){
            StringBuilder cadena = new StringBuilder();
            for(Object dato : registro){
                dato = dato==null?"":dato.toString()+"; \t";
                cadena.append(dato);
            }
            registros.add(cadena.toString());
        }
        return registros;
    }
    
    @Override
    public Map getReferenceTableForCombo(String consulta){
        Map datos = new HashMap();
        try {
            List<Object[]> registros = em.createNativeQuery(consulta).getResultList();
            for(Object[] registro : registros){
                datos.put(registro[0], registro[1]);
            }
        } catch (Exception e) {
            System.err.println("Error al cargar datos en memoria: \n"+consulta+" \n "
                    + "La consulta debe tener solo 2 valores, 1 para la llave del Map y otro para el valor del Map \n"+e);
            e.printStackTrace(System.err);
            datos = null;
        }
        return datos;
    }
    
    @Override
    public Map getReferenceTableForSubcombo(String consulta){
        Map datos = new HashMap();
        try {
            List<Object[]> registros = em.createNativeQuery(consulta).getResultList();
            for(Object[] registro : registros){
                Map subDatos = (Map)datos.get(registro[0]);
                if(subDatos == null){
                    subDatos = new LinkedHashMap();
                    subDatos.put(registro[1], registro[2]);
                    datos.put(registro[0], subDatos);
                }else{
                    subDatos.put(registro[1],registro[2]);
                }
            }
        } catch (Exception e) {
            System.err.println("Error al cargar datos en memoria: \n"+consulta+" \n "
                    + "La consulta debe tener solo 2 valores, 1 para la llave del Map y otro para el valor del Map \n"+e);
            e.printStackTrace(System.err);
            datos = null;
        }
        return datos;
    }

    /*
     * Este método permite crear la estructura de menus en la base de datos en caso de que estos no existan.
     */
    @Override
    public void updateEstructuraMenus() {
        try {
            Map<String, BigInteger> roles = getReferenceTableForCombo("SELECT codigo, id FROM rol");
            Map<String, BigInteger> menus = getReferenceTableForCombo("SELECT nombre, id FROM menu");
            ResourceBundle recursos1 = ResourceBundle.getBundle("com.vbrothers.util.menu");
            Enumeration<String> eKeys = recursos1.getKeys();
            List<String> keys = Collections.list(eKeys);
            Collections.sort(keys);
            
            if(em.createNativeQuery("SELECT * FROM menu WHERE nombre = 'RAIZ'").getResultList().isEmpty()){
                em.createNativeQuery("INSERT INTO menu (id, nombre, id_menu, idioma) "
                                    + "VALUES (1, 'RAIZ', null, 'es') ").executeUpdate();
                menus.put("RAIZ", BigInteger.ONE);
            }
            
            for(String key:keys){
                if(key.matches("menus.*")){
                    String[] datos = recursos1.getString(key).split(";");
                    if(em.createNativeQuery("SELECT * FROM menu WHERE nombre = '"+datos[0]+"' AND idioma = '"+datos[2]+"'").getResultList().isEmpty()){
                        if(menus.get(datos[1]) != null){
                            em.createNativeQuery("INSERT INTO menu (nombre, id_menu, idioma) "
                                + "VALUES ('"+datos[0]+"', "+menus.get(datos[1])+", '"+datos[2]+"') ").executeUpdate();
                            BigInteger id = (BigInteger)em.createNativeQuery("SELECT id FROM menu WHERE nombre = '"+datos[0]+"' AND idioma = '"+datos[2]+"'").getSingleResult();
                            menus.put(datos[0], id);
                        }else{
                            Log.getLogger().log(Level.WARNING, "NO EXISTE el menu: {0}", datos[1]);
                        }
                    }else{
                        Log.getLogger().log(Level.WARNING, "Menu existente! - {0} NO SE CREA!", datos[0]);
                    }
                }
                if(key.matches("recursos.*")){
                    String[] datos = recursos1.getString(key).split(";");
                    if(em.createNativeQuery("SELECT * FROM resource WHERE nombre = '"+datos[0]+"' AND idioma = '"+datos[3]+"'").getResultList().isEmpty()){
                        if(menus.get(datos[1]) != null){
                            em.createNativeQuery("INSERT INTO resource (nombre, id_menu, url, idioma) "
                                + "VALUES ('"+datos[0]+"', "+menus.get(datos[1])+", '"+datos[2]+"', '"+datos[3]+"') ").executeUpdate();
                            BigInteger id = (BigInteger)em.createNativeQuery("SELECT id FROM resource WHERE nombre = '"+datos[0]+"' AND idioma = '"+datos[3]+"'").getSingleResult();
                            
                            if(datos[4].equals("ALL")){
                                for(BigInteger idRol : roles.values()){
                                    em.createNativeQuery("INSERT INTO rol_resource (id_rol, id_resource) "
                                            + "VALUES ("+idRol+", "+id+") ").executeUpdate();
                                }
                            }else{
                                String[] rolesAut = datos[4].split(",");
                                for(String rol:rolesAut){
                                    if(roles.get(rol) != null){
                                        em.createNativeQuery("INSERT INTO rol_resource (id_rol, id_resource) "
                                            + "VALUES ("+roles.get(rol)+", "+id+") ").executeUpdate();
                                    }else{
                                       Log.getLogger().log(Level.WARNING, "NO EXISTE el rol: {0}, no se agrega este permiso", rol); 
                                    }
                                }
                            }
                            
                        }else{
                            Log.getLogger().log(Level.WARNING, "NO EXISTE el menu: {0}, para crear el recurso: "+datos[0], datos[1]);
                        }
                    }else{
                        Log.getLogger().log(Level.WARNING, "Recurso existente! - {0} NO SE CREA!", datos[0]);
                    }
                }
            }
        } catch (Exception e) {
            Log.getLogger().log(Level.ALL, "Error al crear los menus por convención", e);
        }
    }


 
}

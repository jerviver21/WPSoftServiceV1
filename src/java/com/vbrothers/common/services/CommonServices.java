package com.vbrothers.common.services;


import com.vbrothers.locator.ServiceLocator;
import com.vbrothers.permisostrabajo.dominio.Sector;
import com.vbrothers.permisostrabajo.dominio.Disciplina;
import com.vbrothers.permisostrabajo.dominio.Equipo;
import com.vbrothers.permisostrabajo.dominio.Peligro;
import com.vbrothers.usuarios.dominio.Groups;
import com.vbrothers.usuarios.dominio.Menu;
import com.vbrothers.usuarios.dominio.Rol;
import com.vbrothers.usuarios.services.MenusServicesLocal;
import com.vbrothers.usuarios.services.ResourcesServicesLocal;
import com.vbrothers.usuarios.services.RolesServicesLocal;
import java.math.BigInteger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;
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
    public Map getReferenceTable(String consulta){
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
    public Map getReferenceTable(int tabla){
        Map datos = new HashMap();
        try {
            if(tabla == ServiceLocator.MENU_X_ID){
                List<Menu> menus = em.createNamedQuery("Menu.findAll").getResultList();
                for(Menu menu:menus){
                    datos.put(menu.getId(), menu);
                }
            }else if(tabla == ServiceLocator.GRUPO_X_ID){
                List<Groups> grupos = em.createNamedQuery("Groups.findAll").getResultList();
                for(Groups grupo:grupos){
                    datos.put(grupo.getId(), grupo);
                }
            }else if(tabla == ServiceLocator.ROL_X_ID){
                List<Rol> roles = em.createNamedQuery("Rol.findAll").getResultList();
                for(Rol rol:roles){
                    datos.put(rol.getId(), rol);
                }
            }else if(tabla == ServiceLocator.EQUIPOS_X_ID){
                List<Equipo> items = em.createNamedQuery("Equipo.findAll").getResultList();
                for(Equipo item:items){
                    datos.put(item.getId(), item);
                }
            }else if(tabla == ServiceLocator.SECTORES_X_ID){
                List<Sector> items = em.createNamedQuery("Sector.findAll").getResultList();
                for(Sector item:items){
                    datos.put(item.getId(), item);
                }
            }else if(tabla == ServiceLocator.DISCIPLINA_X_ID){
                List<Disciplina> items = em.createNamedQuery("Disciplina.findAll").getResultList();
                for(Disciplina item:items){
                    datos.put(item.getId(), item);
                }
            }else if(tabla == ServiceLocator.PELIGROS_X_ID){

                List<Peligro> items = em.createNamedQuery("Peligro.findAll").getResultList();
                //System.out.println("Peligros:  "+items);
                for(Peligro item:items){
                    datos.put(item.getId(), item);
                }
            }else if(tabla == ServiceLocator.EQUIPOS_X_SECTOR_ID){
                List<Object[]> resultado = em.createNativeQuery("SELECT eq.id as ID_EQ, eq.nombre as NOMBRE, sec.id as ID_SEC "
                        + "FROM equipo eq, sector sec "
                        + "WHERE eq.id_sector = sec.id ").getResultList();
                for(Object[] registro : resultado){
                   Map subDatos = (Map)datos.get((Integer)registro[2]);
                   if(subDatos == null){
                       subDatos = new LinkedHashMap();
                       subDatos.put((Integer)registro[0], (String)registro[1]);
                       datos.put((Integer)registro[2], subDatos);
                   }else{
                       subDatos.put((Integer)registro[0], (String)registro[1]);
                   }
                }
            }
            
        } catch (Exception e) {
            System.err.println("Error al cargar datos en memoria: \n"
                    + "La consulta debe tener solo 2 valores, 1 para la llave del Map y otro para el valor del Map \n"+e);
            e.printStackTrace();
            datos = null;
        }
        return datos;
    }

    @Override
    public void updateEstructuraMenus() {
        try {
            //Properties recursos1 = new Properties();

            ResourceBundle recursos1 = ResourceBundle.getBundle("com.vbrothers.util.menu");

            int noMenus = Integer.parseInt(recursos1.getString("numero_menus"));
            for (int i = 1; i <= noMenus; i++) {
                String valor = recursos1.getString("menus"+i);
                if(valor == null){
                    continue;
                }
                String[] datos = valor.split("__");
                if(em.createNativeQuery("SELECT * FROM menu WHERE id = "+datos[0]).getResultList().isEmpty()){
                    String menu = datos[2].equals("-1")?"null":datos[2];
                    em.createNativeQuery("INSERT INTO menu (id, nombre, id_menu, idioma) "
                            + "VALUES ("+datos[0]+", '"+datos[1]+"', "+menu+", '"+datos[3]+"') ").executeUpdate();
                }else{
                    System.out.println("Menu existente! - "+datos[1]+" NO SE CREA!");
                }
            }
            
            BigInteger id = (BigInteger)em.createNativeQuery("SELECT max(id) FROM menu ").getSingleResult();
            //System.out.println("---> "+id.longValue());

            em.createNativeQuery("SELECT pg_catalog.setval('menu_id_seq', "+id.longValue()+", true)").getSingleResult();

            String administrador = recursos1.getString("administrador");
            String[] datosAdmin = administrador.split("__");
            if(em.createNativeQuery("SELECT * FROM rol WHERE id = "+datosAdmin[0]).getResultList().isEmpty()){
               em.createNativeQuery("INSERT INTO rol (id, codigo) VALUES ("+datosAdmin[0]+", '"+datosAdmin[1]+"') ").executeUpdate();
            }


            int noRecursos = Integer.parseInt(recursos1.getString("numero_recursos"));
            for (int i = 1; i <= noRecursos; i++) {
                String valor = recursos1.getString("recursos"+i);
                if(valor == null){
                    continue;
                }
                String[] datos = valor.split("__");
                if(em.createNativeQuery("SELECT * FROM resource WHERE id = "+datos[0]).getResultList().isEmpty()){
                    em.createNativeQuery("INSERT INTO resource (id, nombre, id_menu, url, idioma) "
                            + "VALUES ("+datos[0]+", '"+datos[1]+"', "+datos[2]+", '"+datos[3]+"', '"+datos[4]+"') ").executeUpdate();
                    em.createNativeQuery("INSERT INTO rol_resource (id_rol, id_resource) "
                            + "VALUES ("+datosAdmin[0]+", "+datos[0]+") ").executeUpdate();
                }else{
                    System.out.println("Recurso existente! - "+datos[1]+" NO SE CREA!");
                }

                
            }
            id = (BigInteger)em.createNativeQuery("SELECT max(id) FROM resource ").getSingleResult();

            em.createNativeQuery("SELECT pg_catalog.setval('resource_id_seq', "+id.longValue()+", true)").getSingleResult();

        } catch (Exception e) {
            e.printStackTrace();
        }
   
        
    }

    @Override
    public void updateEstructuraReportes() {
        
        
    }

 
}

package com.vbrothers.permisostrabajo.to;

import com.vbrothers.permisostrabajo.dominio.Contratista;
import com.vbrothers.permisostrabajo.dominio.Empleado;
import com.vbrothers.permisostrabajo.dominio.PermisoTrabajo;
import com.vbrothers.permisostrabajo.dominio.Tarea;
import com.vbrothers.usuarios.dominio.Users;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Jerson Viveros
 */
public class PermisoTrabajoTO {
    private final int SOLICITAR_APROBACION = 1;
    private final int APROBAR = 2;
    private final int TERMINAR = 3;
    private final int CANCELAR = 4;
    private final int FINALIZAR = 5;


    private PermisoTrabajo permiso;
    private Contratista contratista;
    private List<Empleado> empleados;
    private String horaIni;
    private String horaFin;
    private String nota;
    private Users usr;
    private int etapa = SOLICITAR_APROBACION;

    //Para poder realizar el despliegue de 6 tareas por default, así estas no se diligencien.
    private List<Tarea> tareasVista;
    


    public PermisoTrabajoTO(){
        tareasVista = new ArrayList<Tarea>();
        empleados = new ArrayList<Empleado>();
        contratista = null;
    }

    /**
     * @return the permiso
     */
    public PermisoTrabajo getPermiso() {
        return permiso;
    }

    /**
     * @param permiso the permiso to set
     */
    public void setPermiso(PermisoTrabajo permiso) {
        this.permiso = permiso;
    }

    /**
     * @return the contratista
     */
    public Contratista getContratista() {
        return contratista;
    }

    /**
     * @param contratista the contratista to set
     */
    public void setContratista(Contratista contratista) {
        this.contratista = contratista;
    }

    /**
     * @return the empleados
     */
    public List<Empleado> getEmpleados() {
        return empleados;
    }

    /**
     * @param empleados the empleados to set
     */
    public void setEmpleados(List<Empleado> empleados) {
        this.empleados = empleados;
    }

    /**
     * @return the horaIni
     */
    public String getHoraIni() {
        return horaIni;
    }

    /**
     * @param horaIni the horaIni to set
     */
    public void setHoraIni(String horaIni) {
        this.horaIni = horaIni;
    }

    /**
     * @return the horaFin
     */
    public String getHoraFin() {
        return horaFin;
    }

    /**
     * @param horaFin the horaFin to set
     */
    public void setHoraFin(String horaFin) {
        this.horaFin = horaFin;
    }

    /**
     * @return the nota
     */
    public String getNota() {
        return nota;
    }

    /**
     * @param nota the nota to set
     */
    public void setNota(String nota) {
        this.nota = nota;
    }

    /**
     * @return the usr
     */
    public Users getUsr() {
        return usr;
    }

    /**
     * @param usr the usr to set
     */
    public void setUsr(Users usr) {
        this.usr = usr;
    }

    /**
     * @return the tareasVista
     */
    public List<Tarea> getTareasVista() {
        return tareasVista;
    }

    /**
     * @param tareasVista the tareasVista to set
     */
    public void setTareasVista(List<Tarea> tareasVista) {
        this.tareasVista = tareasVista;
    }

    /**
     * @return the SOLICITAR_APROBACION
     */
    public int getSOLICITAR_APROBACION() {
        return SOLICITAR_APROBACION;
    }

    /**
     * @return the APROBAR
     */
    public int getAPROBAR() {
        return APROBAR;
    }

    /**
     * @return the TERMINAR
     */
    public int getTERMINAR() {
        return TERMINAR;
    }

    /**
     * @return the CANCELAR
     */
    public int getCANCELAR() {
        return CANCELAR;
    }

    /**
     * @return the FINALIZAR
     */
    public int getFINALIZAR() {
        return FINALIZAR;
    }

    /**
     * @return the etapa
     */
    public int getEtapa() {
        return etapa;
    }

    /**
     * @param etapa the etapa to set
     */
    public void setEtapa(int etapa) {
        this.etapa = etapa;
    }



}

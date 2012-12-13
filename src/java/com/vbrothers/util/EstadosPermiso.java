
package com.vbrothers.util;

import com.vbrothers.permisostrabajo.dominio.EstadoPermiso;

/**
 * @author jerviver21
 */
public class EstadosPermiso {
    public static EstadoPermiso VENCIDO  = new EstadoPermiso(0,"VENCIDO ");
    public static EstadoPermiso CREADO  = new EstadoPermiso(1,"CREADO ");
    public static EstadoPermiso DILIGENCIADO  = new EstadoPermiso(2,"DILIGENCIADO ");
    public static EstadoPermiso APROBADO_CALIDAD  = new EstadoPermiso(3,"APROBADO_CALIDAD ");
    public static EstadoPermiso APROBADO_SEGURIDAD  = new EstadoPermiso(4,"APROBADO_SEGURIDAD ");
    public static EstadoPermiso APROBADO_JEFE  = new EstadoPermiso(5,"APROBADO_JEFE ");
    public static EstadoPermiso NO_APROBADO_CALIDAD  = new EstadoPermiso(6,"NO_APROBADO_CALIDAD ");   
    public static EstadoPermiso NO_APROBADO_SEGURIDAD  = new EstadoPermiso(7,"NO_APROBADO_SEGURIDAD ");
    public static EstadoPermiso NO_APROBADO_JEFE  = new EstadoPermiso(8,"NO_APROBADO_JEFE ");
    public static EstadoPermiso TERMINADO  = new EstadoPermiso(9,"TERMINADO ");
    public static EstadoPermiso SUSPENDIDO  = new EstadoPermiso(0,"SUSPENDIDO ");
    public static EstadoPermiso CANCELADO_CALIDAD  = new EstadoPermiso(1,"CANCELADO_CALIDAD ");
    public static EstadoPermiso CANCELADO_SEGURIDAD  = new EstadoPermiso(2,"CANCELADO_SEGURIDAD ");
    public static EstadoPermiso CANCELADO_JEFE  = new EstadoPermiso(3,"CANCELADO_JEFE ");
    public static EstadoPermiso CANCELADO  = new EstadoPermiso(4,"CANCELADO ");
    public static EstadoPermiso APROBADO  = new EstadoPermiso(5,"APROBADO ");
    public static EstadoPermiso APROBADA_CANCELACION  = new EstadoPermiso(6,"APROBADA_CANCELACION ");
    
 
}

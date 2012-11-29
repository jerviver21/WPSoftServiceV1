
package com.vbrothers.util;

import com.vbrothers.permisostrabajo.dominio.EstadoPermiso;

/**
 * @author jerviver21
 */
public class EstadosPermiso {
    public static EstadoPermiso VENCIDO = new EstadoPermiso(0);
    public static EstadoPermiso CREADO = new EstadoPermiso(1);
    public static EstadoPermiso DILIGENCIADO = new EstadoPermiso(2);
    public static EstadoPermiso APROBADO_CALIDAD = new EstadoPermiso(3);
    public static EstadoPermiso APROBADO_SEGURIDAD = new EstadoPermiso(4);
    public static EstadoPermiso APROBADO_JEFE = new EstadoPermiso(5);
    public static EstadoPermiso NO_APROBADO_CALIDAD = new EstadoPermiso(6);
    public static EstadoPermiso NO_APROBADO_SEGURIDAD = new EstadoPermiso(7);
    public static EstadoPermiso NO_APROBADO_JEFE = new EstadoPermiso(8);
    public static EstadoPermiso TERMINADO = new EstadoPermiso(9);
    public static EstadoPermiso SUSPENDIDO = new EstadoPermiso(10);
    public static EstadoPermiso CANCELADO_CALIDAD = new EstadoPermiso(11);
    public static EstadoPermiso CANCELADO_SEGURIDAD = new EstadoPermiso(12);
    public static EstadoPermiso CANCELADO_JEFE = new EstadoPermiso(13);
    public static EstadoPermiso CANCELADO = new EstadoPermiso(14);
    public static EstadoPermiso APROBADO = new EstadoPermiso(15);
    public static EstadoPermiso APROBADA_CANCELACION = new EstadoPermiso(16);

    
}

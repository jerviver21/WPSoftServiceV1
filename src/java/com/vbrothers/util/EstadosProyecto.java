package com.vbrothers.util;

import com.vbrothers.permisostrabajo.dominio.EstadoProyecto;

/**
 * @author jerviver21
 */
public class EstadosProyecto {
    public static EstadoProyecto ACTIVO = new EstadoProyecto(1, "ACTIVO");
    public static EstadoProyecto TERMINADO = new EstadoProyecto(2, "TERMINADO");
    public static EstadoProyecto CANCELADO = new EstadoProyecto(3, "CANCELADO");
    
}

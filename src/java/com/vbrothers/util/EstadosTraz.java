
package com.vbrothers.util;

import com.vbrothers.permisostrabajo.dominio.EstadoTrazabilidad;

/**
 * @author Jerson Viveros
 */
public class EstadosTraz {
    public static EstadoTrazabilidad ASIGNADO = new EstadoTrazabilidad(1); 
    public static EstadoTrazabilidad EJECUTADO = new EstadoTrazabilidad(2);
    public static EstadoTrazabilidad NO_EJECUTADO = new EstadoTrazabilidad(3);

}

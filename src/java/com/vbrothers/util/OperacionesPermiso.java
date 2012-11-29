package com.vbrothers.util;

import com.vbrothers.permisostrabajo.dominio.OperacionPermiso;

/**
 * @author Jerson Viveros
 */
public class OperacionesPermiso {
    public static final OperacionPermiso CREAR = new OperacionPermiso(0);
    public static final OperacionPermiso DILIGENCIAR = new OperacionPermiso(1);
    public static final OperacionPermiso APROBAR = new OperacionPermiso(2);
    public static final OperacionPermiso TERMINAR = new OperacionPermiso(3);
    public static final OperacionPermiso CANCELAR = new OperacionPermiso(4);
    public static final OperacionPermiso SUSPENDER = new OperacionPermiso(5);
    public static final OperacionPermiso NO_APROBAR = new OperacionPermiso(6);


}

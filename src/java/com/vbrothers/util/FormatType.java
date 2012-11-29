/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.util;

/**
 * Enumeracion de formatos de exportacion de reporte
 * @author E. Alexander Ospina Castiblanco
 */
public enum FormatType {

    HTML("html", "text/html"), CSV("csv", "text/plain"), PDF("pdf", "application/pdf"), XLS("xls", "application/vnd.ms-excel");
    private String format;
    private String contentType;

    FormatType(String format, String contentType) {
        this.format = format;
        this.contentType = contentType;
    }

    public String getFormat() {
        return format;
    }

    public String getContentType() {
        return contentType;
    }

}
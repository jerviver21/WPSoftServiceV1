package com.vbrothers.util;

import java.io.File;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;
import javax.servlet.ServletOutputStream;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JExcelApiExporter;
import net.sf.jasperreports.engine.export.JRCsvExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.view.JasperViewer; 

/**
 * ReportsManager
 * Clase administradora de generacion de reportes jasper
 * @author Yair Carreno Lizarazo
 *
 * @param <T>
 */
public class ReportsManager<T> {

    private static Logger log = Logger.getLogger(ReportsManager.class.getName()); 
    @SuppressWarnings("unchecked")
    private Map hm = new HashMap();
    private JasperPrint print;
    private JRExporter exporter;
    private JRDataSource dataSource;

    @SuppressWarnings("unchecked")
    public ReportsManager(String fileName, Collection<T> lista, Map hashmap, Connection conn) throws Exception {
        if (hashmap != null) {
            this.hm = hashmap;
        }
        try {
            if (lista == null) {
                print = JasperFillManager.fillReport(fileName, hm, conn);
            } else if (!lista.isEmpty() && lista.iterator().next() instanceof Map) {
                //dataSource = new JRMapCollectionDataSource(lista);
                //print = JasperFillManager.fillReport(fileName, hm, dataSource);
            } else {
                dataSource = new JRBeanCollectionDataSource(lista);
                print = JasperFillManager.fillReport(fileName, hm, dataSource);
            }
        } catch (JRException e) {
            log.severe("Error de Jasper: " + e.getMessage());
            throw new Exception("Error de Jasper: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    log.severe("SQLException: " + e.getMessage());
                    throw new Exception("SQLException: " + e.getMessage());
                }
            }
        }
    }

    /**
     * getReport
     * @param out del ServletOutputStream
     * @param tipo : Indica el formato o extension del reporte (i.e. .pdf, .excel, .html, .xml, .odt)
     * @return ServletOutputStream
     */
    public ServletOutputStream getReport(ServletOutputStream out, FormatType tipo) {
        exporter = crearObjetoExportar(tipo);
        return (ServletOutputStream) generarReporte(out);
    }

    /**
     * getReport
     * @param out del tipo PrintWriter
     * @param tipo : Indica el formato o extension del reporte (i.e. .pdf, .excel, .html, .xml, .odt)
     * @return PrintWriter
     */
    public PrintWriter getReport(PrintWriter out, FormatType tipo) {
        exporter = crearObjetoExportar(tipo);
        return (PrintWriter) generarReporte(out);
    }

    /**
     * getReport
     * @param out del tipo File
     * @param tipo : Indica el formato o extension del reporte (i.e. .pdf, .excel, .html, .xml, .odt)
     * @return File
     */
    public File getReport(File out, FormatType tipo) {
        exporter = crearObjetoExportar(tipo);
        return (File) generarReporte(out);
    }

    /**
     * generarReporte
     * @param out
     * @return OutputStream
     */
    private OutputStream generarReporte(OutputStream out) {

        try {
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
            exporter.exportReport();
        } catch (JRException e) {
            log.severe("JRException: " + e.getMessage());
        } catch (Exception e) {
            log.severe("Exception: " + e.getMessage());
        }
        return out;
    }

    /**
     * generarReporte
     * @param out
     * @return Writer
     */
    private Writer generarReporte(Writer out) {

        try {
            exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
            exporter.exportReport();
        } catch (JRException e) {
            log.severe("JRException: " + e.getMessage());
        }
        return out;
    }

    /**
     * generarReporte
     * @param out
     * @return File
     */
    private File generarReporte(File out) {

        try {
            exporter.setParameter(JRExporterParameter.OUTPUT_FILE, out);
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
            exporter.exportReport();
        } catch (JRException e) {
            log.severe("JRException: " + e.getMessage());
        }
        return out;
    }

    /**
     * getViewerReport
     * Obtiene el visor de report propio del Jasper
     * @param print
     */
    @SuppressWarnings("deprecation")
    public void getViewerReport(JasperPrint print) {
        JasperViewer jviewer = new JasperViewer(print, false);
        jviewer.show();
    }

    /**
     * crearObjetoExportar
     * Crea el objeto a exportar por el Jasper.
     * 1:PDF, 2:RTF, 3:EXCEL, 4:XML, 5:ODT, 6:CSV, 7:TEXT, default:HTML
     * @param tipo FormatType
     * @return JRExporter
     */
    private JRExporter crearObjetoExportar(FormatType tipo) {

        JRExporter export = null;

        switch (tipo) {
            case HTML:
                export = new JRHtmlExporter();
                export.setParameter(JRHtmlExporterParameter.IMAGES_URI, "image?image=");
                export.setParameter(JRHtmlExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.TRUE);
                export.setParameter(JRHtmlExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
                break;
            case PDF:
                export = new JRPdfExporter();
                break;
            case XLS:
                export = new JExcelApiExporter();
                export.setParameter(JRExporterParameter.JASPER_PRINT, print);
                export.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
                export.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS, Boolean.TRUE);
                export.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
                export.setParameter(JRXlsExporterParameter.IS_IGNORE_CELL_BORDER, Boolean.TRUE);
                break;
            case CSV:
                export = new JRCsvExporter();
                break;
            default:
                export = new JRHtmlExporter(); 
        }
        return export; 
    }
}

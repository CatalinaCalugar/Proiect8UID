package com.spr.utils;

/**
 * Created by Catalina on 14.04.2017.
 */
public class ReportFactory {
    public Report getShape(String shapeType) {
        if (shapeType == null) {
            return null;
        }
        if (shapeType.equalsIgnoreCase("PDF")) {
            return new PdfReport();

        } else if (shapeType.equalsIgnoreCase("CSV")) {
            return new CsvReport();
        }
        return null;
    }
}

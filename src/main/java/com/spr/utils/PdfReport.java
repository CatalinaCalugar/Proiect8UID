package com.spr.utils;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.spr.model.Contract;
import com.spr.model.Employee;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

/**
 * Created by Catalina on 14.04.2017.
 */
public class PdfReport implements Report {
    @Override
    public void generate(Contract contract, Employee client, Float total) {
        Document document = new Document();
        String pdfFilePath = "E:\\Catalina\\AnIII_Sem2\\SD\\Lab\\Project\\proiect\\";
        String pdfFile = "Contract" + contract.getId().toString() + ".pdf";
        String path = new File(".").getAbsolutePath();
        try {
            PdfWriter.getInstance(document, new FileOutputStream(path+pdfFile));
            document.open();
            document.add(new Paragraph("Contract: " + contract.getDate().toString()));
            document.add(new Paragraph("ID: " + contract.getId().toString()));
            document.add(new Paragraph("Description: " + contract.getDescription()));
            document.add(new Paragraph("      "));
//            document.add(new Paragraph("Adoption: " + adoption.getAdoptionDate().toString()));
//            document.add(new Paragraph("Client CNP: " + client.getCNP()));
//            document.add(new Paragraph("Client Name: " + client.getFname() + " " + client.getLname()));
//            document.add(new Paragraph("Client Email: " + client.getEmail()));
//            document.add(new Paragraph("Client Address: " + client.getAddress()));
//            document.add(new Paragraph("      "));
//            document.add(new Paragraph("Employee ID: " + adoption.getIdEmployee().toString()));
            document.add(new Paragraph("      "));
            document.add(new Paragraph("Total: " + total + " lei"));
            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}

package ports.controllers;

import com.itextpdf.text.BaseColor;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Element;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpSession;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import javafx.scene.text.TextAlignment;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletContext;
import java.util.*;
import ports.models.*;

public class generatePDF extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("PDF IS STARTING");
        ServletContext sc = request.getServletContext();
        //String selectedSort = request.getParameter("arrange");

        PortsDatabase ports = (PortsDatabase) sc.getAttribute("dbConnection");

        //IDENTIFYING THE FILENAME
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MMddyyyyHHmmss");
        LocalDateTime now = LocalDateTime.now();
        String fileName = "one";//dtf.format(now) + ".pdf";

        //NAMING THE FILE
        response.setContentType("application/pdf;charset=UTF-8");
        response.addHeader("Content-Disposition", "inline; filename=" + fileName);

        //CREATING THE PDF
        Document document = new Document();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        Rectangle rect = new Rectangle(PageSize.LETTER.rotate());
        document.setPageSize(rect);
        //Margin Parameters: Left, Right, Top, Bottom
        document.setMargins(25, 25, 30, 30);

        try {
            PdfWriter.getInstance(document, baos);
            ServletOutputStream out = response.getOutputStream();
            document.open();
            Paragraph paragraph = new Paragraph();
            paragraph.setAlignment(com.itextpdf.text.Element.ALIGN_CENTER);

            //GETTING THE TOTAL NUMBER OF PAGES
//            rs.last();
//            int rows = rs.getRow();
//            //HOW MANY ROWS PER TABLE PER PAGE
//            int rowPerPage = 22;
//            int totalPages = (int) Math.ceil(rows / rowPerPage);
//            if (rows % rowPerPage != 0) {
//                totalPages++;
//            }
//            rs.first();
//            rs.previous();
            //THIS IS TO DETERMINE WHAT IS THE CURRENT TIME AND DATE TO BE PLACED IN FOOTER
            //DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern(" MM/dd/yyyy | HH:mm");
            //String dateTime = dtf2.format(now);

            //for (int x = 1; x <= totalPages; x++) { //pages
            paragraph.add(getServletContext().getInitParameter("header"));
            paragraph.add(Chunk.NEWLINE);
            PdfPTable table = new PdfPTable(9);
            float[] columnWidths = {1f, 1.25f, 1f, 1.5f, 1f, 1f, 1.5f, 1f, 1f};
            table.setWidths(columnWidths);
            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

            table.addCell("Order ID");
            table.addCell("Date");
            table.addCell("Product ID");
            table.addCell("Product Name");
            table.addCell("Quantity");
            table.addCell("Toppings ID");
            table.addCell("Toppings");
            table.addCell("Toppings Quantity");
            table.addCell("Total Price");

            //int yy = 0;
            //for (int y = 1; y <= rowPerPage && rs.next(); y++) {//table rows
            //yy = y;
            
            ArrayList<Order> orderList = (ArrayList) ports.getOrderSales("order_ID");
            for (Order i : orderList) {
                ArrayList<OrderItem> orderItems = i.getItems();

                List orderID = new List();
                List deliveryDate = new List();
                List productID = new List();
                List productName = new List();
                List productQuantity = new List();
                List toppingsID = new List();
                List toppingsName = new List();
                List toppingsQuantity = new List();
                List orderTotal = new List();

                orderID.add(new ListItem(String.valueOf(i.getOrder_Id())));
                deliveryDate.add(new ListItem(i.getOrder_Delivery_Date()));

                for (OrderItem j : orderItems) {
                    ArrayList<OrderItemToppings> orderItemToppings = j.getToppings();

                    productID.add(new ListItem(String.valueOf(j.getProduct().getId())));
                    productName.add(new ListItem(String.valueOf(j.getProduct().getName())));
                    productQuantity.add(new ListItem(String.valueOf(j.getQuantity())));

                    if (j.getToppings().size() == 0) {
                        toppingsName.add(new ListItem("No Toppings"));
                    }
                    for (OrderItemToppings k : orderItemToppings) {
                        System.out.println("TOPPINGS");
                        toppingsID.add(new ListItem(String.valueOf(k.getTopping().getId())));
                        toppingsName.add(new ListItem(String.valueOf(k.getTopping().getName())));
                        toppingsQuantity.add(new ListItem(String.valueOf(k.getQuantity())));
                    }
                }
                orderTotal.add(new ListItem(String.valueOf(i.getOrder_Total())));
                
                Phrase oIDPhrase = new Phrase();
                oIDPhrase.add(orderID);
                PdfPCell oIDPhraseCell = new PdfPCell();
                oIDPhraseCell.addElement(oIDPhrase);
                table.addCell(oIDPhraseCell);

                Phrase dDatePhrase = new Phrase();
                dDatePhrase.add(deliveryDate);
                PdfPCell dDatePhraseCell = new PdfPCell();
                dDatePhraseCell.addElement(dDatePhrase);
                table.addCell(dDatePhraseCell);

                Phrase pIDPhrase = new Phrase();
                pIDPhrase.add(productID);
                PdfPCell pIDPhraseCell = new PdfPCell();
                pIDPhraseCell.addElement(pIDPhrase);
                table.addCell(pIDPhraseCell);

                Phrase pNamePhrase = new Phrase();
                pNamePhrase.add(productName);
                PdfPCell pNamePhraseCell = new PdfPCell();
                pNamePhraseCell.addElement(pNamePhrase);
                table.addCell(pNamePhraseCell);

                Phrase pQuantityPhrase = new Phrase();
                pQuantityPhrase.add(productQuantity);
                PdfPCell pQuantityPhraseCell = new PdfPCell();
                pQuantityPhraseCell.addElement(pQuantityPhrase);
                table.addCell(pQuantityPhraseCell);

                Phrase tIDPhrase = new Phrase();
                tIDPhrase.add(toppingsID);
                PdfPCell tIDPhraseCell = new PdfPCell();
                tIDPhraseCell.addElement(tIDPhrase);
                table.addCell(tIDPhraseCell);

                Phrase tNamePhrase = new Phrase();
                tNamePhrase.add(toppingsName);
                PdfPCell tNamePhraseCell = new PdfPCell();
                tNamePhraseCell.addElement(tNamePhrase);
                table.addCell(tNamePhraseCell);

                Phrase tQuantityPhrase = new Phrase();
                tQuantityPhrase.add(toppingsQuantity);
                PdfPCell tQuantityPhraseCell = new PdfPCell();
                tQuantityPhraseCell.addElement(tQuantityPhrase);
                table.addCell(tQuantityPhraseCell);

                Phrase oTotalPhrase = new Phrase();
                oTotalPhrase.add(orderTotal);
                PdfPCell oTotalPhraseCell = new PdfPCell();
                oTotalPhraseCell.addElement(oTotalPhrase);
                table.addCell(oTotalPhraseCell);
            }
            //}
            paragraph.add(table);
            //provides new lines to the docs if the table does not touch the bottom of the document
            //while (yy != 24) {
            //    yy++;
            //    paragraph.add(Chunk.NEWLINE);
            //}
            //paragraph.add(getServletContext().getInitParameter("footer").toString());
            //paragraph.add(" | ");
            //paragraph.add(" Report by: " + "ADMIN" + " | ");
            //paragraph.add(dateTime);
            //paragraph.add(" | Page " + x + " of " + totalPages);
            //paragraph.add(Chunk.NEWLINE);
            //}
            document.add(paragraph);
            document.close();

            baos.writeTo(out);
            out.flush();
            out.close();

            System.out.println("PDF IS DONE AND PRINTED");
        } catch (Exception e) {
            e.printStackTrace();
        }

        //GENERATE ALL RECORDS REPORT
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

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
import com.itextpdf.text.Image;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Element;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfTemplate;
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
        String fileName = dtf.format(now) + ".pdf";

        //NAMING THE FILE
        response.setContentType("application/pdf;charset=UTF-8");
        response.addHeader("Content-Disposition", "inline; filename=" + fileName);

        //CREATING THE PDF
        Document document = new Document();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        Rectangle rect = new Rectangle(PageSize.LETTER.rotate());
        document.setPageSize(rect);
        //Margin Parameters: Left, Right, Top, Bottom
        document.setMargins(25, 25, 50, 40);

        try {
            PdfWriter writer = PdfWriter.getInstance(document, baos);
            ServletOutputStream out = response.getOutputStream();
            writer.setPageEvent(new MyPageEventListener());
            document.open();
            Paragraph paragraph = new Paragraph();
            paragraph.setAlignment(com.itextpdf.text.Element.ALIGN_CENTER);

            //GETTING THE TOTAL NUMBER OF PAGES
            int maxRows = 0;

            ArrayList<Order> orderList = (ArrayList) ports.getOrderSales("order_ID");
            for (Order i : orderList) {
                ArrayList<OrderItem> orderItems = i.getItems();
                for (OrderItem j : orderItems) {
                    if (i.getItems().size() > j.getToppings().size()) {
                        maxRows = i.getItems().size();
                    } else {
                        maxRows = j.getToppings().size();
                    }
                }
            }
//            //HOW MANY ROWS PER TABLE PER PAGE
//            int rowPerPage = 22;
//            int totalPages = (int) Math.ceil(rows / rowPerPage);
//            if (rows % rowPerPage != 0) {
//                totalPages++;
//            }

            paragraph.add(Chunk.NEWLINE);
            paragraph.add(Chunk.NEWLINE);
            PdfPTable table = new PdfPTable(9);
            float[] columnWidths = {1f, 1.25f, 1f, 1.5f, 1f, 1f, 1.5f, 1f, 1f};
            table.setWidths(columnWidths);
            table.setTotalWidth(document.right() - document.left());
            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

            //int yy = 0;
            //for (int y = 1; y <= rowPerPage && rs.next(); y++) {//table rows
            //yy = y;
            for (Order i : orderList) {
                ArrayList<OrderItem> orderItems = i.getItems();

                List orderID = new List();
                orderID.setListSymbol(" ");
                List deliveryDate = new List();
                deliveryDate.setListSymbol(" ");
                List productID = new List();
                productID.setListSymbol(" ");
                List productName = new List();
                productName.setListSymbol(" ");
                List productQuantity = new List();
                productQuantity.setListSymbol(" ");
                List toppingsID = new List();
                toppingsID.setListSymbol(" ");
                List toppingsName = new List();
                toppingsName.setListSymbol(" ");
                List toppingsQuantity = new List();
                toppingsQuantity.setListSymbol(" ");
                List orderTotal = new List();
                orderTotal.setListSymbol(" ");

                ListItem orderIDItem = new ListItem(String.valueOf(i.getOrder_Id()));
                orderIDItem.setAlignment(Element.ALIGN_CENTER);
                orderID.add(orderIDItem);

                ListItem deliveryDateItem = new ListItem(i.getOrder_Delivery_Date());
                deliveryDateItem.setAlignment(Element.ALIGN_CENTER);
                deliveryDate.add(deliveryDateItem);

                for (OrderItem j : orderItems) {
                    ArrayList<OrderItemToppings> orderItemToppings = j.getToppings();

                    ListItem productIDItem = new ListItem(String.valueOf(j.getProduct().getId()));
                    productIDItem.setAlignment(Element.ALIGN_CENTER);
                    productID.add(productIDItem);

                    ListItem productNameItem = new ListItem(String.valueOf(j.getProduct().getName()));
                    productNameItem.setAlignment(Element.ALIGN_CENTER);
                    productName.add(productNameItem);

                    ListItem productQuantityItem = new ListItem(String.valueOf(j.getQuantity()));
                    productQuantityItem.setAlignment(Element.ALIGN_CENTER);
                    productQuantity.add(productQuantityItem);

                    if (j.getToppings().size() == 0) {
                        ListItem toppingsNameItem = new ListItem("No Toppings");
                        toppingsNameItem.setAlignment(Element.ALIGN_CENTER);
                        toppingsName.add(toppingsNameItem);
                    }
                    for (OrderItemToppings k : orderItemToppings) {
                        ListItem toppingsIDItem = new ListItem(String.valueOf(k.getTopping().getId()));
                        toppingsIDItem.setAlignment(Element.ALIGN_CENTER);
                        toppingsID.add(toppingsIDItem);

                        ListItem toppingsNameItem = new ListItem(String.valueOf(k.getTopping().getName()));
                        toppingsNameItem.setAlignment(Element.ALIGN_CENTER);
                        toppingsName.add(toppingsNameItem);

                        ListItem toppingsQuantityItem = new ListItem(String.valueOf(k.getQuantity()));
                        toppingsQuantityItem.setAlignment(Element.ALIGN_CENTER);
                        toppingsQuantity.add(toppingsQuantityItem);
                    }
                }
                ListItem orderTotalItem = new ListItem(String.valueOf(i.getOrder_Total()));
                orderTotalItem.setAlignment(Element.ALIGN_CENTER);
                orderTotal.add(orderTotalItem);

                Phrase oIDPhrase = new Phrase();
                oIDPhrase.add(orderID);
                PdfPCell oIDPhraseCell = new PdfPCell();
                oIDPhraseCell.addElement(oIDPhrase);
                oIDPhraseCell.setPaddingBottom(10f);
                table.addCell(oIDPhraseCell);

                Phrase dDatePhrase = new Phrase();
                dDatePhrase.add(deliveryDate);
                PdfPCell dDatePhraseCell = new PdfPCell();
                dDatePhraseCell.addElement(dDatePhrase);
                dDatePhraseCell.setPaddingBottom(10f);
                table.addCell(dDatePhraseCell);

                Phrase pIDPhrase = new Phrase();
                pIDPhrase.add(productID);
                PdfPCell pIDPhraseCell = new PdfPCell();
                pIDPhraseCell.addElement(pIDPhrase);
                pIDPhraseCell.setPaddingBottom(10f);
                table.addCell(pIDPhraseCell);

                Phrase pNamePhrase = new Phrase();
                pNamePhrase.add(productName);
                PdfPCell pNamePhraseCell = new PdfPCell();
                pNamePhraseCell.addElement(pNamePhrase);
                pNamePhraseCell.setPaddingBottom(10f);
                table.addCell(pNamePhraseCell);

                Phrase pQuantityPhrase = new Phrase();
                pQuantityPhrase.add(productQuantity);
                PdfPCell pQuantityPhraseCell = new PdfPCell();
                pQuantityPhraseCell.addElement(pQuantityPhrase);
                pQuantityPhraseCell.setPaddingBottom(10f);
                table.addCell(pQuantityPhraseCell);

                Phrase tIDPhrase = new Phrase();
                tIDPhrase.add(toppingsID);
                PdfPCell tIDPhraseCell = new PdfPCell();
                tIDPhraseCell.addElement(tIDPhrase);
                tIDPhraseCell.setPaddingBottom(10f);
                table.addCell(tIDPhraseCell);

                Phrase tNamePhrase = new Phrase();
                tNamePhrase.add(toppingsName);
                PdfPCell tNamePhraseCell = new PdfPCell();
                tNamePhraseCell.addElement(tNamePhrase);
                tNamePhraseCell.setPaddingBottom(10f);
                table.addCell(tNamePhraseCell);

                Phrase tQuantityPhrase = new Phrase();
                tQuantityPhrase.add(toppingsQuantity);
                PdfPCell tQuantityPhraseCell = new PdfPCell();
                tQuantityPhraseCell.addElement(tQuantityPhrase);
                tQuantityPhraseCell.setPaddingBottom(10f);
                table.addCell(tQuantityPhraseCell);

                Phrase oTotalPhrase = new Phrase();
                oTotalPhrase.add(orderTotal);
                PdfPCell oTotalPhraseCell = new PdfPCell();
                oTotalPhraseCell.addElement(oTotalPhrase);
                oTotalPhraseCell.setPaddingBottom(10f);
                table.addCell(oTotalPhraseCell);
            }

            paragraph.add(table);

            document.add(paragraph);
            document.close();

            baos.writeTo(out);
            out.flush();
            out.close();

            System.out.println("PDF IS DONE AND PRINTED");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    class MyPageEventListener extends PdfPageEventHelper {

        public void onEndPage(PdfWriter writer, Document document) {
            DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern(" MM/dd/yyyy | HH:mm");
            LocalDateTime now = LocalDateTime.now();
            String dateTime = dtf2.format(now);

            PdfContentByte cb = writer.getDirectContent();
            PdfPTable table = new PdfPTable(9);
            try {
                float[] columnWidths = {1f, 1.25f, 1f, 1.5f, 1f, 1f, 1.5f, 1f, 1f};
                table.setWidths(columnWidths);
                table.setTotalWidth(document.right() - document.left() - 148);
                table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
                table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
                table.getDefaultCell().setPaddingTop(5f);
                table.getDefaultCell().setPaddingBottom(5f);

                table.addCell("Order ID");
                table.addCell("Date");
                table.addCell("Product ID");
                table.addCell("Product Name");
                table.addCell("Quantity");
                table.addCell("Toppings ID");
                table.addCell("Toppings");
                table.addCell("Toppings Quantity");
                table.addCell("Total Price");
            } catch (DocumentException e) {
                e.printStackTrace();
            }
            
            Phrase header = new Phrase(String.format("PORTS Order Sales History"));
            Phrase footer = new Phrase(String.format("Page %d |%s", writer.getPageNumber(), dateTime));

            table.writeSelectedRows(0, -1, document.left() + 74, document.top() - 14, cb);
            ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, header, (document.right() - document.left()) / 2 + document.leftMargin(), document.top(), 0);
            ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, footer, document.left() + document.leftMargin() + 50, document.bottom(), 0);
        }
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

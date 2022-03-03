//package ports.controllers;
//
////import com.itextpdf.text.BaseColor;
//import java.io.IOException;
//import java.io.PrintWriter;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
////import com.itextpdf.text.Chunk;
////import com.itextpdf.text.Document;
////import com.itextpdf.text.DocumentException;
////import com.itextpdf.text.Element;
////import com.itextpdf.text.PageSize;
////import com.itextpdf.text.Paragraph;
////import com.itextpdf.text.Phrase;
////import com.itextpdf.text.Rectangle;
////import com.itextpdf.text.pdf.PdfPCell;
////import com.itextpdf.text.pdf.PdfPTable;
////import com.itextpdf.text.pdf.PdfWriter;
//import java.io.ByteArrayOutputStream;
//import java.io.FileNotFoundException;
//import java.io.FileOutputStream;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.servlet.ServletConfig;
//import javax.servlet.http.HttpSession;
//import java.time.format.DateTimeFormatter;
//import java.time.LocalDateTime;
//import javafx.scene.text.TextAlignment;
//import javax.servlet.ServletOutputStream;
//import java.util.*;
//
//public class generatePDF extends HttpServlet {
//
//    Connection conn;
//    String query;
//
//    public void init(ServletConfig config) throws ServletException 
//    {
//        super.init(config);
//        try 
//        {	
//            Class.forName(config.getInitParameter("jdbcClassName"));
//            //System.out.println("jdbcClassName: " + config.getInitParameter("jdbcClassName"));
//            //creates the url for database
//            String dbusername = config.getInitParameter("dbUserName");
//            String dbpassword = config.getInitParameter("dbPassword");
//            StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
//                    .append("://")
//                    .append(config.getInitParameter("dbHostName"))
//                    .append(":")
//                    .append(config.getInitParameter("dbPort"))
//                    .append("/")
//                    .append(config.getInitParameter("databaseName"));
//            conn =  DriverManager.getConnection(url.toString(),dbusername, dbpassword);
//        } 
//        catch (SQLException sqle)
//        {
//            System.out.println("SQLException error occured - " + sqle.getMessage());
//        } 
//        catch (ClassNotFoundException nfe)
//        {
//            System.out.println("ClassNotFoundException error occured - " + nfe.getMessage());
//        }
//    }
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        HttpSession session = request.getSession();
//
//        try {
//            //tests if there is a connection
//            if (conn != null) {
//                String uname = session.getAttribute("username").toString();
//
//                //RESULT SET FOR THE USER RECORD
//                query = "SELECT * FROM USERINFO WHERE username=?";
//                PreparedStatement stmt = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
//                stmt.setString(1, uname);
//                ResultSet unameRS = null;
//                unameRS = stmt.executeQuery();
//
//                //RESULT SET FOR ALL THE RECORD
//                query = "SELECT * FROM USERINFO";
//                PreparedStatement stmt2 = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
//                ResultSet allRS = null;
//                allRS = stmt2.executeQuery();
//
//                //IDENTIFYING THE FILENAME
//                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
//                LocalDateTime now = LocalDateTime.now();
//                String fileName = dtf.format(now).toString() + ".pdf";
//
//                //NAMING THE FILE
//                response.setContentType("application/pdf;charset=UTF-8");
//                response.addHeader("Content-Disposition", "inline; filename=" + fileName);
//
//                //CREATING THE PDF
//                Document document = new Document();
//                ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                Rectangle rect = new Rectangle(PageSize.LETTER.rotate());
//                document.setPageSize(rect);
//                document.setMargins(50, 50, 75, 75);
//
//                try {
//                    PdfWriter.getInstance(document, baos);
//                    ServletOutputStream out = response.getOutputStream();
//                    generateReport(document, allRS, uname); // generates pdf for all account in database
//                    baos.writeTo(out);
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//
//                //GENERATE ALL RECORDS REPORT
//            }//if connection != null
//            else {//if connection is null
//                response.sendRedirect("error_connection.jsp");
//            }
//
//        } catch (SQLException sqle) { //SQL related exceptions
//            sqle.printStackTrace();
//        }
//
//    }
//
//    protected void generateReport(Document document, ResultSet rs, String name) {
//        try {
//            document.open();
//            Paragraph paragraph = new Paragraph();
//            paragraph.setAlignment(com.itextpdf.text.Element.ALIGN_CENTER);
//
//            //GETTING THE TOTAL NUMBER OF PAGES
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
//
//            //THIS IS TO DETERMINE WHAT IS THE CURRENT TIME AND DATE TO BE PLACED IN FOOTER
//            DateTimeFormatter dtf = DateTimeFormatter.ofPattern(" MM/dd/yyyy | HH:mm");
//            LocalDateTime now = LocalDateTime.now();
//            String dateTime = dtf.format(now).toString();
//
//            for (int x = 1; x <= totalPages; x++) { //pages
//                paragraph.add(getServletContext().getInitParameter("header").toString());
//                paragraph.add(Chunk.NEWLINE);
//                PdfPTable table = new PdfPTable(5);
//                float[] columnWidths = {0.5f, 1.25f, 0.5f, 1.5f, 1.5f};
//                table.setWidths(columnWidths);
//                table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
//                table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
//                table.addCell("User no.");
//                table.addCell("Username");
//                table.addCell("Role");
//                table.addCell("Email");
//                table.addCell("Contact No.");
//                int yy = 0;
//                for (int y = 1; y <= rowPerPage && rs.next(); y++) {//table rows
//                    yy = y;
//                    String uname = rs.getString("username");
//                    if (name.equals(uname)) {
//                        uname = uname + "*";
//                    }
//                    table.addCell(String.valueOf(rs.getRow()));
//                    table.addCell(uname);
//                    table.addCell(rs.getString("role"));
//                    table.addCell(rs.getString("email"));
//                    table.addCell(rs.getString("contact_number"));
//                }
//                paragraph.add(table);
//                //provides new lines to the docs if the table does not touch the bottom of the document
//                while (yy != 24) {
//                    yy++;
//                    paragraph.add(Chunk.NEWLINE);
//                }
//                paragraph.add(getServletContext().getInitParameter("footer").toString());
//                paragraph.add(" | ");
//                paragraph.add(" Report by: " + name + " | ");
//                paragraph.add(dateTime);
//                paragraph.add(" | Page " + x + " of " + totalPages);
//                paragraph.add(Chunk.NEWLINE);
//            }
//
//            document.add(paragraph);
//            document.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}

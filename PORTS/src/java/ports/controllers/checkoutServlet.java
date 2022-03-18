package ports.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import ports.models.*;

public class checkoutServlet extends HttpServlet {

    Connection conn;

    public void init(ServletConfig config) throws ServletException 
    {
        super.init(config);
        
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException 
    {
        String payment = (request.getParameter("payment"));
        String delivery = (request.getParameter("deliveryDate"));
        String address = (request.getParameter("address"));
        
        String pattern = "MM/dd/yyyy";
        String pattern2 = "yyyy-MM-dd"; 
        DateTimeFormatter formatDate = DateTimeFormatter.ofPattern(pattern);
        LocalDateTime now = LocalDateTime.now();
        String checkoutDate = formatDate.format(now);
       
        Date date=null;
        try {
            date = new SimpleDateFormat(pattern2).parse(delivery);
           
        } catch (ParseException ex) {
            Logger.getLogger(checkoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        String deliveryDate = new SimpleDateFormat(pattern).format(date);
        
        ServletContext app = getServletContext();
    
        HttpSession session =request.getSession();;
                    
                    Customer c = (Customer) session.getAttribute("customer");
                  
                    PortsDatabase port = (PortsDatabase)app.getAttribute("dbConnection");
                    
                   port.checkOutCart(c.getCart(), checkoutDate, deliveryDate, "test", Integer.parseInt(address));
                   //checkOutCart(Cart orderCart, String checkoutDate, String deliveryDate, int address_id)
                   port.clearCartForCheckout(c.getCart().getCart_Id());
                 response.sendRedirect("index.jsp");
                   
                    
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(addAddressServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(addAddressServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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

package ports.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

public class addAddressServlet extends HttpServlet {

    Connection conn;

    public void init(ServletConfig config) throws ServletException 
    {
        super.init(config);
        try 
        {	
            Class.forName(config.getInitParameter("jdbcClassName"));
            //System.out.println("jdbcClassName: " + config.getInitParameter("jdbcClassName"));
            //creates the url for database
            String dbusername = config.getInitParameter("dbUserName");
            String dbpassword = config.getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(config.getInitParameter("dbHostName"))
                    .append(":")
                    .append(config.getInitParameter("dbPort"))
                    .append("/")
                    .append(config.getInitParameter("databaseName"));
            conn =  DriverManager.getConnection(url.toString(),dbusername, dbpassword);
        } 
        catch (SQLException sqle)
        {
            System.out.println("SQLException error occured - " + sqle.getMessage());
        } 
        catch (ClassNotFoundException nfe)
        {
            System.out.println("ClassNotFoundException error occured - " + nfe.getMessage());
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException 
    {
        String addressName = request.getParameter("addressName");
        String street = request.getParameter("street");
        String houseNo = request.getParameter("houseNo");
        String province = request.getParameter("province");
        String postalCode = request.getParameter("postalCode");
        String city = request.getParameter("city");
        String addInfo = request.getParameter("additionalInfo");
        String addDetail = request.getParameter("additionalAddress");
        String idFromWeb="";
        
        String u = "";
        String e = "";
        String id="";
        int insert;
        ServletContext app = getServletContext();
        HttpSession session = null;
        
        
        try
        {   
            if (conn != null) 
            {
                PreparedStatement stmt;
                stmt = conn.prepareStatement("SELECT * FROM customer WHERE customer_id = ?");     
                //stmt.setString(1, username);
                ResultSet records = stmt.executeQuery();
                session = request.getSession();
                    
                while (records.next())
                {
                    id = records.getString("customer_id");
             
                }
            }
            
            else
            {
                response.sendRedirect("error_session.jsp");
            }
        }
        
          catch (SQLException sqle)
        {
            response.sendRedirect("error_session.jsp");
        }
     
         if (addressName.isEmpty() | street.isEmpty() | houseNo.isEmpty() | province.isEmpty()
            | postalCode.isEmpty() | city.isEmpty() )
        {
            app.setAttribute("ErrorMessage", "Please enter the required fields");  
            //throw new SignUpNullException();
        }
         
            try
            {
                if (id.equals(idFromWeb))
                {
                    PreparedStatement stmt2 = conn.prepareStatement
                    ("INSERT INTO USER_INFO (NAME,PASSWORD,ROLE,EMAIL,CITY,LASTNAME,FIRSTNAME) VALUES (?,?,?,?,?,?,?)"); 
//                    stmt2.setString(1,username);
//                    stmt2.setString(2,encrypt);
//                    stmt2.setString(3,role);
//                    stmt2.setString(4,email);
//                    stmt2.setString(5,city);
//                    stmt2.setString(6,lastname);
//                    stmt2.setString(7,firstname);
//                    insert = stmt2.executeUpdate();
                    response.sendRedirect("Login.jsp");
                }
                
                else
                {
                    app.setAttribute("app", "Entered password does not match the Confirmed Password");
                    //throw new SignUpAuthenticationException();
                }
            }
            
            catch (SQLException sqle)
            {
                System.out.println("SQLException error occured - " + sqle.getMessage());
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

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
import ports.models.*;

public class addAddressServlet extends HttpServlet {

    Connection conn;

    public void init(ServletConfig config) throws ServletException 
    {
        super.init(config);
        
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
        
    
   
//        try
//        {   
//            if (conn != null) 
//            {
//                PreparedStatement stmt;
//                stmt = conn.prepareStatement("SELECT * FROM customer WHERE customer_id = ?");     
//                //stmt.setString(1, username);
//                ResultSet records = stmt.executeQuery();
//                session = request.getSession();
//                    
//                while (records.next())
//                {
//                    id = records.getString("customer_id");
//             
//                }
//            }
//            
//            else
//            {
//                response.sendRedirect("error_session.jsp");
//            }
//        }
//        
//          catch (SQLException sqle)
//        {
//            response.sendRedirect("error_session.jsp");
//        }
     
         if (addressName.isEmpty() | street.isEmpty() | houseNo.isEmpty() | province.isEmpty()
            | postalCode.isEmpty() | city.isEmpty() )
        {
            app.setAttribute("ErrorMessage", "Please enter the required fields");  
            //throw new SignUpNullException();
        }
         
         if (id.equals(idFromWeb))
         {
              session = request.getSession();               
              Customer c = (Customer) session.getAttribute("customer");
              int addressId = c.getAddresses().size()+1;
              int cId = c.getCustomer_Id();
              
              String AI = String.valueOf(addressId);
             String CI = String.valueOf(cId);
             
              Address newAdd = new Address(AI,CI,addressName,addInfo,addDetail,houseNo,street,city,province,postalCode);
             PortsDatabase port = (PortsDatabase)app.getAttribute("dbConnection");
             port.addAddress(newAdd);
             response.sendRedirect("address.jsp");
             
             
         }
         
         else
         {
             app.setAttribute("app", "Entered password does not match the Confirmed Password");
             //throw new SignUpAuthenticationException();
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ports.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ports.models.*;
/**
 *
 * @author Kirby Wenceslao
 */
@WebServlet(name = "changePasswordServlet", urlPatterns = {"/changePasswordServlet"})
public class changePasswordServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServletContext sc = request.getServletContext();
        HttpSession session = request.getSession();
        PortsDatabase ports = (PortsDatabase) sc.getAttribute("dbConnection");
        
        //initialize
        Customer c = (Customer) session.getAttribute("customer");
        String oldPassword = request.getParameter("oldPassC").trim();
        String confirmPass = request.getParameter("confirmNewPassC").trim();
        String newPassword = request.getParameter("newPassC").trim();

        int customer_id = c.getCustomer_Id();
        System.out.println("Change Password of Customer_id: "+customer_id);
        
        //check conditions
        System.out.println(oldPassword);
        System.out.println(confirmPass);
        if(!newPassword.equals(confirmPass)){
            //different passwords
            sc.setAttribute("ErrorMessageC", "Passwords do not match. Try again!");
            response.sendRedirect("changePassword.jsp");
        }
        else if (ports.changeCustomerPassword(customer_id, oldPassword, newPassword) == false){
            //old password is incorrect
            sc.setAttribute("ErrorMessageC", "Incorrect old password. Try again!");
            response.sendRedirect("changePassword.jsp");
        }
        else{
            //password was successfully changed
            sc.setAttribute("ErrorMessageC", "Password successfully changed!");
            response.sendRedirect("changePassword.jsp");
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

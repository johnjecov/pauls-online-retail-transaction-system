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
@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServletContext sc = request.getServletContext();
        PortsDatabase ports = (PortsDatabase) sc.getAttribute("dbConnection");
        
        String unameL = request.getParameter("loginUname").trim();
        String pwordL = request.getParameter("loginPass").trim();

        System.out.printf("Username: %s\nPassword: %s", unameL, pwordL);
        
        String loginResult = ports.login(unameL, pwordL);
        HttpSession session = request.getSession();
        
        if(loginResult.equals("employee")) {          
            int id = ports.getUserId(unameL, pwordL);
            
            Employee employee = ports.retrieveEmployeeData(id);
            
            session.setAttribute("employee", employee);
            
            response.sendRedirect("adminOrderList.jsp");
        }
        else if (loginResult.equals("customer")){
            
            System.out.println("CUSTOMERR!!");
            int id = ports.getUserId(unameL, pwordL);
            
            Customer customer = ports.retrieveCustomerData(id);
            
            session.setAttribute("customer", customer);
            
            if(customer.getAddresses().isEmpty())
                response.sendRedirect("address.jsp");
            else
                response.sendRedirect("index.jsp");
        }
        else {
            sc.setAttribute("ErrorMessageL", "Invalid Username/Password. Try again!");
            response.sendRedirect("login.jsp");
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

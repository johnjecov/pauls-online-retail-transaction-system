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
import nl.captcha.Captcha;
import nl.captcha.Captcha.Builder;

public class registerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServletContext sc = request.getServletContext();
        PortsDatabase ports = (PortsDatabase) sc.getAttribute("dbConnection");
        
        String unameR = request.getParameter("unameR").trim();
        String givenNameR = request.getParameter("givenNameR").trim();
        String lastNameR = request.getParameter("lastNameR").trim();            
        String pwordR = request.getParameter("pwordR").trim();
        String cpwordR = request.getParameter("cpwordR").trim();
        String emailR = request.getParameter("emailR").trim();
        String contactR = request.getParameter("contactR").trim();
        String captchaR = request.getParameter("captchaR").trim();
                           
        System.out.printf("Username: %s\nPassword: %s", unameR, pwordR);
        
        String loginResult = ports.login(unameR, pwordR);
        HttpSession session = request.getSession();
        
        //check if user exists
        boolean exists = ports.checkCustomer(unameR);
        if(exists){
            sc.setAttribute("ErrorMessageR", "Username already exists. Try again!");
            response.sendRedirect("register.jsp");
        }
        else {
            //check if same passwords
            if(!pwordR.equals(cpwordR)) {
                sc.setAttribute("ErrorMessageR", "Passwords do not match. Try again!");
                response.sendRedirect("register.jsp");
            }
            else {
                //check if captcha correct
                Captcha cp = (Captcha) session.getAttribute("captchaGenerated");
                
                if(!cp.getAnswer().equals(captchaR)) {
                    sc.setAttribute("ErrorMessageR", "Incorrect Captcha. Try again!");
                    response.sendRedirect("register.jsp");
                } 
                else {
                    System.out.println("Ready to add customer!!");
     
                    Customer customer = ports.addCustomer(unameR, pwordR, lastNameR, givenNameR, emailR, contactR);

                    session.setAttribute("customer", customer);

                    
                    response.sendRedirect("address.jsp");
                }
                
            }
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

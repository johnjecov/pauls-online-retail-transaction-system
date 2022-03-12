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
@WebServlet(name = "confirmeditProductServlet", urlPatterns = {"/confirmeditProductServlet"})
public class confirmEditProductServlet extends HttpServlet {

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
        /*
        <input type = 'text' value = 'add' style = 'display: none;' name = 'productId'>
        <input type = 'text' value = 'pizza' style = 'display: none;' name = 'productType' id = 'editProductId'>
        <input type = "text" placeholder = "Product Image Url" name = "productImageUrl" required>
        <input type = "text" placeholder = "Product Name" name = "productName" required>
        <input type = "text" placeholder = "Product Desc" name = "productDesc" required>
        <input type = "number" min = "0" placeholder = "Product Price" name = "productPrice" required>
        <input type = "number" min = "0" placeholder = "Product Stock" name = "productStock" required>
        <input type = "text" placeholder = "Product Availability" name = "productAvailability" required>
        */
            ServletContext sc = request.getServletContext();
           
            String editModalDisplay = "flex";
            sc.setAttribute("editModalDisplay", editModalDisplay);
            
            String productId = request.getParameter("productId").trim();;
            sc.setAttribute("productId", productId);
            
            String productType = request.getParameter("productType").trim();;
            sc.setAttribute("productType", productType);

            String productUrl = request.getParameter("productImageUrl").trim();;
            sc.setAttribute("productUrl", productUrl);

            String productName = request.getParameter("productName").trim();;
            sc.setAttribute("productName", productName);
          
            String productDesc = request.getParameter("productDesc").trim();;
            sc.setAttribute("productDesc", productDesc);
        
            String productPrice = request.getParameter("productPrice").trim();;
            sc.setAttribute("productPrice", productPrice);
              
            String productStock = request.getParameter("productStock").trim();;
            sc.setAttribute("productStock", productStock);
               
            String productAvailability = request.getParameter("productAvailability").trim();;
            sc.setAttribute("productAvailability", productAvailability);

            response.sendRedirect("editMenuTest.jsp");

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

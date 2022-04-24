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
@WebServlet(name = "updateFServlet", urlPatterns = {"/updateOrderStatus"})
public class updateFServlet extends HttpServlet {

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
        
        //initialize needed.
        ServletContext sc = request.getServletContext();
        PortsDatabase ports = (PortsDatabase) sc.getAttribute("dbConnection");        
        String type = "update_order";
        int order_id = Integer.parseInt(request.getParameter("adminUpdateOrderId").trim());
        int customer_id = Integer.parseInt(request.getParameter("adminUpdateCustomerId").trim());
        String message = "Are you sure that you want to update the order status of order number "+order_id+"?";
        //set attributes and redirect
        System.out.println("Mag uupdate ng Order Status si "+order_id);
        sc.setAttribute("adminModalDisplay", "flex");
        sc.setAttribute("adminUpdateType", type);
        sc.setAttribute("adminModalMessage", message);
        sc.setAttribute("adminUpdateOrderId", order_id);
        sc.setAttribute("adminUpdateCustomerId", customer_id);

        response.sendRedirect("adminOrderList.jsp");
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

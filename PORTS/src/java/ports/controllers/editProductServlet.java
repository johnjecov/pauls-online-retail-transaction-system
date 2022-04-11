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
@WebServlet(name = "editProductServlet", urlPatterns = {"/editProductServlet"})
public class editProductServlet extends HttpServlet {

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

        System.out.println("Pumasok dito");
        String productId =  (String) sc.getAttribute("productId");
        sc.removeAttribute("productId");

        String productType = (String) sc.getAttribute("productType");
        sc.removeAttribute("productType");

        String productUrl = (String) sc.getAttribute("productUrl");
        sc.removeAttribute("productUrl");
        
        String format = "https://drive.google.com/uc?export=view&id=";
        
        if(productUrl.contains("drive.google")){
            String splitter[] = productUrl.split("/");
            String forId = splitter[5];
            productUrl = format + forId;
        }
        
        String productName = (String) sc.getAttribute("productName");
        sc.removeAttribute("productName");

        String productDesc = (String) sc.getAttribute("productDesc");
        sc.removeAttribute("productDesc");

        String productPrice = (String) sc.getAttribute("productPrice");
        sc.removeAttribute("productPrice");

        String productStock = (String) sc.getAttribute("productStock");
        sc.removeAttribute("productStock");

        String productAvailability = (String) sc.getAttribute("productAvailability");
        sc.removeAttribute("productAvailability");
        
        PortsDatabase ports = (PortsDatabase) sc.getAttribute("dbConnection");
        if(productId.equals("add")){
            //add the record
            if(productType.equals("pizza")){
                //add the pizza
                Product p = new Product(-9, productName, Integer.parseInt(productStock), productType, productDesc, productUrl, productAvailability, Double.parseDouble(productPrice));
                ports.addProduct(p);
            }
            else {
                //add the topping
                Topping t = new Topping(-9, productName, Integer.parseInt(productStock), productDesc, productUrl, productAvailability, Double.parseDouble(productPrice));
                ports.addTopping(t);
            }
        }
        else {
            //update the record
            if(productType.equals("pizza")){
                //update the pizza
                Product p = new Product(Integer.parseInt(productId), productName, Integer.parseInt(productStock), productType, productDesc, productUrl, productAvailability, Double.parseDouble(productPrice));
                ports.updatePizza(p);                
            }
            else {
                //update  the topping
                Topping t = new Topping(Integer.parseInt(productId), productName, Integer.parseInt(productStock), productDesc, productUrl, productAvailability, Double.parseDouble(productPrice));
                ports.updateTopping(t);
            }            
        }
        response.sendRedirect("editMenu.jsp");
        

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

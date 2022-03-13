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

public class addToCartServlet extends HttpServlet {

    Connection conn;

    public void init(ServletConfig config) throws ServletException 
    {
        super.init(config);
        
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException 
    {
        String quantity = (request.getParameter("quan"));
        String pizza = request.getParameter("pizza");
        String[] toppingsValues = request.getParameterValues("toppings");
       
        ServletContext app = getServletContext();
    
        HttpSession session =request.getSession();;
                    
                    Customer c = (Customer) session.getAttribute("customer");
           
                    PortsDatabase port = (PortsDatabase)app.getAttribute("dbConnection");
                    ArrayList<CartItemToppings>  orderedToppings = new ArrayList<>();
                    
                    ArrayList<Product> menu = port.getProducts();
                    Product pizzai = menu.get(Integer.parseInt(pizza)-1);
                    
               
                  
                    for(int b=0; b < port.getToppings().size(); b++)
                    {
                          System.out.print(Arrays.toString(toppingsValues));
                          
                          System.out.print((toppingsValues[b]));
                        if( Integer.parseInt(toppingsValues[b]) > 0)
                        {
                            orderedToppings.add( new CartItemToppings(b+1,(Topping)(port.getToppings().get(b)),Integer.parseInt(toppingsValues[b]) ));
                       }
                    }
                    
                    
                    CartItem productOrder = new CartItem(c.getCart().getItems().size()+1, c.getCart().getCart_Id(), pizzai, orderedToppings, Integer.parseInt(quantity));
                    System.out.print("hellooooo"+productOrder.getProduct());
                
                    //Product testProduct = new Product(1, "Pepperoni", 15, "Pizza", "Delicious", "/test.jpg", "available", 149);
                    //Topping testTopping = new Topping(1, "Cheese", 40, "Cheesiest Cheese", "/testTopping.jpg", "available", 15);
                    //CartItemToppings(int cartItemToppingsId, Topping topping, int quantity)
                   
                    //CartItem(int cartItemId, int cartId, Product pizza, ArrayList<CartItemToppings> toppings, int quantity)
                    
                    //CartItem ci = new CartItem(1,1, testProduct,noToppings,2);
                    //Cart(int cart_id, int customer_id, double cart_total, ArrayList<CartItem> items);
                    
                    //addItemToCart(int cart_id, CartItem item)
                    c.getCart().addToCart(port, productOrder);
                   System.out.print("PLSSSSSSSSSSSS");
                    
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

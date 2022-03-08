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
        String moz = (request.getParameter("moz"));
        String ham = (request.getParameter("ham"));
        String par = (request.getParameter("par"));
        String spi = (request.getParameter("spi"));
        String cre = (request.getParameter("cre"));
    
        String pizza = request.getParameter("pizza");
        
        String idFromWeb="";
        
        String u = "";
        String e = "";
        String id="";
        int quantity=1;
        int insert=0;
        ServletContext app = getServletContext();
      
        HttpSession session = null;
                    
        
                    PortsDatabase port = (PortsDatabase)app.getAttribute("dbConnection");
                    Product orderedPizza = null;
                    ArrayList<CartItemToppings>  orderedToppings = new ArrayList<>();
                    
            
                    for(int i=0; port.getProducts().size() > i; i++)
                    {
                        if(pizza.equalsIgnoreCase(((Product)(port.getProducts().get(i))).getName()))
                        {
                           orderedPizza = ((Product)(port.getProducts().get(i)));
                          
                           if(!moz.equals("0"))
                           {
                               for(int a=0; port.getToppings().size() > a; a++)
                                {
                                    if("cheese".equals(((Topping)(port.getToppings().get(a))).getName()))
                                        orderedToppings.add( new CartItemToppings(1,(Topping)(port.getToppings().get(a)),Integer.parseInt(moz)));
                                }
                           }
                           break;
                   
                        }
                    }
                   
                    CartItem productOrder = new CartItem(2, 1, orderedPizza, orderedToppings, quantity);
                    //Product testProduct = new Product(1, "Pepperoni", 15, "Pizza", "Delicious", "/test.jpg", "available", 149);
                    //Topping testTopping = new Topping(1, "Cheese", 40, "Cheesiest Cheese", "/testTopping.jpg", "available", 15);
                    //CartItemToppings(int cartItemToppingsId, Topping topping, int quantity)
                   
                    //CartItem(int cartItemId, int cartId, Product pizza, ArrayList<CartItemToppings> toppings, int quantity)
                    
                    //CartItem ci = new CartItem(1,1, testProduct,noToppings,2);
                    //Cart(int cart_id, int customer_id, double cart_total, ArrayList<CartItem> items);
                    
                    //addItemToCart(int cart_id, CartItem item)
                   port.addItemToCart(1, productOrder);
                   System.out.print(((Product)(port.getProducts().get(0))).getName());
                   System.out.print(pizza+"<<<<<<<<<<<<<<<<<<<<<<<<<<");
                    
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

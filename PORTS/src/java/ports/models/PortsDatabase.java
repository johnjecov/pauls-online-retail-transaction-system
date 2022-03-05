package ports.models;

import java.sql.*;
import java.sql.DatabaseMetaData;
import java.text.SimpleDateFormat;
import java.util.*;
import java.text.SimpleDateFormat;
import java.util.Date;
public class PortsDatabase {
    static Connection portsConnection;  
    ArrayList<Product> products;
    ArrayList<Topping> toppings;
    ArrayList<String> order_status;
    public PortsDatabase(Connection con){
        setConnection(con);
        System.out.println("database connection created");
        
        //Code sample for testing cart
        int testCartId = 1;
        CartItem testItem1;
        CartItem testItem2;
        Product testProduct = new Product(1, "Pepperoni", 15, "Pizza", "Delicious", "/test.jpg", "available", 149);
        Topping testTopping = new Topping(1, "Cheese", 40, "Cheesiest Cheese", "/testTopping.jpg", "available", 15);
        ArrayList<CartItemToppings> noToppings = new ArrayList<>();
        
        ArrayList<CartItemToppings> withToppings = new ArrayList<>();
        withToppings.add(new CartItemToppings(-1, testTopping, 2));
        //clearCartForCheckout(1);
        //System.out.println(getCartData(1));
        /*
        testItem1 = new CartItem(-1, 1, testProduct, noToppings, 1);
        System.out.println("Umabot dito");
        addItemToCart(1, testItem1);
        */
        
        
        //removeFromCart(1, 1);
        //Cart checkoutCart = getCartData(1);
        //testItem2 = new CartItem(-1, 1, testProduct, withToppings, 1);
        //checkoutCart.addToCart(this, testItem2);
        //addItemToCart(1, testItem2);
        
        //test getting the actual cart on startup
        //test checkout
        Cart checkoutCart = getCartData(1);
        System.out.println(checkoutCart.getCart_Total());
        
        
        Order test = getOrderData(1);
        System.out.println(test);
        //checkoutCart.clearCart(this);
        //checkoutCart.checkOut(this, "testDate", "deliveryDate");
        //System.out.println(checkoutCart.getCart_Total());
        //checkoutCart.clearCart(this);
        
        //setCartTotal(checkoutCart.getCart_Id(), checkoutCart.computeTotal());
        //System.out.println(checkoutCart);
        
        //checkOutCart(checkoutCart, "TestCheckoutDate", "TestDeliveryDate");
    }
    
    public void displayTables() {
        System.out.println("Print here the tables.");
        try {
            DatabaseMetaData portsMetaData  = portsConnection.getMetaData();
            String[] types = {"TABLE"};
            ResultSet results = portsMetaData.getTables(null,null,"%",types);
            while(results.next()){
                System.out.println(results.getString("TABLE_NAME"));
            }
            System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            System.out.println("~~~~~~~~~~~~~~~~TEST CART ADD~~~~~~~~~~~~~~~~");
        
        }
        catch (SQLException sqle)
        {
            System.out.println("SQLException error occured - " + sqle.getMessage());
        } 
    }
    
    
    //database commands for address
    public void addAddress(Address a){
        System.out.print("TEST ADD ADDRESS");
        int id = 1;
        String query1 = "SELECT address_id FROM address order by 'address_id' desc";
        String query2 = "INSERT INTO address VALUES(?,?,?,?,?,?,?,?,?,?)";
     
        
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query1);
            
            ResultSet results = ps.executeQuery();
            
            if(results.next())
            {
                id = Integer.parseInt(results.getString("address_id")) + 1;
                
            }
            
            a.setAddressId(String.valueOf(id));
            
            ps = portsConnection.prepareStatement(query2);
            ArrayList toAdd = (ArrayList) a.getAddressInfo();
            ps.setInt(1, id);
            ps.setInt(2, Integer.parseInt(a.getCustomerId()));
            ps.setString(3, a.getAddressName());
            ps.setString(4, a.getDetails());
            ps.setString(5, a.getAdditionalDetails());
            ps.setString(6, a.getHouseNo());
            ps.setString(7, a.getStreet());
            ps.setString(8, a.getCity());
            ps.setString(9, a.getProvince());
            ps.setString(10, a.getPostalCode());
            
            //update the database
            ps.executeUpdate();
            System.out.println("added this record on address table");
            for(int i = 0; i < toAdd.size(); i++)
            {
                System.out.print(toAdd.get(i)+", ");
            }
            System.out.println();
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
    
    public void removeAddress(int addressId){
        System.out.print("TEST remove ADDRESS");

        String query = "DELETE FROM address where address_id = ?";

        try {
            PreparedStatement ps = portsConnection.prepareStatement(query);
            ps.setInt(1, addressId);
            ps.executeUpdate();
            System.out.println("Address id: "+addressId+" removed");
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
    
     
    public ArrayList getAddresses(int customerID){
        System.out.print("TEST get ADDRESSES");
        String query1 = "SELECT * FROM address order by 'address_id' asc";
     
        ArrayList<Address> addresses = new ArrayList<>();
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query1);
            
            ResultSet results = ps.executeQuery();
            
            
            
            while(results.next()){
                addresses.add(
                        new Address(results.getString("address_id"),
                        results.getString("customer_id"),
                        results.getString("address_name"),
                        results.getString("address_details"),
                        results.getString("additional_details"),
                        results.getString("house_no"),
                        results.getString("street"),
                        results.getString("city"),
                        results.getString("province"),
                        results.getString("postal_code")
                        ));
            }
    
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
        return addresses;
    }
    
    
    //database commands for products
    public void addProduct(Product a){
        System.out.print("TEST ADD Product");

        String query = "INSERT INTO products (product_name, product_stock, product_type,"
                + " product_desc, product_image, product_availability, product_price) VALUES(?,?,?,?,?,?,?)";
     
        
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query);
            ps.setString(1, a.getName());
            ps.setInt(2, a.getStock());
            ps.setString(3, a.getType());
            ps.setString(4, a.getDesc());
            ps.setString(5, a.getImage());
            ps.setString(6, a.getAvailability());
            ps.setDouble(7, a.getPrice());
            
            //update the database
            ps.executeUpdate();
            System.out.println("added this record on products table");
            System.out.println(a);
            
            products.add(a);
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
    
    public void removeProduct(int productId){
        System.out.print("TEST remove product");

        String query = "DELETE FROM products where product_id = ?";

        try {
            PreparedStatement ps = portsConnection.prepareStatement(query);
            ps.setInt(1, productId);
            ps.executeUpdate();
            System.out.println("Product id: "+productId+" removed");
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
    
    public ArrayList getProducts(){
        System.out.print("TEST get Products");
        String query1 = "SELECT * FROM products order by 'product_id' asc";
     
        ArrayList<Product> products = new ArrayList<>();
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query1);
            
            ResultSet results = ps.executeQuery();
            
            while(results.next()){
                products.add(
                        new Product(Integer.parseInt(results.getString("product_id")),
                        results.getString("product_name"),
                        Integer.parseInt(results.getString("product_stock")),
                        results.getString("product_type"),
                        results.getString("product_desc"),
                        results.getString("product_image"),
                        results.getString("product_availability"),
                        Double.parseDouble(results.getString("product_price"))
                        ));
            }      
            
            this.products = products;
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
        return products;
    }
    
    public ArrayList getOrderStats(){
        System.out.print("TEST get order status");
        String query1 = "SELECT * FROM order_status order by 'order_status_id' asc";
     
        ArrayList<String> order_status = new ArrayList<>();
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query1);
            
            ResultSet results = ps.executeQuery();
            
            while(results.next()){
                order_status.add(results.getString("order_status_step"));
            }        
            
            this.order_status = order_status;
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
        return order_status;
    }
    
    //database commands for toppings
     public void addTopping(Topping a){
        System.out.print("TEST ADD topping");

        String query = "INSERT INTO toppings (toppings_name, toppings_stock,"
                + " toppings_desc, toppings_image, toppings_availability, toppings_price) VALUES(?,?,?,?,?,?)";
     
        
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query);
            ps.setString(1, a.getName());
            ps.setInt(2, a.getStock());
            ps.setString(3, a.getDesc());
            ps.setString(4, a.getImage());
            ps.setString(5, a.getAvailability());
            ps.setDouble(6, a.getPrice());
            
            //update the database
            ps.executeUpdate();
            System.out.println("added this record on toppings table");
            System.out.println(a);
            toppings.add(a);
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
    
    public void removeToppings(int toppingId){
        System.out.print("TEST remove product");

        String query = "DELETE FROM toppings where topping_id = ?";

        try {
            PreparedStatement ps = portsConnection.prepareStatement(query);
            ps.setInt(1, toppingId);
            ps.executeUpdate();
            System.out.println("Topping id: "+toppingId+" removed");
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
    
    public ArrayList getToppings(){
        System.out.print("TEST get toppings");
        String query1 = "SELECT * FROM toppings order by 'toppings_id' asc";
     
        ArrayList<Topping> toppings = new ArrayList<>();
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query1);
            
            ResultSet results = ps.executeQuery();
            
            while(results.next()){
                toppings.add(
                        new Topping(Integer.parseInt(results.getString("toppings_id")),
                        results.getString("toppings_name"),
                        Integer.parseInt(results.getString("toppings_stock")),
                        results.getString("toppings_desc"),
                        results.getString("toppings_image"),
                        results.getString("toppings_availability"),
                        Double.parseDouble(results.getString("toppings_price"))
                        ));
            }        
            
            this.toppings = toppings;
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
        return toppings;
    }       
    
    //database functions for cart and order
    
    public void getOrderSales() {
        
    }
    
    public void getOrders() {
        
    }
    
    //for specific customer
    public Order getOrderData(int customer_id){
        
        String query1 = "SELECT * FROM orders where customer_id = ? order by order_id desc";
        String query2 = "SELECT * FROM purchase where order_id = ?";
        String query3 = "SELECT * FROM purchase_toppings where purchase_id = ?";
        
        Order o = new Order();

        try {
            PreparedStatement ps = portsConnection.prepareStatement(query1);
            
            
            ps.setInt(1, customer_id);
            
            ResultSet orderResults = ps.executeQuery();
            int order_id = -999;
            
            if(orderResults.next()){
                System.out.println("Order number ni customer: "+Integer.parseInt(orderResults.getString("order_id")));
                order_id = Integer.parseInt(orderResults.getString("order_id"));
            }
            
            //done getting the info of cart now get the data from the cart purchases
            ps = portsConnection.prepareStatement(query2);
            ps.setInt(1, order_id);
            
            ResultSet purchaseResults = ps.executeQuery();
            ArrayList<OrderItem> items = new ArrayList<>();
            while(purchaseResults.next()){
                int purchase_id = Integer.parseInt(purchaseResults.getString("cart_purchase_id"));
                int product_id = Integer.parseInt(purchaseResults.getString("product_id"));
                int quantity = Integer.parseInt(purchaseResults.getString("product_quantity"));
                
                          
                Product pizza = this.products.get(product_id - 1);
                PreparedStatement ps2 = portsConnection.prepareStatement(query3);
                ps2.setInt(1, purchase_id);
                
                ResultSet forToppings = ps2.executeQuery();
                
                //while loop
                 //create array list for the toppings for the product
                ArrayList<OrderItemToppings> toppings = new ArrayList<>();
                
                while (forToppings.next()){
                    int purchase_toppings_id = Integer.parseInt(forToppings.getString("cart_purchase_toppings_id"));
                    int toppings_id = Integer.parseInt(forToppings.getString("toppings_id"));
                    int toppings_quantity = Integer.parseInt(forToppings.getString("toppings_quantity"));
                    
                    Topping topping = this.toppings.get(toppings_id - 1 );
                    toppings.add(new OrderItemToppings(purchase_toppings_id, topping, toppings_quantity));
              
                }
                
                //add OrderItem
                
                items.add(new OrderItem(purchase_id, order_id, pizza, toppings, quantity));
            }
            
            
            o = new Order(order_id, Integer.parseInt(orderResults.getString("customer_id")), Integer.parseInt(orderResults.getString("employee_id")), 
                    Integer.parseInt(orderResults.getString("order_status_id")), Double.parseDouble(orderResults.getString("order_total")), orderResults.getString("order_made_date"),
                    orderResults.getString("order_delivery_date"), orderResults.getString("payment_method"), orderResults.getString("payment_date"), orderResults.getString("payment_status"),
                    items);
  
            System.out.println("Order of: "+ customer_id);
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
        return o;
    }
    public void clearCartForCheckout(int cart_id){
        System.out.print("TEST clear cart");
        String query1 = "SELECT * FROM cart_purchase where cart_id = ?";
        String query2 = "DELETE FROM cart_purchase_toppings where cart_purchase_id = ?";
        String query3 = "DELETE FROM cart_purchase where cart_id = ?";
        
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query1);
            ps.setInt(1, cart_id);
            
            ResultSet results = ps.executeQuery();
            while(results.next()){
                //loop for deleting all the toppings for each cart item
                int cart_purchase_id = Integer.parseInt(results.getString("cart_purchase_id"));
                
                ps = portsConnection.prepareStatement(query2);
                ps.setInt(1, cart_purchase_id);
                ps.executeUpdate();
                System.out.println("Toppings fo Cart "+cart_purchase_id+" deleted.");
            }
            
            //delete the items of this cart from the cart_purchase 
            ps = portsConnection.prepareStatement(query3);
            ps.setInt(1, cart_id);
     
            ps.executeUpdate();
            System.out.println("Cleared the Cart of: "+ cart_id);
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }       
    }
    
    public void checkOutCart(Cart orderCart, String checkoutDate, String deliveryDate) {
        System.out.println("TEST CHECKOUT OF CART");
        int order_id = -999; //to be changed later
        int cart_id = orderCart.getCart_Id();
        int customer_id = orderCart.getCustomer_Id();
        double order_total = orderCart.getCart_Total();
        
        ArrayList<CartItem> items = orderCart.getItems();
        try {
            //create an order record
            String query1 = "INSERT INTO orders (customer_id, employee_id, order_status_id, order_total, order_made_date, order_delivery_date, payment_method, payment_date, payment_status)"
                    + " VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement psQuery1 = portsConnection.prepareStatement(query1);
            psQuery1.setInt(1, orderCart.getCustomer_Id());
            psQuery1.setInt(2, 1);
            psQuery1.setInt(3, 1);
            psQuery1.setDouble(4, order_total);
            psQuery1.setString(5,  checkoutDate);
            psQuery1.setString(6, deliveryDate);
            psQuery1.setString(7, "GCASH");
            psQuery1.setString(8, "TESTDATE");
            psQuery1.setString(9, "not paid");
            
            psQuery1.executeUpdate();
            System.out.println("Order Created");
            
            //get the latest id of orders
            String query2 = "SELECT order_id FROM orders order by order_id desc";
            PreparedStatement psQuery2 = portsConnection.prepareStatement(query2);
            ResultSet forOrderId = psQuery2.executeQuery();
            
            forOrderId.next();
            order_id = Integer.parseInt(forOrderId.getString("order_id"));
            System.out.println("Andito before sa products part");
             //insert the purchases into the purchase table
            for (int i = 0; i < items.size(); i++) {
                
                CartItem item = items.get(i);
                //gets the latest purchase id before inserting
                int purchase_id = 1;
                String query3 = "SELECT purchase_id FROM purchase order by purchase_id desc";
                PreparedStatement psQuery3 = portsConnection.prepareStatement(query3);
                
                ResultSet forPurchaseId = psQuery3.executeQuery();
                
                if(forPurchaseId.next())
                    purchase_id = Integer.parseInt(forPurchaseId.getString("purchase_id")) + 1;
                
                //insert the actual record
                String query4 = "INSERT INTO purchase (purchase_id, order_id, product_id, product_quantity) VALUES(?,?,?,?)";
                PreparedStatement psQuery4 = portsConnection.prepareStatement(query4);
                psQuery4.setInt(1, purchase_id);
                psQuery4.setInt(2, order_id);
                psQuery4.setInt(3, item.getProduct().getId());
                psQuery4.setInt(4, item.getQuantity());
                
                psQuery4.executeUpdate();
                System.out.println("Purchase +"+purchase_id+" added.");
                
                ArrayList<CartItemToppings> toppings = item.getToppings();
                for(int j = 0; j < toppings.size(); j++) {
                    
                    int purchase_toppings_id = 1;
                    String query5 = "SELECT purchase_toppings_id FROM purchase_toppings order by purchase_toppings_id desc";
                    PreparedStatement psQuery5 = portsConnection.prepareStatement(query5);

                    ResultSet forPurchaseToppingsId = psQuery5.executeQuery();

                    if(forPurchaseToppingsId.next())
                        purchase_toppings_id = Integer.parseInt(forPurchaseId.getString("purchase_toppings_id")) + 1;

                    //insert the actual purchase toppings record
                    CartItemToppings t = toppings.get(i);
                    String query6 = "INSERT INTO purchase_toppings (purchase_toppings_id, purchase_id, toppings_id, toppings_quantity) VALUES(?,?,?,?)";
                    PreparedStatement psQuery6 = portsConnection.prepareStatement(query6);
                    psQuery6.setInt(1, purchase_toppings_id);
                    psQuery6.setInt(2, purchase_id);
                    psQuery6.setInt(3, t.getTopping().getId());
                    psQuery6.setInt(4, t.getQuantity());

                    psQuery6.executeUpdate();
                    System.out.println("Purchase Toppings +"+purchase_toppings_id+" added.");
                }
                
                
            }
           
        }

        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
    
    public Cart getCartData(int customer_id){
        
        String query1 = "SELECT * FROM carts where customer_id = ?";
        String query2 = "SELECT * FROM cart_purchase where cart_id = ?";
        String query3 = "SELECT * FROM cart_purchase_toppings where cart_purchase_id = ?";
        String query4 = "SELECT * FROM products where product_id = ?";
        String query5 = "SELECT * FROM toppings where toppings_id = ?";
        Cart c;
        int cart_id = -999;
        double cart_total = 0;
        
        //insert dummy values before adding actual values from code below;
        c = new Cart(cart_id, customer_id, cart_total, new ArrayList<CartItem>());
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query1);
            
            
            ps.setInt(1, customer_id);
            
            ResultSet results = ps.executeQuery();
          
            if(results.next()){
                System.out.println("Cart number ni customer: "+Integer.parseInt(results.getString("cart_id")));
                cart_id = Integer.parseInt(results.getString("cart_id"));
                System.out.println("Updated cart id "+cart_id);
                cart_total = Double.parseDouble(results.getString("cart_total"));
            }
            
            //done getting the info of cart now get the data from the cart purchases
            ps = portsConnection.prepareStatement(query2);
            ps.setInt(1, cart_id);
            
            results = ps.executeQuery();
            ArrayList<CartItem> items = new ArrayList<>();
            while(results.next()){
                int cart_purchase_id = Integer.parseInt(results.getString("cart_purchase_id"));
                int product_id = Integer.parseInt(results.getString("product_id"));
                int quantity = Integer.parseInt(results.getString("product_quantity"));
                
                //get the specific product and create a product object for the CartItem
                PreparedStatement forProducts = portsConnection.prepareStatement(query4);
                forProducts.setInt(1, product_id);
                ResultSet product = forProducts.executeQuery();
                
                product.next();
                Product pizza = new Product(product_id, product.getString("product_name"), 
                        Integer.parseInt(product.getString("product_stock")), product.getString("product_type"), product.getString("product_desc"),
                        product.getString("product_image"), product.getString("product_availability"), Double.parseDouble(product.getString("product_price")));
                
               
                
                PreparedStatement ps2 = portsConnection.prepareStatement(query3);
                ps2.setInt(1, cart_purchase_id);
                
                ResultSet forToppings = ps2.executeQuery();
                
                //while loop
                 //create array list for the toppings for the product
                ArrayList<CartItemToppings> toppings = new ArrayList<>();
                
                while (forToppings.next()){
                    int cart_purchase_toppings_id = Integer.parseInt(forToppings.getString("cart_purchase_toppings_id"));
                    int toppings_id = Integer.parseInt(forToppings.getString("toppings_id"));
                    int toppings_quantity = Integer.parseInt(forToppings.getString("toppings_quantity"));
                    
                    //get the specific topping and create a topping object for the CartItemTopping
                    PreparedStatement forTopping = portsConnection.prepareStatement(query5);
                    forTopping.setInt(1, toppings_id);
                   
                    ResultSet resultTopping = forTopping.executeQuery();
                    resultTopping.next();
                    Topping topping = new Topping(toppings_id, resultTopping.getString("toppings_name"), Integer.parseInt(resultTopping.getString("toppings_stock")), 
                                           resultTopping.getString("toppings_desc"), resultTopping.getString("toppings_image"), resultTopping.getString("toppings_availability"),
                                           Double.parseDouble(resultTopping.getString("toppings_price")));
                            
                    toppings.add(new CartItemToppings(cart_purchase_toppings_id, topping, toppings_quantity));
              
                }
                
                //add CartItem
                
                items.add(new CartItem(cart_purchase_id, cart_id, pizza, toppings, quantity));
            }
            
            c = new Cart(cart_id, customer_id, cart_total, items);
            
            System.out.println("Cart of: "+ customer_id);
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
        return c;
    }
    
    public void addCart(int customer_id) {
        System.out.print("TEST ADD cart");

        String query = "INSERT INTO cart (customer_id, cart_total) VALUES(?,?)";
        
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query);
            ps.setInt(1, customer_id);
            ps.setDouble(2, 0);
            
            //update the database
            ps.executeUpdate();
            System.out.println("added this record on cart table");
            System.out.println("Cart of: "+ customer_id);
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
    
    public void setCartTotal(int cart_id, double cart_total) {
         System.out.print("TEST edit Total of cart");

        String query = "UPDATE carts SET cart_total = ? WHERE cart_id = ?";
        
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query);
            ps.setDouble(1, cart_total);
            ps.setDouble(2, cart_id);
            
            //update the database
            ps.executeUpdate();
            System.out.println("Change Total of Cart of: "+ cart_id+" into "+cart_total);
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
    
    public void addItemToCart(int cart_id, CartItem item) {
        System.out.print("TEST ADD Item to cart");
        
        String query1 = "INSERT INTO cart_purchase (cart_purchase_id, cart_id, product_id, product_quantity) VALUES(?,?,?,?)";
        String query2 = "INSERT INTO cart_purchase_toppings (cart_purchase_toppings_id, cart_purchase_id, toppings_id, toppings_quantity) VALUES(?,?,?,?)";
        String query3 = "SELECT cart_purchase_id FROM cart_purchase where cart_id = ? order by 'cart_purchase_id' desc";
        String query4 = "SELECT cart_purchase_toppings_id FROM cart_purchase_toppings where cart_purchase_id = ? order by 'cart_purchase_toppings_id' desc";
        int cart_purchase_id = 1;
        try {
            
            //compute the purchase id
            PreparedStatement ps = portsConnection.prepareStatement(query3);
            ps.setInt(1,cart_id);
            ResultSet results = ps.executeQuery();
            
            if(results.next())
            {
                cart_purchase_id = Integer.parseInt(results.getString("cart_purchase_id")) + 1;
                System.out.println("dito ba?");
            }
            
            //add the item to the cart
            System.out.println(item.getProduct());
            ps = portsConnection.prepareStatement(query1);
            ps.setInt(1, cart_purchase_id);
            ps.setInt(2, cart_id);
            ps.setInt(3, item.getProduct().getId());
            ps.setInt(4, item.getQuantity());
            
            //update the database
            ps.executeUpdate();
            item.setId(cart_purchase_id);
         
            //add the toppings for that specific item if there are any
            ArrayList toppings = item.getToppings();
            for(int i = 0; i < toppings.size(); i++) {
                PreparedStatement ps2 = portsConnection.prepareStatement(query2);
                PreparedStatement ps3 = portsConnection.prepareStatement(query4);
                CartItemToppings t = (CartItemToppings) toppings.get(i);
                System.out.println(t);
                //get cartpurchasetoppingsid; 
                int cart_purchase_toppings_id = 1;
                ps3.setInt(1, cart_purchase_id);
                ResultSet results2 = ps3.executeQuery();
                
                if(results.next())
                    cart_purchase_toppings_id = Integer.parseInt(results2.getString("cart_purchase_toppings_id")) + 1;
            
                //insert the cart_purchase_toppings record
                ps2.setInt(1, cart_purchase_toppings_id);
                ps2.setInt(2, cart_purchase_id);
                ps2.setInt(3, t.getTopping().getId());
                ps2.setInt(4, t.getQuantity());
                
                ps2.executeUpdate();
                t.setId(cart_purchase_toppings_id);
            }
            

            System.out.println("added this record on cart purchase table and for the toppings");
            System.out.println("Cart of: "+ cart_id);
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
    

     public void removeFromCart(int cart_id, int cart_purchase_id){
        System.out.print("TEST remove item from cart");

        String query1 = "DELETE FROM cart_purchase_toppings where cart_purchase_id = ?";
        String query2 = "DELETE FROM cart_purchase where cart_purchase_id = ?";

        try {
            //removes the toppings for purchase id first before removing the actual item from the cart_purchase table.
            PreparedStatement ps = portsConnection.prepareStatement(query1);
            ps.setInt(1, cart_purchase_id);
            ps.executeUpdate();
 
            ps = portsConnection.prepareStatement(query2);
            ps.setInt(1, cart_purchase_id);
            ps.executeUpdate();
            
            System.out.printf("Purchase %d removed from cart %d\n", cart_purchase_id, cart_id);
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
     
     
    public void setConnection(Connection con){
        portsConnection = con;
        System.out.println("Ports Set.");
    }
    
    
}

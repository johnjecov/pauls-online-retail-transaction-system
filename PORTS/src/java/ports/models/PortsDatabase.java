package ports.models;

import java.sql.*;
import java.sql.DatabaseMetaData;
import java.util.*;
public class PortsDatabase {
    static Connection portsConnection;
    
    public PortsDatabase(Connection con){
        setConnection(con);
        System.out.println("database connection created");
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
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
        return products;
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
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
        return toppings;
    }       
    
    //database functions for cart
    public void getCartData(int customer_id){
        
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
        //to finish
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
        
        String query1 = "INSERT INTO cart_purchase (cart_purchase_id, cart_id, product_id, product_quantity) VALUES(?, ?,?,?)";
        String query2 = "INSERT INTO cart_purchase_toppings (cart_purchase_id, toppings_id, toppings_quantity) VALUES(?,?,?)";
        String query3 = "SELECT cart_puchase_id FROM cart_purchase where cart_id = ? order by cart_purchase_id desc";
        int cart_purchase_id = 1;
        try {
            
            //compute the purchase id
            PreparedStatement ps = portsConnection.prepareStatement(query1);
            ResultSet results = ps.executeQuery();
            
            if(results.next())
                cart_purchase_id = Integer.parseInt(results.getString("cart_purchase_id")) + 1;
            
            
            //add the item to the cart
            ps = portsConnection.prepareStatement(query1);
            ps.setInt(1, cart_purchase_id);
            ps.setInt(2, cart_id);
            ps.setInt(3, item.getProduct().getId());
            ps.setInt(4, item.getQuantity());
            
         
            //add the toppings for that specific item if there are any
            ArrayList toppings = item.getToppings();
            for(int i = 0; i < toppings.size(); i++) {
                ps = portsConnection.prepareStatement(query2);
                CartItemToppings t = (CartItemToppings) toppings.get(i);
                ps.setInt(1, cart_purchase_id);
                ps.setInt(2, t.getTopping().getId());
                ps.setInt(3, t.getQuantity());
                
            }
            
            //update the database
            ps.executeUpdate();
            System.out.println("added this record on cart table");
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

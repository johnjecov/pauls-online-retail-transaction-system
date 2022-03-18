package ports.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import ports.utility.*;
import java.util.*;

public class Analytics {
    
    private PortsDatabase ports;
    private ArrayList<OrderFeedback> orderFeedbacks;
    private ArrayList<ProductSales> productsSales;
    private ArrayList<ToppingSales> toppingsSales;
    private double totalOrderSales;
    
    public Analytics(PortsDatabase ports){
        this.ports = ports;
        orderFeedbacks = new ArrayList<>();
        totalOrderSales = 0;
        productsSales = new ArrayList<>();
        toppingsSales = new ArrayList<>();
    }
    
    public ArrayList<OrderFeedback> getOrderFeedbacks() {
        ArrayList<Order> orders = ports.getOrderSales("order_id");
        orderFeedbacks = new ArrayList<>();
        for(int i = 0; i < orders.size(); i++){
            Order o = orders.get(i);
            int order_id = o.getOrder_Id();
            ResultSet feedback = ports.getOrderFeedback(order_id);
            try {
                if(feedback.next()){
                    //there is a feedback
                    orderFeedbacks.add(new OrderFeedback(o, Integer.parseInt(feedback.getString("rating")), feedback.getString("comment")));
                }
                else {
                    //no feedback
                    orderFeedbacks.add(new OrderFeedback(o, 0, ""));
                }  
            }
            catch(SQLException sqle){
                System.out.println("SQLException error occured - " + sqle.getMessage());
            }
        } 
        return orderFeedbacks;
    }
    
    public ArrayList<ProductSales> getProductSales(){
        ArrayList<Product> products = ports.getProducts();
        productsSales = new ArrayList<>();
        for(int i = 0; i < products.size(); i++) {
            productsSales.add(new ProductSales(products.get(i),0));
            
        }
        
        ArrayList<Order> orders = ports.getOrderSales("order_id");
        
        for(int i = 0; i < orders.size(); i++){
            Order o = orders.get(i);
            ArrayList<OrderItem> orderItems = o.getItems();
            
            for(int j = 0; j < orderItems.size(); j++){
                OrderItem item = orderItems.get(j);
                int product_id = item.getProduct().getId();
                productsSales.get(product_id-1).updateQuantity(item.getQuantity());
            }
        }
        Collections.sort(productsSales, new popularProducts());
        //then sort descending
        return productsSales;       
    }
    
    
    public ArrayList<ToppingSales> getToppingSales(){
        ArrayList<Topping> toppings = ports.getToppings();
        toppingsSales = new ArrayList<>();
        for(int i = 0; i < toppings.size(); i++) {
            toppingsSales.add(new ToppingSales(toppings.get(i),0));
            
        }
        
        ArrayList<Order> orders = ports.getOrderSales("order_id");
        
        for(int i = 0; i < orders.size(); i++){
            Order o = orders.get(i);
            ArrayList<OrderItem> orderItems = o.getItems();
            
            for(int j = 0; j < orderItems.size(); j++){
                OrderItem item = orderItems.get(j);      
                ArrayList<OrderItemToppings> orderItemToppings = item.getToppings();
                
                for(int k = 0; k < orderItemToppings.size(); k++) {
                    OrderItemToppings orderItemTopping = orderItemToppings.get(i);
                    int topping_id = orderItemTopping.getTopping().getId();
                    toppingsSales.get(topping_id-1).updateQuantity(orderItemTopping.getQuantity());
                }
                
            }
        }
        
        Collections.sort(toppingsSales, new popularToppings());
        //then sort ascending
        return toppingsSales;      
    }
    
    public double getOrderTotal(){
        ArrayList<Order> orders = ports.getOrderSales("order_id");
        totalOrderSales = 0;
        for(int i = 0; i < orders.size(); i++){
            Order o = orders.get(i);
            totalOrderSales += o.getOrder_Total();
        }
        return totalOrderSales;       
    }
   
    public int getSalesNumber() {
        ArrayList sales = ports.getOrderSales("order_id");
        return sales.size();
    }
    
    public int getActiveOrdersNumber() {
        ArrayList orders = ports.getOrderHistory("order_id");
        return orders.size();
    }
    
    class popularProducts implements Comparator{  
        
        public int compare(Object a,Object b){  
            ProductSales ps1 =(ProductSales) a;  
            ProductSales ps2 =(ProductSales) b;  
            
            int quantityA = ps1.getQuantity();
            int quantityB = ps2.getQuantity();
            
            
            return quantityB - quantityA;  
        }
    }
    
    class popularToppings implements Comparator{  
        
        public int compare(Object a,Object b){  
            ToppingSales ts1 =(ToppingSales) a;  
            ToppingSales ts2 =(ToppingSales) b;  
            
            int quantityA = ts1.getQuantity();
            int quantityB = ts2.getQuantity();
            
            
            return quantityB - quantityA;  
        }
    }
}

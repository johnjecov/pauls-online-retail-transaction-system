package ports.models;

import ports.utility.*;
import java.util.*;

public class Order {
    private int order_id;
    private int customer_id;
    private int employee_id;
    private int order_status_id;
    private double order_total;
    private String order_made_date;
    private String order_delivery_date;
    private String payment_method;
    private String payment_date;
    private String payment_status;
    private ArrayList<OrderItem> items;
    
    public Order(int cart_id, int customer_id, double cart_total, ArrayList<CartItem> Items){
        this.order_id = cart_id;
        this.customer_id = customer_id;
        this.order_total = cart_total;
        this.items = items;
        
    }
     
    
    //getters
    public int getCart_Id(){
        return order_id;
    }
    
    public int getCustomer_Id(){
        return customer_id;
    }
    
    public double getOrder_Total(){
        return order_total;
    }
    
    public ArrayList getItems(){
        return items;
    }
    
    public String toString() {
        return String.format("This is order # %d of customer %d", order_id, customer_id);
    }
    
}

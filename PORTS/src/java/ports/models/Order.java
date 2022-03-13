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
    private Address address;
    private String customer_name;
    private String contact_number;
    private boolean exists = false;
    public Order() {
        System.out.println("Order Placeholder");
    }
    public Order(int order_id, int customer_id, int employee_id, int order_status_id, double order_total, String order_made_date, String order_delivery_date,
            String payment_method, String payment_date, String payment_status,ArrayList<OrderItem> items, Address address, String customer_name, String contact_number){
        
        this.order_id = order_id;
        this.customer_id = customer_id;
        this.employee_id = employee_id;
        this.order_status_id = order_status_id;
        this.order_total = order_total;
        this.order_made_date = order_made_date;
        this.order_delivery_date = order_delivery_date;
        this.payment_method = payment_method;
        this.payment_date = payment_date;
        this.payment_status = payment_status;
        this.items = items;
        this.address = address;
        this.customer_name = customer_name;
        this.contact_number = contact_number;
        this.exists = true;
    }
     
    
    //getters
    public int getOrder_Id(){
        return order_id;
    }
    
    public int getCustomer_Id(){
        return customer_id;
    }
    
    public int getEmployee_id(){
        return employee_id;
    }
    
    public int getOrder_Status_Id() {
        return order_status_id;
    }
    
    public double getOrder_Total() {
        return order_total;
    }
    
    public String getOrder_Made_Date(){
        return order_made_date;
    }
    
    public String getOrder_Delivery_Date(){
        return order_delivery_date;
    }
    
    public String getPayment_Method() {
        return payment_method;
    }
    
    public String getPayment_Status() {
        return payment_status;
    }
    
    public ArrayList getItems(){
        return items;
    }
    
    public Address getAddress() {
        return address;
    }
    
    public String getCustomerName() {
        return customer_name;
    }
    
    public String getCustomerContactNumber() {
        return contact_number;
    }
    
    public String toString() {
        return String.format("Hello this is order # %d of customer %d\n"
                + "Order Total: %f\n"
                + "Order Status: %d\n"
                + "Payment Method: %s\n"
                + "Payment Status: %s\n"
                + "Address Name: %s\n"
                + "Customer Name: %s\n"
                + "Number: %s\n", order_id, customer_id, order_total, order_status_id, payment_method, payment_status, address.getAddressName(), customer_name, contact_number);
    }
    
    public boolean existingOrder(){
        if(exists)
            return true;
        else
            return false;
    }
    
    public boolean isEmpty() {
        if(items.size() == 0)
            return true;
        else
            return false;
    }
    
    public String getOrderString () {
        String s = "";
        
        for (int i = 0; i < items.size(); i++)
        {
            OrderItem o = items.get(i);
            s += o.toString()+"\n";
            
        }
        
        return s;    
    }
    
}

package ports.models;

import ports.utility.*;
import java.util.*;

public class OrderItem {
    private int purchase_id;
    private int order_id;
    private Product product;
    private ArrayList<OrderItemToppings> toppings;
    private int quantity;
 
    public OrderItem(int purchase_id, int order_id, Product pizza, ArrayList<OrderItemToppings> toppings, int quantity){
        this.purchase_id = purchase_id;
        this.order_id = order_id;
        this.product = pizza;
        this.toppings = toppings;
        this.quantity = quantity;
    }
    
   //setter
   public void setId(int id) {
       purchase_id = id;
   }
    
    //getters
   public int getOrderItemId() {
       return purchase_id;
   }
   public Product getProduct() {
       return product;
   } 
   
   public ArrayList getToppings() {
       return toppings;
   }
   
   public int getQuantity(){
       return quantity;
   }
   
   public int getOrderId(){
       return order_id;
   }
   
   public String toString() {
       
       String s = "";
       
       if (quantity == 1)
            s = String.format("%d order of %s,", quantity, product.getName());
       else
            s = String.format("%d orders of %s,", quantity, product.getName());
       
       if (toppings.isEmpty())
           s += " with no add ons.\n";
       for (int i = 0; i < toppings.size(); i++)
       {
           OrderItemToppings t = toppings.get(i);
           if (i == 0)
               s+= "with ";
           
           String adder = (t.getQuantity() > 1) ? "add ons" : "add on";
           
           if (i < toppings.size() - 1)
            s += String.format("%d %s of %s , and ", t.getQuantity(),adder, t.getTopping().getName());
           else
            s += String.format("%d %s of %s.\n", t.getQuantity(),adder,t.getTopping().getName());   
       }
       
       
       return s;
   }
    
}

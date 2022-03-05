package ports.models;

import ports.utility.*;
import java.util.*;

public class OrderItemToppings {
    private int orderItemToppingsID;
    private Topping topping;
    private int quantity;
    
    public OrderItemToppings(int orderItemToppingsID, Topping topping, int quantity){
        this.orderItemToppingsID = orderItemToppingsID;
        this.topping = topping;
        this.quantity = quantity;
    }
    

    //setter
   public void setId(int id) {
       orderItemToppingsID = id;
   }
    //getters
    public int getCartItemToppingsId() {
        return orderItemToppingsID;
    }
    
    public Topping getTopping() {
        return topping;
    }
    
    public int getQuantity() {
        return quantity;
    }
}

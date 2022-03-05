package ports.models;

import ports.utility.*;
import java.util.*;

public class CartItemToppings {
    private int cartItemToppingsId;
    private Topping topping;
    private int quantity;
    
    public CartItemToppings(int CartItemToppingsId, Topping topping, int quantity){
        this.cartItemToppingsId = cartItemToppingsId;
        this.topping = topping;
        this.quantity = quantity;
    }
    

    //setter
   public void setId(int id) {
       cartItemToppingsId = id;
   }
    //getters
    public int getCartItemToppingsId() {
        return cartItemToppingsId;
    }
    
    public Topping getTopping() {
        return topping;
    }
    
    public int getQuantity() {
        return quantity;
    }
}

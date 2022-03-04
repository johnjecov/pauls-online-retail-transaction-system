package ports.models;

import ports.utility.*;
import java.util.*;

public class CartItem {
    private int cartItemId;
    private int cartId;
    private Product product;
    private ArrayList<CartItemToppings> toppings;
    private int quantity;
    
    public CartItem(int cartItemId, int cartId, Product pizza, ArrayList toppings, int quantity){
        this.cartItemId = cartItemId;
        this.cartId = cartId;
        this.product = product;
        this.toppings = toppings;
        this.quantity = quantity;
    }
    
    //getters
   public int getCartItemId() {
       return cartItemId;
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
   
   public int getCartId(){
       return cartId;
   }
    
}

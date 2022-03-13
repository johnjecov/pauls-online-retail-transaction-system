package ports.models;

import ports.utility.*;
import java.util.*;

public class CartItem {
    private int cartItemId;
    private int cartId;
    private Product product;
    private ArrayList<CartItemToppings> toppings;
    private int quantity;
    
    public CartItem(int cartItemId, int cartId, Product pizza, ArrayList<CartItemToppings> toppings, int quantity){
        this.cartItemId = cartItemId;
        this.cartId = cartId;
        this.product = pizza;
        this.toppings = toppings;
        this.quantity = quantity;
    }
    
   //setter
   public void setId(int id) {
       cartItemId = id;
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

    
   public String toString(){
       String s = "";
       
        if (toppings.isEmpty())
           s += " with no add ons.\n";
       for (int i = 0; i < toppings.size(); i++)
       {
           CartItemToppings t = toppings.get(i);
           if (i == 0)
               s+= "with ";
           
           if (i < toppings.size() - 1)
            s += String.format("%dx of %s, and ", t.getQuantity(), t.getTopping().getName());
           else
            s += String.format("%dx of %s.\n", t.getQuantity(),t.getTopping().getName());   
       }
       
       return s;
   }
   
    public String toString2(){
       String s = "";
       
        if (toppings.isEmpty())
           s += " with no add ons.\n";
       for (int i = 0; i < toppings.size(); i++)
       {
           CartItemToppings t = toppings.get(i);
           if (i == 0)
               s+= "with ";
           
       }
       return s;
    }

   
   public double getItemTotal() {
       double total = quantity * product.getPrice();
       
       for(CartItemToppings x : toppings){
           total += x.getQuantity() * (x.getTopping().getPrice());
       }
       
       return total;
   }
   
}

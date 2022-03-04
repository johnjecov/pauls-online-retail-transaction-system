package ports.models;

import ports.utility.*;
import java.util.*;

public class Cart {
    private int cart_id;
    private int customer_id;
    private double cart_total;
    private ArrayList<CartItem> items;
    
    public Cart(int cart_id, int customer_id, double cart_total, ArrayList<CartItem> Items){
        this.cart_id = cart_id;
        this.customer_id = customer_id;
        this.cart_total = cart_total;
        this.items = items;
    }
    
    //process cart functions
    public double computeTotal(){
        cart_total = 0;
        
        for (int i = 0 ; i < items.size(); i++) {
            CartItem item = items.get(i);
            Product p = item.getProduct();
            cart_total += (p.getPrice() * item.getQuantity());
            ArrayList toppings = item.getToppings();
            for (int j = 0; j < toppings.size(); i++){
                Topping t = (Topping) toppings.get(j);
                cart_total += t.getPrice();
            }
        }
        
        return cart_total;
    }
    
    public void addToCart(PortsDatabase ports, CartItem item) {
        
        //add item to cart and update database
        items.add(item);
        ports.addItemToCart(cart_id, item);
        ports.setCartTotal(cart_id, computeTotal());
    }
    
    public void removeFromCart(PortsDatabase ports, int cart_purchase_id){
        for(int i = 0; i < items.size(); i++){
            CartItem item = items.get(i);
            if (item.getCartId() == cart_purchase_id){
                items.remove(i);
                break;
            }
        }
        ports.removeFromCart(cart_id, cart_purchase_id);
        ports.setCartTotal(cart_id, computeTotal());
    }
    
    //getters
    public int getCart_Id(){
        return cart_id;
    }
    
    public int getCustomer_Id(){
        return customer_id;
    }
    
    public double getCart_Total(){
        return cart_total;
    }
    
    public ArrayList getItems(){
        return items;
    }
    
    
    
}

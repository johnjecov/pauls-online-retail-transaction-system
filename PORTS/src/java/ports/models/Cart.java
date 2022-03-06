package ports.models;

import ports.utility.*;
import java.util.*;

public class Cart {
    private int cart_id;
    private int customer_id;
    private double cart_total;
    private ArrayList<CartItem> items;
    
    public Cart(int cart_id, int customer_id, double cart_total, ArrayList<CartItem> items){
        this.cart_id = cart_id;
        this.customer_id = customer_id;
        this.cart_total = cart_total;
        this.items = items;
    }
    
    public void checkOut(PortsDatabase ports, String checkoutDate, String deliveryDate, int address_id) {
        //access the cart to checkout the cart.
        ports.checkOutCart(this, checkoutDate, deliveryDate, address_id);
        clearCart(ports);
    }
    
    public void clearCart(PortsDatabase ports) {
        items.clear();
        computeTotal();
        ports.setCartTotal(cart_id, cart_total);
        ports.clearCartForCheckout(cart_id);
        System.out.println("here");
    }
    
    public double computeTotal(){
        cart_total = 0;
        System.out.println("Called Here");
        try {
        for (int i = 0 ; i < items.size(); i++) {
            CartItem item = items.get(i);
            Product p = item.getProduct();
            cart_total += (p.getPrice() * item.getQuantity());
            ArrayList<CartItemToppings> toppings = item.getToppings();
            for (int j = 0; j < toppings.size(); j++){
                CartItemToppings itemToppings = toppings.get(j);
                Topping t = itemToppings.getTopping();
                cart_total += (t.getPrice() * itemToppings.getQuantity());
            }
        }
        }
        catch(Exception e) {
           System.out.println(e.getMessage());
        }
        return cart_total;
    }
    
    public void addToCart(PortsDatabase ports, CartItem item) {
        
        //add item to cart and update database
        items.add(item);
        ports.addItemToCart(cart_id, item);
        computeTotal();
        ports.setCartTotal(cart_id, cart_total);
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
        computeTotal();
        ports.setCartTotal(cart_id, cart_total);
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
    
    public String toString() {
        return String.format("This is cart # %d of customer %d\n"
                + "Cart Total: %f\n", cart_id, customer_id, cart_total);
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ports.models;

import java.util.ArrayList;

public class ToppingSales {
    private Topping topping;
    private int quantity;
    
    public ToppingSales(Topping topping, int quantity){
        this.topping = topping;
        this.quantity = quantity;
    }
    
    public Topping getTopping(){
        return topping;
    }
    
    public int getQuantity(){
        return quantity;
    }
    
    public void updateQuantity(int plus){
        quantity += plus;
    }
    
}

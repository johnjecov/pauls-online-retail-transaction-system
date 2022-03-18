/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ports.models;

import java.util.ArrayList;

public class ProductSales {
    private Product product;
    private int quantity;
    
    public ProductSales(Product product, int quantity){
        this.product = product;
        this.quantity = quantity;
    }
    
    public Product getProduct(){
        return product;
    }
    
    public int getQuantity(){
        return quantity;
    }
    
    public void updateQuantity(int plus){
        quantity += plus;
    }
    
}

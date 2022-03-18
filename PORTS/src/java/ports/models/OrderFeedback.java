/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ports.models;

public class OrderFeedback {
    private Order o;
    private int rating;
    private String comment;
    
    public OrderFeedback(Order o, int rating, String comment){
        this.o = o;
        this.rating = rating;
        this.comment = comment;
    }
    
    public boolean hasFeedBack() {
        if(rating == 0)
            return false;
        else
            return true;
    }
    
    public Order getOrder() {
        return o;
    }
    
    public int getRating() {
        return rating;
    }
    
    public String getComment() {
        return comment;
    }
    
}

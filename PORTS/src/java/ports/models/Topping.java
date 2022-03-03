package ports.models;

public class Topping {
    
    private int id;
    private String name;
    private int stock = 0;
    private String desc;
    private String image;
    private String availability;
    private double price = 0;
    
    public Topping(int id, String name, int stock, String desc, String image, String availability, double price){
        this.id = id;
        this.name = name;
        this.stock = stock;
        this.desc = desc;
        this.image = image;
        this.availability = availability;
        this.price = price;
    }
    
    //getters
    public int getId(){
        return id;
    }
    
    public String getName(){
        return name;
    }

    public int getStock() {
        return stock;
    }
    
    
    public String getDesc() {
        return desc;
    }
    
    public String getImage() {
        return image;
    }
    
    public String getAvailability() {
        return availability;
    }
    
    public double getPrice() {
        return price;
    }
    
    public String toString() {
        return String.format("Product\nid: %d\nname:%s\nstock:%d\ndesc:%s\nimage:%s\navailability:%s\nprice:%f",id,name,stock,desc,image,availability,price);
    }
} 
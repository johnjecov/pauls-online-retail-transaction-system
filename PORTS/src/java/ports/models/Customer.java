package ports.models;

import java.util.*;

public class Customer {
    private int customer_id;
    private String username;
    private String password;
    private String name;
    private String surname;
    private String email;
    private String contact_number;
    private ArrayList<Address> addresses;
    private Cart cart;
    private Order order;
    
    public Customer() {
        System.out.println("Dummy");
    }
    public Customer(int customer_id, String username, String password, String name, String surname, String email, String contact_number, ArrayList<Address> addresses, Cart cart, Order order) {
        this.customer_id = customer_id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.contact_number = contact_number;
        this.addresses = addresses;
        this.cart = cart;
        this.order = order;       
    }
    
    public int getCustomer_Id() {
        return customer_id;
    } 
    public String getUsername() {
        return username;
    }
    public String getPassword() {
        return password;
    }
    public String getName() {
        return name;
    }
    public String getSurname() {
        return surname;
    }
    public String getEmail() {
        return email;
    }
    public String getContact_Number() {
        return contact_number;
    }
    public ArrayList getAddresses() {
        return addresses;
    }
    public Cart getCart() {
        return cart;
    }
    public Order getOrder(PortsDatabase ports) {
        order = ports.getOrderData(customer_id);
        return order;
    }
    
       
}

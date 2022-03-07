package ports.models;

import java.util.*;

public class Employee {
    private int employee_id;
    private String username;
    private String password;
    private String role;
    private String name;
    private String surname;
    private String email;
    private String contact_number;
    
    public Employee() {
        System.out.println("Dummy");
    }
    
    public Employee(int employee_id, String username, String password, String role, String name, String surname, String email, String contact_number) {
        this.employee_id = employee_id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.contact_number = contact_number;      
    }
    
    public int getEmployee_Id() {
        return employee_id;
    } 
    public String getUsername() {
        return username;
    }
    public String getPassword() {
        return password;
    }
    
    public String getRole() {
        return role;
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

    
}

package ports.models;

import java.sql.*;
import java.sql.DatabaseMetaData;
import java.util.*;
public class PortsDatabase {
    static Connection portsConnection;
    
    public PortsDatabase(Connection con){
        setConnection(con);
        System.out.println("database connection created");
    }
    
    public void displayTables() {
        System.out.println("Print here the tables.");
        try {
            DatabaseMetaData portsMetaData  = portsConnection.getMetaData();
            String[] types = {"TABLE"};
            ResultSet results = portsMetaData.getTables(null,null,"%",types);
            while(results.next()){
                System.out.println(results.getString("TABLE_NAME"));
            }
            System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        
        }
        catch (SQLException sqle)
        {
            System.out.println("SQLException error occured - " + sqle.getMessage());
        } 
    }
    
    
    //database commands for address
    public void addAddress(Address a){
        System.out.print("TEST ADD ADDRESS");
        int id = 1;
        String query1 = "SELECT address_id FROM address order by 'address_id' desc";
        String query2 = "INSERT INTO address VALUES(?,?,?,?,?,?,?,?,?,?)";
     
        
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query1);
            
            ResultSet results = ps.executeQuery();
            
            if(results.next())
            {
                id = Integer.parseInt(results.getString("address_id")) + 1;
                
            }
            
            a.setAddressId(String.valueOf(id));
            
            ps = portsConnection.prepareStatement(query2);
            ArrayList toAdd = (ArrayList) a.getAddressInfo();
            ps.setInt(1, id);
            ps.setInt(2, Integer.parseInt(a.getCustomerId()));
            ps.setString(3, a.getAddressName());
            ps.setString(4, a.getDetails());
            ps.setString(5, a.getAdditionalDetails());
            ps.setString(6, a.getHouseNo());
            ps.setString(7, a.getStreet());
            ps.setString(8, a.getCity());
            ps.setString(9, a.getProvince());
            ps.setString(10, a.getPostalCode());
            
            //update the database
            ps.executeUpdate();
            System.out.println("added this record on address table");
            for(int i = 0; i < toAdd.size(); i++)
            {
                System.out.print(toAdd.get(i)+", ");
            }
            System.out.println();
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
    
    public void removeAddress(int addressId){
        System.out.print("TEST remove ADDRESS");

        String query = "DELETE FROM address where address_id = ?";

        try {
            PreparedStatement ps = portsConnection.prepareStatement(query);
            ps.setInt(1, addressId);
            ps.executeUpdate();
            System.out.println("Address id: "+addressId+" removed");
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
    }
    
     
        public ArrayList getAddresses(int customerID){
        System.out.print("TEST get ADDRESSES");
        String query1 = "SELECT * FROM address order by 'address_id' asc";
     
        ArrayList<Address> addresses = new ArrayList<>();
        try {
            PreparedStatement ps = portsConnection.prepareStatement(query1);
            
            ResultSet results = ps.executeQuery();
            
            while(results.next()){
                addresses.add(
                        new Address(results.getString("address_id"),
                        results.getString("customer_id"),
                        results.getString("address_name"),
                        results.getString("address_details"),
                        results.getString("additional_details"),
                        results.getString("house_no"),
                        results.getString("street"),
                        results.getString("city"),
                        results.getString("province"),
                        results.getString("postal_code")
                        ));
            }
     
            System.out.println("Addresses of Cusomer: "+customerID+" added");
          
       
                
        }
        catch(SQLException sqle){
            System.out.println("SQLException error occured - " + sqle.getMessage());
        }
        return addresses;
    }
    
    
    //database commands for products and toppings
    
        
    
    public void setConnection(Connection con){
        portsConnection = con;
        System.out.println("Ports Set.");
    }
    
    
}

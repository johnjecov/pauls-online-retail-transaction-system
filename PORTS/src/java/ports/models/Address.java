
package ports.models;
import java.util.*;
/**
 *
 * @author Kirby Wenceslao
 */
public class Address {
    
    private String addressId;
    private String customerId;
    private String addressName;
    private String houseNo;
    private String street;
    private String postalCode;
    private String province;
    private String city;
    private String details;
    private String additionalDetails;
    private ArrayList<String> addressInfo;
    
    public Address(String addressId, String customerId, String addressName, String details, String additionalDetails, String houseNo, String street, String city,String province, String postalCode){
       this.addressId = addressId;
       this.customerId = customerId;
       this.addressName = addressName;
       this.houseNo = houseNo;
       this.street = street;
       this.postalCode = postalCode;
       this.province = province;
       this.city = city;
       this.details = details;
       this.additionalDetails = additionalDetails;
       addressInfo = new ArrayList<>();
    }
    
    //Setters 
    
    public void setAddressId(String addressId) {
        this.addressId = addressId;
    }
    
    
    //Address getters...
    public String getAddressName(){
        return addressName;
    }
    
    public String getHouseNo(){
        return houseNo;
    }
    
     public String getAddressId(){
        return addressId;
    }
    public String getCustomerId(){
        return customerId;
    }
     
    public String getStreet(){
        return street;
    }
      
    public String getPostalCode(){
        return postalCode;
    }
       
    public String getProvince(){
        return province;
    }
        
    public String getCity(){
        return city;
    }
         
    public String getDetails(){
        return details;
    }
          
    public String getAdditionalDetails(){
        return additionalDetails;
    }
    
    public ArrayList getAddressInfo(){
        addressInfo.clear();
        addressInfo.add(customerId);
        addressInfo.add(addressName);
        addressInfo.add(details);
        addressInfo.add(additionalDetails);
        addressInfo.add(houseNo);
        addressInfo.add(street);
        addressInfo.add(province);
        addressInfo.add(postalCode);
      
        return addressInfo;
    }
    
    public String toString() {
        return "Address Name: "+addressName;
    }
    
}

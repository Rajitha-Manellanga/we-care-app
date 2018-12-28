package com.pojos;
// Generated Sep 15, 2018 12:52:12 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Guardian generated by hbm2java
 */
public class Guardian  implements java.io.Serializable {


     private int id;
     private String nic;
     private String firstName;
     private String lastName;
     private String gender;
     private String relationship;
     private String mobile;
     private String email;
     private String addressLine1;
     private String addressLine2;
     private String city;
     private String postalCode;
     private Set needyPersonHasGuardians = new HashSet(0);

    public Guardian() {
    }

	
    public Guardian(int id) {
        this.id = id;
    }
    public Guardian(int id, String nic, String firstName, String lastName, String gender, String relationship, String mobile, String email, String addressLine1, String addressLine2, String city, String postalCode, Set needyPersonHasGuardians) {
       this.id = id;
       this.nic = nic;
       this.firstName = firstName;
       this.lastName = lastName;
       this.gender = gender;
       this.relationship = relationship;
       this.mobile = mobile;
       this.email = email;
       this.addressLine1 = addressLine1;
       this.addressLine2 = addressLine2;
       this.city = city;
       this.postalCode = postalCode;
       this.needyPersonHasGuardians = needyPersonHasGuardians;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public String getNic() {
        return this.nic;
    }
    
    public void setNic(String nic) {
        this.nic = nic;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getGender() {
        return this.gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getRelationship() {
        return this.relationship;
    }
    
    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }
    public String getMobile() {
        return this.mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getAddressLine1() {
        return this.addressLine1;
    }
    
    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }
    public String getAddressLine2() {
        return this.addressLine2;
    }
    
    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }
    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
    public String getPostalCode() {
        return this.postalCode;
    }
    
    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }
    public Set getNeedyPersonHasGuardians() {
        return this.needyPersonHasGuardians;
    }
    
    public void setNeedyPersonHasGuardians(Set needyPersonHasGuardians) {
        this.needyPersonHasGuardians = needyPersonHasGuardians;
    }




}



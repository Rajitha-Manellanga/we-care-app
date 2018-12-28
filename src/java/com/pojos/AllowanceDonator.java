package com.pojos;
// Generated Sep 15, 2018 12:52:12 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * AllowanceDonator generated by hbm2java
 */
public class AllowanceDonator  implements java.io.Serializable {


     private int id;
     private PrivateRecord privateRecord;
     private String name;
     private String addressLine1;
     private String addressLine2;
     private String city;
     private String country;
     private String mobile;
     private String email;
     private String fax;
     private String status;
     private Set allowances = new HashSet(0);

    public AllowanceDonator() {
    }

	
    public AllowanceDonator(int id, PrivateRecord privateRecord) {
        this.id = id;
        this.privateRecord = privateRecord;
    }
    public AllowanceDonator(int id, PrivateRecord privateRecord, String name, String addressLine1, String addressLine2, String city, String country, String mobile, String email, String fax, String status, Set allowances) {
       this.id = id;
       this.privateRecord = privateRecord;
       this.name = name;
       this.addressLine1 = addressLine1;
       this.addressLine2 = addressLine2;
       this.city = city;
       this.country = country;
       this.mobile = mobile;
       this.email = email;
       this.fax = fax;
       this.status = status;
       this.allowances = allowances;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public PrivateRecord getPrivateRecord() {
        return this.privateRecord;
    }
    
    public void setPrivateRecord(PrivateRecord privateRecord) {
        this.privateRecord = privateRecord;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
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
    public String getCountry() {
        return this.country;
    }
    
    public void setCountry(String country) {
        this.country = country;
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
    public String getFax() {
        return this.fax;
    }
    
    public void setFax(String fax) {
        this.fax = fax;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public Set getAllowances() {
        return this.allowances;
    }
    
    public void setAllowances(Set allowances) {
        this.allowances = allowances;
    }




}


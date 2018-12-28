package com.pojos;
// Generated Sep 15, 2018 12:52:12 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * District generated by hbm2java
 */
public class District  implements java.io.Serializable {


     private int id;
     private Province province;
     private String name;
     private Set districtOfficers = new HashSet(0);
     private Set divisionalSecretariats = new HashSet(0);

    public District() {
    }

	
    public District(int id, Province province) {
        this.id = id;
        this.province = province;
    }
    public District(int id, Province province, String name, Set districtOfficers, Set divisionalSecretariats) {
       this.id = id;
       this.province = province;
       this.name = name;
       this.districtOfficers = districtOfficers;
       this.divisionalSecretariats = divisionalSecretariats;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public Province getProvince() {
        return this.province;
    }
    
    public void setProvince(Province province) {
        this.province = province;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Set getDistrictOfficers() {
        return this.districtOfficers;
    }
    
    public void setDistrictOfficers(Set districtOfficers) {
        this.districtOfficers = districtOfficers;
    }
    public Set getDivisionalSecretariats() {
        return this.divisionalSecretariats;
    }
    
    public void setDivisionalSecretariats(Set divisionalSecretariats) {
        this.divisionalSecretariats = divisionalSecretariats;
    }




}


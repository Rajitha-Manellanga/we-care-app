package com.pojos;
// Generated Sep 15, 2018 12:52:12 AM by Hibernate Tools 4.3.1



/**
 * ProvinceOfficer generated by hbm2java
 */
public class ProvinceOfficer  implements java.io.Serializable {


     private int id;
     private Province province;
     private Role role;
     private String type;

    public ProvinceOfficer() {
    }

	
    public ProvinceOfficer(int id, Province province, Role role) {
        this.id = id;
        this.province = province;
        this.role = role;
    }
    public ProvinceOfficer(int id, Province province, Role role, String type) {
       this.id = id;
       this.province = province;
       this.role = role;
       this.type = type;
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
    public Role getRole() {
        return this.role;
    }
    
    public void setRole(Role role) {
        this.role = role;
    }
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }




}


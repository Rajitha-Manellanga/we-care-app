package com.pojos;
// Generated Sep 15, 2018 12:52:12 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Permission generated by hbm2java
 */
public class Permission  implements java.io.Serializable {


     private int id;
     private String name;
     private Set roleHasPermissions = new HashSet(0);

    public Permission() {
    }

	
    public Permission(int id) {
        this.id = id;
    }
    public Permission(int id, String name, Set roleHasPermissions) {
       this.id = id;
       this.name = name;
       this.roleHasPermissions = roleHasPermissions;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Set getRoleHasPermissions() {
        return this.roleHasPermissions;
    }
    
    public void setRoleHasPermissions(Set roleHasPermissions) {
        this.roleHasPermissions = roleHasPermissions;
    }




}


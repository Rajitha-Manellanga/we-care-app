package com.pojos;
// Generated Sep 15, 2018 12:52:12 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * SecurityQuestion generated by hbm2java
 */
public class SecurityQuestion  implements java.io.Serializable {


     private int id;
     private String question;
     private Set logins = new HashSet(0);
     private Set needyLogins = new HashSet(0);

    public SecurityQuestion() {
    }

	
    public SecurityQuestion(int id) {
        this.id = id;
    }
    public SecurityQuestion(int id, String question, Set logins, Set needyLogins) {
       this.id = id;
       this.question = question;
       this.logins = logins;
       this.needyLogins = needyLogins;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public String getQuestion() {
        return this.question;
    }
    
    public void setQuestion(String question) {
        this.question = question;
    }
    public Set getLogins() {
        return this.logins;
    }
    
    public void setLogins(Set logins) {
        this.logins = logins;
    }
    public Set getNeedyLogins() {
        return this.needyLogins;
    }
    
    public void setNeedyLogins(Set needyLogins) {
        this.needyLogins = needyLogins;
    }




}



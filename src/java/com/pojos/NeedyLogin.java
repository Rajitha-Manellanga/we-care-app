package com.pojos;
// Generated Sep 15, 2018 12:52:12 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * NeedyLogin generated by hbm2java
 */
public class NeedyLogin  implements java.io.Serializable {


     private int id;
     private NeedyPerson needyPerson;
     private SecurityQuestion securityQuestion;
     private String password;
     private String noAttempts;
     private String answer;
     private Set needyActivityLoggers = new HashSet(0);

    public NeedyLogin() {
    }

	
    public NeedyLogin(int id, NeedyPerson needyPerson, SecurityQuestion securityQuestion) {
        this.id = id;
        this.needyPerson = needyPerson;
        this.securityQuestion = securityQuestion;
    }
    public NeedyLogin(int id, NeedyPerson needyPerson, SecurityQuestion securityQuestion, String password, String noAttempts, String answer, Set needyActivityLoggers) {
       this.id = id;
       this.needyPerson = needyPerson;
       this.securityQuestion = securityQuestion;
       this.password = password;
       this.noAttempts = noAttempts;
       this.answer = answer;
       this.needyActivityLoggers = needyActivityLoggers;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public NeedyPerson getNeedyPerson() {
        return this.needyPerson;
    }
    
    public void setNeedyPerson(NeedyPerson needyPerson) {
        this.needyPerson = needyPerson;
    }
    public SecurityQuestion getSecurityQuestion() {
        return this.securityQuestion;
    }
    
    public void setSecurityQuestion(SecurityQuestion securityQuestion) {
        this.securityQuestion = securityQuestion;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getNoAttempts() {
        return this.noAttempts;
    }
    
    public void setNoAttempts(String noAttempts) {
        this.noAttempts = noAttempts;
    }
    public String getAnswer() {
        return this.answer;
    }
    
    public void setAnswer(String answer) {
        this.answer = answer;
    }
    public Set getNeedyActivityLoggers() {
        return this.needyActivityLoggers;
    }
    
    public void setNeedyActivityLoggers(Set needyActivityLoggers) {
        this.needyActivityLoggers = needyActivityLoggers;
    }




}



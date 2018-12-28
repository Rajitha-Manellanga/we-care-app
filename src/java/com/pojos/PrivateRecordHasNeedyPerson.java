package com.pojos;
// Generated Sep 15, 2018 12:52:12 AM by Hibernate Tools 4.3.1



/**
 * PrivateRecordHasNeedyPerson generated by hbm2java
 */
public class PrivateRecordHasNeedyPerson  implements java.io.Serializable {


     private int id;
     private NeedyPerson needyPerson;
     private PrivateRecord privateRecord;
     private Integer startingYear;
     private Integer endingYear;
     private String status;

    public PrivateRecordHasNeedyPerson() {
    }

	
    public PrivateRecordHasNeedyPerson(int id, NeedyPerson needyPerson, PrivateRecord privateRecord) {
        this.id = id;
        this.needyPerson = needyPerson;
        this.privateRecord = privateRecord;
    }
    public PrivateRecordHasNeedyPerson(int id, NeedyPerson needyPerson, PrivateRecord privateRecord, Integer startingYear, Integer endingYear, String status) {
       this.id = id;
       this.needyPerson = needyPerson;
       this.privateRecord = privateRecord;
       this.startingYear = startingYear;
       this.endingYear = endingYear;
       this.status = status;
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
    public PrivateRecord getPrivateRecord() {
        return this.privateRecord;
    }
    
    public void setPrivateRecord(PrivateRecord privateRecord) {
        this.privateRecord = privateRecord;
    }
    public Integer getStartingYear() {
        return this.startingYear;
    }
    
    public void setStartingYear(Integer startingYear) {
        this.startingYear = startingYear;
    }
    public Integer getEndingYear() {
        return this.endingYear;
    }
    
    public void setEndingYear(Integer endingYear) {
        this.endingYear = endingYear;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }




}



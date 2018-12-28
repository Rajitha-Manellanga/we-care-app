/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.additional;

/**
 *
 * @author Rajitha
 */
public class ValidateRecords {
    
    public static String checkBloodGroup(String bloodgroup){
        
        String bgval=null;
        if(bloodgroup.equals("A+")){
            bgval="A_pos";
        }
        if(bloodgroup.equals("B+")){
            bgval="B_pos";
        }
        if(bloodgroup.equals("AB+")){
            bgval="AB_pos";
        }
        if(bloodgroup.equals("O+")){
            bgval="O_pos";
        }
        if(bloodgroup.equals("A-")){
            bgval="A_neg";
        }
        if(bloodgroup.equals("B-")){
            bgval="B_neg";
        }
        if(bloodgroup.equals("AB-")){
            bgval="AB_neg";
        }
        if(bloodgroup.equals("O-")){
            bgval="O_neg";
        }
        
        return bgval;
    }
    
    public static  String checkMartialStatus(String martialstatus){
        String mstatus=null;
        if(martialstatus.equals("Single")){
            mstatus="SINGLE";
        }
        if(martialstatus.equals("Married")){
            mstatus="MARRIED";
        }
         if(martialstatus.equals("Married")){
            mstatus="MARRIED";
        }
         if(martialstatus.equals("Widowed")){
             mstatus="WIDOWED";
         }
         if(martialstatus.equals("Divorced")){
             mstatus="DIVORCED";
         }
         return mstatus;
    }
    public static String checkEducationalLevel(String educationalLevel){
        String elvl=null;
        if(educationalLevel.equals("Below Ordinary Level")){
            elvl="BLW_OL";
        }
         if(educationalLevel.equals("Upto Ordinary Level")){
            elvl="OL";
        }
         if(educationalLevel.equals("Upto Advanced Level")){
            elvl="AL";
        }
          if(educationalLevel.equals("Bachelor Degree")){
            elvl="BSC";
        }
          if(educationalLevel.equals("Master/Phd Degree")){
            elvl="HIG BSC";
        }
          
          return elvl;
         
    
    }
    public static String checkGender(String gender){
        String gn=null;
        
        if(gender.equals("Male")){
            gn="M";
        }else{
            gn="F";
        }
        return gn;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.pojos.DeathDetail;
import com.pojos.DivisionalSecretariat;
import com.pojos.Guardian;
import com.pojos.NeedyPerson;
import com.pojos.NeedyPersonHasGuardian;
import com.pojos.PrivateRecord;
import com.pojos.PrivateRecordHasNeedyPerson;
import com.pojos.Role;
import com.pojos.User;
import java.util.List;
import java.util.Set;


/**
 *
 * @author Rajitha
 */

public interface NeedyService {
    
    String displayDisability();
    String displaySkill( );
    String displayDS( );
    Role receiveNeedyRole( );
    String displaySubDisability(String value);
    String receiveCode( );
    long receiveId( );
    long receiveGuardianId();
    PrivateRecord serachDisability(String val,String subval);
    long searchDeathRecords( );
    long searchNeedyhasPvtRecord( );
    void saveNeedyPerson(NeedyPerson needyPerson,List<PrivateRecordHasNeedyPerson> list,DeathDetail deathDetail);
    DivisionalSecretariat receiveNeedyDS(String ds);
    void saveNeeyPersonRecords(NeedyPerson needyPerson);
    void saveNeeyPersonRecords2(NeedyPerson needyPerson,Guardian guardian);
    void updateNeedyPersonRecords(NeedyPerson needyPerson);
    List<NeedyPerson> searchNeedyPerson(String key,String cat);
    List<NeedyPerson>  searchAdvancedNeedyPerson(String key,String cat,
            String gender,String bloodgroup,String ds,String province,
            String district,int age1,int age2,String disb,String subdisb,User user);

    public NeedyPerson receiveCode(String code);

    public void updateNeedyPersonRecords(NeedyPerson needyPerson, Set<PrivateRecordHasNeedyPerson> privateRecordHasNeedyPersons, Set<DeathDetail> dds);

    public void updateNeedyContact(NeedyPerson needyPerson);

    public void updateGuardian(Guardian g, Set<NeedyPersonHasGuardian> set, NeedyPerson np);

    public Guardian searcgGuardian(int parseInt);

}

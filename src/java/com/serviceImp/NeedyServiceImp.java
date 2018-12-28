/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.serviceImp;

import com.dao.NeedyDAO;
import com.pojos.DeathDetail;
import com.pojos.DivisionalSecretariat;
import com.pojos.Guardian;
import com.pojos.NeedyPerson;
import com.pojos.NeedyPersonHasGuardian;
import com.pojos.PrivateRecord;
import com.pojos.PrivateRecordHasNeedyPerson;
import com.pojos.Role;
import com.pojos.User;
import com.service.NeedyService;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("needyService")
public class NeedyServiceImp implements NeedyService{
    @Autowired
    private NeedyDAO needyDAO;

    @Override
    @Transactional
    public String displayDisability( ) {
       return this.needyDAO.displayDisability();
    }

    @Override
    @Transactional
    public String displaySkill( ) {
       return needyDAO.displaySkill();
    }

    @Override
    @Transactional
    public String displayDS( ) {
       return needyDAO.displayDS();
    }

    @Override
    @Transactional
    public Role receiveNeedyRole( ) {
        return this.needyDAO.receiveNeedyRole();
    }

    @Override
    @Transactional
    public String displaySubDisability(String value) {
       return this.needyDAO.displaySubDisability(value);
    }

    @Override
    @Transactional
    public String receiveCode( ) {
        System.out.println("H"+needyDAO.equals(null));
       return this.needyDAO.receiveCode();
    }

    @Override
    @Transactional
    public long receiveId( ) {
       return this.needyDAO.receiveId();
    }

    @Override
    @Transactional
    public PrivateRecord serachDisability(String val, String subval) {
       return this.needyDAO.serachDisability(val, subval);
    }

    @Override
    @Transactional
    public long searchDeathRecords( ) {
       return this.needyDAO.searchDeathRecords();
    }

    @Override
    @Transactional
    public long searchNeedyhasPvtRecord( ) {
        return this.needyDAO.searchNeedyhasPvtRecord();
    }

    @Override
    @Transactional
    public void saveNeedyPerson(NeedyPerson needyPerson, List<PrivateRecordHasNeedyPerson> list, DeathDetail deathDetail) {
        this.needyDAO.saveNeedyPerson(needyPerson, list, deathDetail);
    }

    @Override
    @Transactional
    public DivisionalSecretariat receiveNeedyDS(String ds) {
        return this.needyDAO.receiveNeedyDS(ds);
    }

    @Override
    @Transactional
    public void saveNeeyPersonRecords(NeedyPerson needyPerson) {
        this.needyDAO.saveNeeyPersonRecords(needyPerson);
    }

    @Override
    @Transactional
    public void saveNeeyPersonRecords2(NeedyPerson needyPerson, Guardian guardian) {
       this.needyDAO.saveNeeyPersonRecords2(needyPerson, guardian);
    }

    @Override
    @Transactional
    public void updateNeedyPersonRecords(NeedyPerson needyPerson) {
       this.needyDAO.updateNeedyPersonRecords(needyPerson);
    }

    @Override
    @Transactional
    public long receiveGuardianId() {
      return this.needyDAO.receiveGuardianId();
    }

    @Override
    @Transactional
    public List<NeedyPerson> searchNeedyPerson(String key, String cat) {
       return this.needyDAO.searchNeedyPerson(key, cat);
    }

    @Override
    public List<NeedyPerson> searchAdvancedNeedyPerson(String key, 
            String cat,
            String gender, 
            String mstatus, 
            String bloodgroup, 
            String edulevel, 
            String ds, 
            int age1,
            int age2,
            String disb,
            String subdisb,
            User user
            ) {
                return this.needyDAO.searchAdvancedNeedyPerson(key, cat, gender, mstatus, bloodgroup, edulevel, ds, age1,age2,disb,subdisb,user);
    }

    @Override
    public NeedyPerson receiveCode(String code) {
        return this.needyDAO.receiveCode(code);
    }

    @Override
    public void updateNeedyPersonRecords(NeedyPerson needyPerson, Set<PrivateRecordHasNeedyPerson> privateRecordHasNeedyPersons, Set<DeathDetail> dds) {
       this.needyDAO.updateNeedyPersonRecords(needyPerson, privateRecordHasNeedyPersons, dds);
    }

    @Override
    public void updateNeedyContact(NeedyPerson needyPerson) {
       this.needyDAO.updateNeedyContact(needyPerson);
    }

    @Override
    public void updateGuardian(Guardian g, Set<NeedyPersonHasGuardian> set, NeedyPerson np) {
       this.needyDAO.updateGuardian(g, set, np);
    }

    @Override
    public Guardian searcgGuardian(int parseInt) {
       return this.needyDAO.searcgGuardian(parseInt);
    }

 
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daoimp;

import com.dao.SettingDAO;
import com.pojos.AllowanceDonator;
import com.pojos.District;
import com.pojos.DivisionalSecretariat;
import com.pojos.Event;
import com.pojos.PrivateRecord;
import com.pojos.Province;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Rajitha
 */
@Repository("SettingDAO")
public class SettingDAOImp implements SettingDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Province> receiveProvince() {
        List<Province> pr = null;
        Session session = this.sessionFactory.openSession();
        try {
            pr = session.createCriteria(Province.class).list();

        } catch (Exception e) {

        } finally {
            session.close();
        }
        return pr;
    }

    @Override
    public List<District> receiveDistrict() {
        List<District> pr = null;
        Session session = this.sessionFactory.openSession();
        try {
            pr = session.createCriteria(District.class).list();

        } catch (Exception e) {

        } finally {
            session.close();
        }
        return pr;

    }

    @Override
    public List<DivisionalSecretariat> receiveDS() {
        List<DivisionalSecretariat> pr = null;
        Session session = this.sessionFactory.openSession();
        try {
            pr = session.createCriteria(DivisionalSecretariat.class).list();

        } catch (Exception e) {

        } finally {
            session.close();
        }
        return pr;
    }

    @Override
    public List<PrivateRecord> loadPrivateRecord(String type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<PrivateRecord> loadPrivateRecord(String type, String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PrivateRecord loadPrivateRecord(String type, String subtype, String value) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Event loadEvents(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public AllowanceDonator loadDonors(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

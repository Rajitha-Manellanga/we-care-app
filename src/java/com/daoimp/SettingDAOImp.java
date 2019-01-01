/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daoimp;

import com.dao.SettingDAO;
import com.pojos.AllowanceDonator;
import com.pojos.DeathDetail;
import com.pojos.District;
import com.pojos.DivisionalSecretariat;
import com.pojos.Event;
import com.pojos.NeedyPerson;
import com.pojos.PrivateRecord;
import com.pojos.Province;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
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
        List<PrivateRecord> pr = null;
        Session session = this.sessionFactory.openSession();
        try {
            Criteria criteria = session.createCriteria(PrivateRecord.class);
            criteria.add(Restrictions.eq("type", type));

            pr = criteria.list();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return pr;
    }

    @Override
    public List<PrivateRecord> loadPrivateRecord(String type, String name) {
        List<PrivateRecord> pr = null;
        Session session = this.sessionFactory.openSession();
        try {
            Criteria criteria = session.createCriteria(PrivateRecord.class);
            criteria.add(Restrictions.eq("type", type));
            criteria.add(Restrictions.eq("name", name));
            pr = criteria.list();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return pr;
    }

    @Override
    public PrivateRecord loadPrivateRecord(String type, String name, String value) {
        // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Session session = this.sessionFactory.openSession();
        PrivateRecord pr = null;
        try {
            Criteria criteria = session.createCriteria(PrivateRecord.class);
            criteria.add(Restrictions.eq("type", type));
            criteria.add(Restrictions.eq("name", name));
            criteria.add(Restrictions.eq("subName", value));
            pr = (PrivateRecord) criteria.uniqueResult();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return pr;
    }

    @Override
    public Event loadEvents(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public AllowanceDonator loadDonors(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Event> loadEvents() {
        List<Event> pr = null;
        Session session = this.sessionFactory.openSession();
        try {
            Criteria criteria = session.createCriteria(Event.class);

            pr = criteria.list();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return pr;
    }

    @Override
    public void saveEvent(Event event) {
        Session session = this.sessionFactory.openSession();
        try {
            Transaction tr = session.beginTransaction();
            session.save(event);
            tr.commit();

        } catch (Exception e) {
            e.printStackTrace();;

        } finally {
            session.close();
        }
    }

    @Override
    public Event searchEvent(String event) {
        Event pr = null;
        Session session = this.sessionFactory.openSession();
        try {
            Criteria criteria = session.createCriteria(Event.class);
            criteria.add(Restrictions.eq("description", event));
            pr = (Event) criteria.uniqueResult();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return pr;

    }

    @Override
    public void saveDonor(AllowanceDonator ad) {
        Session session = this.sessionFactory.openSession();
        try {
            Transaction tr = session.beginTransaction();
            session.save(ad);
            tr.commit();

        } catch (Exception e) {
            e.printStackTrace();;

        } finally {
            session.close();
        }
    }

    @Override
    public List<Long> loadRecordCount() {
        List<Long> flist=new ArrayList<>();
        Session session = this.sessionFactory.openSession();
        try {
            Criteria c1 = session.createCriteria(NeedyPerson.class);
            c1.setProjection(Projections.rowCount());
            List result = c1.list();
            Long x = (Long) result.get(0);

            Criteria c2 = session.createCriteria(DeathDetail.class);
            c2.setProjection(Projections.rowCount());
            List result2 = c2.list();
            Long y = (Long) result2.get(0);
            
            flist.add(x);
            flist.add(y);
            flist.add(x-y);
          

        } catch (Exception e) {
            e.printStackTrace();;

        } finally {
            session.close();
        }
        
        return flist;
    }

    @Override
    public void savePR(PrivateRecord pr) {
         Session session = this.sessionFactory.openSession();
        try {
            Transaction tr = session.beginTransaction();
            session.saveOrUpdate(pr);
            tr.commit();

        } catch (Exception e) {
            e.printStackTrace();;

        } finally {
            session.close();
        }
    }
}

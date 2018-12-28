/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daoimp;

import com.dao.NeedyDAO;
import com.dao.SettingDAO;
import com.pojos.DeathDetail;
import com.pojos.DivisionalSecretariat;
import com.pojos.NeedyPerson;
import com.pojos.PrivateRecord;
import com.pojos.PrivateRecordHasNeedyPerson;
import com.pojos.Role;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.pojos.District;
import com.pojos.Guardian;
import com.pojos.NeedyPersonHasGuardian;
import com.pojos.Province;
import com.pojos.User;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Rajitha
 */
@Repository("needyDAO")
public class NeedyDAOImp implements NeedyDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private SettingDAO settingsdeo;

    @Override
    public String displayDisability() {

        String toJson = null;
        Session session = this.sessionFactory.openSession();
        try {

            Criteria criteria = session.createCriteria(PrivateRecord.class);
            criteria.add(Restrictions.eq("type", "DISABILITY"));
            //criteria.setProjection(Projections.distinct(Projections.id()));

            List<PrivateRecord> list = criteria.list();
            ArrayList al = new ArrayList(list);
            ObjectMapper objectMapper = new ObjectMapper();
            toJson = objectMapper.writeValueAsString(al);

        } catch (JsonProcessingException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return toJson;
    }

    @Override
    public String displaySubDisability(String value) {
        String toJson = null;
        //Session session =sessionFactory.getCurrentSession();
        Session session = this.sessionFactory.openSession();

        try {
            Criteria criteria = session.createCriteria(PrivateRecord.class);

            criteria.add(Restrictions.eq("type", "DISABILITY"));
            criteria.add(Restrictions.eq("name", value));
            List<PrivateRecord> list = criteria.list();
            ArrayList al = new ArrayList(list);
            ObjectMapper objectMapper = new ObjectMapper();
            toJson = objectMapper.writeValueAsString(al);
        } catch (JsonProcessingException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }

        return toJson;
    }

    @Override
    public String displaySkill() {
        Session session = this.sessionFactory.openSession();
        String toJson = null;
        try {
            String hql = "from PrivateRecord where type='SKILL'";
            Query query = session.createQuery(hql);
            List<PrivateRecord> list = query.list();
            ArrayList al = new ArrayList(list);
            Gson gson = new Gson();
            toJson = gson.toJson(al);

        } catch (Exception e) {
        } finally {
            session.close();
        }
        return toJson;
    }

    @Override
    public String displayDS() {
        Session session = this.sessionFactory.openSession();
        String toJson = null;
        String hql = "from DivisionalSecretariat";
        Query query = session.createQuery(hql);
        List<PrivateRecord> list = query.list();
        ArrayList al = new ArrayList(list);

        ///////////
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            toJson = objectMapper.writeValueAsString(al);
        } catch (JsonProcessingException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }

        return toJson;
    }

    @Override
    public String receiveCode() {
        Session session = this.sessionFactory.openSession();

        String code = null;
        Criteria criteria = session.createCriteria(NeedyPerson.class);
        criteria.setProjection(Projections.rowCount());
        List l = criteria.list();
        Long x = (Long) l.get(0);
        NumberFormat format = new DecimalFormat("00000000");

        code = format.format(x + 1) + "N";
        session.close();
        //code = String.valueOf(x+1);
        //String.format("%04d",code);
        return code;
    }

    @Override
    public long receiveId() {
        Session session = this.sessionFactory.openSession();
        Criteria criteria = session.createCriteria(NeedyPerson.class);
        criteria.setProjection(Projections.rowCount());
        List l = criteria.list();
        Long x = (Long) l.get(0);
        session.close();
        return x++;

    }

    @Override
    public PrivateRecord serachDisability(String val, String subval) {
        Session session = this.sessionFactory.openSession();
        Criteria criteria = session.createCriteria(PrivateRecord.class);

        criteria.add(Restrictions.eq("type", "DISABILITY"));
        criteria.add(Restrictions.eq("name", val));
        criteria.add(Restrictions.eq("subName", subval));
        PrivateRecord pr = (PrivateRecord) criteria.uniqueResult();
        session.close();
        return pr;
    }

    @Override
    public long searchDeathRecords() {
        Session session = this.sessionFactory.openSession();
        Criteria criteria = session.createCriteria(DeathDetail.class);
        criteria.setProjection(Projections.rowCount());
        List l = criteria.list();
        Long x = (Long) l.get(0);
        session.close();
        return x;

    }

    @Override
    public void saveNeedyPerson(NeedyPerson needyPerson, List<PrivateRecordHasNeedyPerson> list, DeathDetail deathDetail) {
        Session session = this.sessionFactory.openSession();
        Transaction transaction;
        transaction = session.beginTransaction();

        session.save(needyPerson);
        session.save(deathDetail);
        session.close();
        //transaction.commit();
    }

    @Override
    public Role receiveNeedyRole() {
        Session session = this.sessionFactory.openSession();
        Criteria criteria = session.createCriteria(Role.class);
        criteria.add(Restrictions.eq("name", "NEEDY"));
        Role role = (Role) criteria.uniqueResult();
        session.close();
        return role;
    }

    @Override
    public DivisionalSecretariat receiveNeedyDS(String ds) {
        Session session = this.sessionFactory.openSession();
        Criteria criteria = session.createCriteria(DivisionalSecretariat.class);
        criteria.add(Restrictions.eq("name", ds));
        DivisionalSecretariat divisionalSecretariat = (DivisionalSecretariat) criteria.uniqueResult();
        session.close();
        return divisionalSecretariat;
    }

    @Override
    public long searchNeedyhasPvtRecord() {
        Session session = this.sessionFactory.openSession();
        Criteria criteria = session.createCriteria(PrivateRecordHasNeedyPerson.class);
        criteria.setProjection(Projections.rowCount());
        List l = criteria.list();
        Long x = (Long) l.get(0);
        session.close();
        return x++;
    }

    @Override
    public void saveNeeyPersonRecords(NeedyPerson needyPerson) {
        Session session = this.sessionFactory.openSession();
        Transaction t = session.beginTransaction();
        session.save(needyPerson);
        Set<PrivateRecordHasNeedyPerson> ppnSet = needyPerson.getPrivateRecordHasNeedyPersons();
        Set<DeathDetail> deathDetails = needyPerson.getDeathDetails();
        for (DeathDetail deathDetail : deathDetails) {
            session.save(deathDetail);
        }
        for (PrivateRecordHasNeedyPerson ppn : ppnSet) {
            session.save(ppn);
        }
        t.commit();
        session.close();
    }

    @Override
    public void saveNeeyPersonRecords2(NeedyPerson needyPerson, Guardian guardian) {
        Session session = this.sessionFactory.openSession();
        try {
            Transaction t = session.beginTransaction();
            session.save(needyPerson);
            Set<PrivateRecordHasNeedyPerson> ppnSet = needyPerson.getPrivateRecordHasNeedyPersons();
            Set<DeathDetail> deathDetails = needyPerson.getDeathDetails();
            for (DeathDetail deathDetail : deathDetails) {
                session.save(deathDetail);
            }
            for (PrivateRecordHasNeedyPerson ppn : ppnSet) {
                session.save(ppn);
            }
            //set Guardians
            session.save(guardian);
            t.commit();

        } catch (HibernateException e) {
        } finally {
            session.close();
        }
    }

    @Override
    public void updateNeedyPersonRecords(NeedyPerson needyPerson) {

    }

    @Override
    public long receiveGuardianId() {
        Session session = this.sessionFactory.openSession();
        long x = 0;
        try {

            Criteria criteria = session.createCriteria(Guardian.class);
            criteria.setProjection(Projections.rowCount());
            List l = criteria.list();
            x = (Long) l.get(0);
            //session.close();
            return x++;
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return x;
    }

    public List<NeedyPerson> calAge(List<NeedyPerson> nl) {

        List<NeedyPerson> nl2 = new ArrayList<>();
        for (NeedyPerson np : nl) {
            Date dob = np.getDob();
            LocalDate today = LocalDate.now();
            LocalDate date = dob.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            Period p = Period.between(date, today);
            np.setAge(p.getYears());
            nl2.add(np);
        }
        return nl2;
    }

    @Override
    public List<NeedyPerson> searchNeedyPerson(String key, String cat) {
        Session session = this.sessionFactory.openSession();
        Criteria criteria;
        List<NeedyPerson> needyPersons = null;
        try {
            criteria = session.createCriteria(NeedyPerson.class);
            switch (cat) {
                case "All":
                    needyPersons = criteria.list();
                    needyPersons = calAge(needyPersons);
                    return needyPersons;
                case "Code":
                    criteria.add(Restrictions.like("code", "%" + key + "%"));
                    needyPersons = criteria.list();
                    needyPersons = calAge(needyPersons);
                    return needyPersons;
                case "NIC":
                    criteria.add(Restrictions.like("nic", "%" + key + "%"));
                    needyPersons = criteria.list();
                    needyPersons = calAge(needyPersons);
                    return needyPersons;

                case "Name":
                    criteria.add(Restrictions.like("fullName", "%" + key + "%"));
                    needyPersons = criteria.list();
                    needyPersons = calAge(needyPersons);
                    return needyPersons;
                case "Email":
                    criteria.add(Restrictions.like("email", "%" + key + "%"));
                    needyPersons = criteria.list();
                    needyPersons = calAge(needyPersons);
                    return needyPersons;

                default:
                    needyPersons = criteria.list();
                    needyPersons = calAge(needyPersons);
                    return needyPersons;
            }
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return needyPersons;

    }

    @Override
    public List<NeedyPerson> searchAdvancedNeedyPerson(String key, String cat,
            String gender, String bloodgroup, String ds, String province,
            String district, int age1, int age2, String disb, String subdisb, User user) {

        List<NeedyPerson> list = null;
        Session session = this.sessionFactory.openSession();
        Criteria criteria, criteriapro, criteriadisc;
        Conjunction conjunction;
        Disjunction disjunction;
        try {

            criteria = session.createCriteria(NeedyPerson.class);
            criteriapro = session.createCriteria(Province.class);
            criteriadisc = session.createCriteria(District.class);
            conjunction = Restrictions.conjunction();
            disjunction = Restrictions.disjunction();

            //////
            switch (cat) {
                case "All":

                case "Code":
                    conjunction.add(Restrictions.like("code", "%" + key + "%"));
                    break;

                case "NIC":
                    conjunction.add(Restrictions.like("nic", "%" + key + "%"));
                    break;

                case "Name":
                    conjunction.add(Restrictions.like("fullName", "%" + key + "%"));
                    break;

                case "Email":
                    conjunction.add(Restrictions.like("email", "%" + key + "%"));
                    break;

                default:
                    break;
            }
            //chacking
            if (gender != null) {
                conjunction.add(Restrictions.eq("gender", gender));

            }
            if (bloodgroup != null) {
                conjunction.add(Restrictions.eq("bloodGroup", bloodgroup));

            }
            if (ds != null) {
                Criteria c = session.createCriteria(DivisionalSecretariat.class);
                c.add(Restrictions.eq("name", ds));
                DivisionalSecretariat dvs = (DivisionalSecretariat) c.uniqueResult();
                conjunction.add(Restrictions.eq("divisionalSecretariat", dvs));

            }
            if (province != null) {
                criteriapro.add(Restrictions.eq("name", province));
                Province pr = (Province) criteriapro.uniqueResult();
                Set<District> districts = pr.getDistricts();

                Set<DivisionalSecretariat> dval = null;
                for (District d : districts) {
                    dval = d.getDivisionalSecretariats();
                    for (DivisionalSecretariat dval2 : dval) {
                        disjunction.add(Restrictions.eq("divisionalSecretariat", dval2));
                    }
                }
            }
            if (district != null) {
                criteriadisc.add(Restrictions.eq("name", district));
                District dr = (District) criteriadisc.uniqueResult();
                Set<DivisionalSecretariat> dval = dr.getDivisionalSecretariats();
                for (DivisionalSecretariat dval2 : dval) {
                    disjunction.add(Restrictions.eq("divisionalSecretariat", dval2));
                }
            }

            if (disb != null && subdisb != null) {
                PrivateRecord pr = this.serachDisability(disb, subdisb);
                Set<PrivateRecordHasNeedyPerson> hasNeedyPerson = pr.getPrivateRecordHasNeedyPersons();
                for (PrivateRecordHasNeedyPerson hasNeedyPerson1 : hasNeedyPerson) {
                    disjunction.add(Restrictions.eq("code", hasNeedyPerson1.getNeedyPerson().getCode()));
                }
            }

            criteria.add(conjunction);
            criteria.add(disjunction);
            list = criteria.list();

            if (age2 != 0 && age1 != 0) {
                list = calAge(list);
                for (NeedyPerson np : list) {
                    int ageval = np.getAge();
                    if (!(ageval >= age1 && ageval <= age2)) {
                        list.remove(np);
                    }
                }
            } else {
                list = calAge(list);
            }

        } catch (Exception e) {
            session.close();
        }

        return list;
    }

    @Override
    public NeedyPerson receiveCode(String code) {
        NeedyPerson np = null;
        Session session = this.sessionFactory.openSession();
        try {
            Criteria criteria = session.createCriteria(NeedyPerson.class);
            criteria.add(Restrictions.eq("code", code));

            np = (NeedyPerson) criteria.uniqueResult();

            return np;
        } catch (Exception e) {
        } finally {
            session.close();
        }

        return np;
    }

    @Override
    public void updateNeedyPersonRecords(NeedyPerson needyPerson, Set<PrivateRecordHasNeedyPerson> privateRecordHasNeedyPersons, Set<DeathDetail> dds) {
        Session session = this.sessionFactory.openSession();
        try {

            Transaction t = session.beginTransaction();
            session.update(needyPerson);

            if (!dds.isEmpty()) {

                for (DeathDetail deathDetail : dds) {
                    session.save(deathDetail);

                }
            }
            if (!privateRecordHasNeedyPersons.isEmpty()) {
                for (PrivateRecordHasNeedyPerson ppn : privateRecordHasNeedyPersons) {
                    session.save(ppn);
                }
            }
            t.commit();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    @Override
    public void updateNeedyContact(NeedyPerson needyPerson) {
        Session session = this.sessionFactory.openSession();
        try {
            Transaction tr = session.beginTransaction();
            session.update(needyPerson);
            tr.commit();
        } catch (Exception e) {
        } finally {
            session.close();
        }
    }

    @Override
    public void updateGuardian(Guardian g, Set<NeedyPersonHasGuardian> set, NeedyPerson np) {
        Session session = this.sessionFactory.openSession();
        try {
            Transaction tr = session.beginTransaction();
            session.update(np);
            session.saveOrUpdate(g);
            if(set!=null||!set.isEmpty())
            session.save(set.iterator().next());
            tr.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    @Override
    public Guardian searcgGuardian(int parseInt) {
        Session session = this.sessionFactory.openSession();
        Guardian guardian=null;
        try {
           guardian=(Guardian) session.createCriteria(Guardian.class).add(Restrictions.eq("id",parseInt)).uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return guardian;
    }

}

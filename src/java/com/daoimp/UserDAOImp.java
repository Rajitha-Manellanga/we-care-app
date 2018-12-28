/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daoimp;

import com.dao.UserDAO;
import com.pojos.Login;
import com.pojos.NeedyPerson;
import com.pojos.Role;
import com.pojos.User;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Rajitha
 */
@Repository("userDAO")
public class UserDAOImp implements UserDAO {

    public enum RoleName {

        ADMIN,
        DATA_ENTRY_OPERATOR;
    }

    private static final int NO_ATTEMPTS = 3;

    @Override
    public List<User> searchUserByAdmin(String key, String cat) {

        Session session = this.sessionFactory.openSession();
        Criteria criteria;
        List<User> users = null;
        try {
            criteria = session.createCriteria(NeedyPerson.class);
            switch (cat) {
                case "All":
                    users = criteria.list();
                    return users;
                case "NIC":
                    criteria.add(Restrictions.like("nic", "%" + key + "%"));
                    users = criteria.list();
                    return users;

                case "Name":
                    criteria.add(Restrictions.like("fistName", "%" + key + "%"));
                    users = criteria.list();
                    return users;
                case "Email":
                    criteria.add(Restrictions.like("email", "%" + key + "%"));
                    users = criteria.list();
                    return users;

                default:
                    users = criteria.list();
                    return users;
            }
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return users;

    }

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void registerUser(User user) {
        Session session = this.sessionFactory.openSession();
        try {
            Transaction tr = session.beginTransaction();
            session.save(user);
            tr.commit();

        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    @Override
    public long getUserCount() {
        Session session = this.sessionFactory.openSession();
        try {

            Criteria criteria = session.createCriteria(User.class);
            criteria.setProjection(Projections.rowCount());
            List l = criteria.list();
            Long x = (Long) l.get(0);
            if (x == 1) {
                return 2;
            } else {
                return x++;
            }

        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return 0;
    }

    @Override
    public User searchUser(String email, String password) {

        Session session = this.sessionFactory.openSession();
        User user = null;
        User user2 = null;
        Login login = null;
        try {

            Criteria criteria = session.createCriteria(User.class);
            criteria.add(Restrictions.eq("email", email));
            user = (User) criteria.uniqueResult();

            Criteria criteria2 = session.createCriteria(Login.class);
            criteria2.add(Restrictions.eq("user", user));
            criteria2.add(Restrictions.eq("password", password));
            login = (Login) criteria2.uniqueResult();
            user2 = login.getUser();

        } catch (HibernateException ex) {

        } finally {
            session.close();
        }

        return user2;
    }

    @Override
    public void saveUserLogin(User user) {

        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
        session.beginTransaction().commit();

    }

    @Override
    public void updateUserAdmin(User user) {

        //session.update(user);
        //session.beginTransaction().commit();
    }

    @Override
    public void registerUserLogin(User user, String username, String password) {

        Session session = this.sessionFactory.openSession();
        try {

            if (!user.equals(null)) {
                Transaction tr = session.beginTransaction();
                session.update(user);
                Login login = new Login();
                login.setUser(user);
                login.setPassword(password);
                login.setNoAttempts(NO_ATTEMPTS);

                session.save(login);
                tr.commit();

            }
        } catch (HibernateException ex) {

        } finally {
            session.close();
        }
        session.save(user);
        session.beginTransaction().commit();
    }

    @Override
    public Role searchUserRole() {
        Session session = this.sessionFactory.openSession();
        try {
            Criteria criteria = session.createCriteria(Role.class);
            criteria.add(Restrictions.eq("name", RoleName.DATA_ENTRY_OPERATOR.toString()));
            Role role = (Role) criteria.uniqueResult();
            return role;

        } catch (Exception e) {
        } finally {
            session.close();
        }
        return null;
    }

}

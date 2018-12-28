/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daoimp;

import com.dao.LoginDAO;
import com.pojos.Login;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Rajitha
 */
@Repository("loginDAO")
public class LoginDAOImp implements LoginDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveLogin(Login login) {
        Session session = this.sessionFactory.openSession();
        try {

            Transaction beginTransaction = session.beginTransaction();
            session.save(login);
            beginTransaction.commit();
        } catch (Exception e) {
        }finally{
            session.close();
        }

    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daoimp;

import com.dao.SecurityQueDAO;
import com.pojos.SecurityQuestion;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Rajitha
 */
@Repository("securityqueDAO")
public class SecurityQueDAOImp implements SecurityQueDAO {

    @Override
    public String displaySecurityQuestion() {
        Session session = com.connection.Controller.getSessionFactory().openSession();
        String hql = "from SecurityQuestion";
        Query query = session.createQuery(hql);
        List<SecurityQuestion> list = query.list();
        ArrayList<SecurityQuestion> al = new ArrayList();
        Gson gson = new Gson();
        String toJson = gson.toJson(al);
        System.out.println(toJson);
        session.close();
        return toJson;
    }

}

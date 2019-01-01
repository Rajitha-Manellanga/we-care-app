/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.serviceImp;

import com.dao.LoginDAO;
import com.pojos.Login;
import com.pojos.NeedyLogin;
import com.pojos.NeedyPerson;
import com.service.LoginService;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rajitha
 */
@Service("loginService")
public class LoginServiceImp implements LoginService{
    
    @Autowired
    private LoginDAO loginDAO;

    @Override
    @Transactional
    public void saveLogin(Login login) {
       this.loginDAO.saveLogin(login);
    }

    @Override
    public void saveNeedyLogin(NeedyLogin login, NeedyPerson np) {
       this.loginDAO.saveNeedyLogin(login, np);
    }
    
}

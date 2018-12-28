/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.serviceImp;

import com.dao.SecurityQueDAO;
import com.service.SecurityQueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Rajitha
 */
@Service("securityqueService")
public class SecurityQueServiceImp implements SecurityQueService{
    
    @Autowired
    private SecurityQueDAO SecurityQueDAO;

    @Override
    @Transactional
    public String displaySecurityQuestion() {
       return this.SecurityQueDAO.displaySecurityQuestion();
    }
    
}

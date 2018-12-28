/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.pojos.Login;
import org.hibernate.Session;

/**
 *
 * @author Rajitha
 */
public interface LoginDAO {
    void saveLogin(Login login);
    
}

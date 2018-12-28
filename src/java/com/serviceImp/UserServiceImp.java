/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.serviceImp;

import com.dao.UserDAO;
import com.pojos.Role;
import com.pojos.User;
import com.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Rajitha
 */
@Service("userService")
public class UserServiceImp implements UserService{
    
    @Autowired
    private UserDAO userDAO;

    @Override
    @Transactional
    public User searchUser(String email,String password) {
       return this.userDAO.searchUser(email,password);
    }

    @Override
    @Transactional
    public void saveUserLogin(User user) {
       this.userDAO.saveUserLogin(user);
    }

    @Override
    @Transactional
    public void updateUserAdmin(User user) {
      this.userDAO.updateUserAdmin(user);
    }

    @Override
    @Transactional
    public void registerUserLogin(User user,String username,String password) {
       this.userDAO.registerUserLogin(user,username,password);
    }

    @Override
    @Transactional
    public Role searchUserRole() {
        return this.userDAO.searchUserRole();
    }

    @Override
    @Transactional
    public long getUserCount() {
       return this.userDAO.getUserCount();
    }

    @Override
    @Transactional
    public void registerUser(User user) {
        this.userDAO.registerUser(user);
    }

    @Override
    @Transactional
    public List<User> searchUserByAdmin(String key, String cat) {
        return this.userDAO.searchUserByAdmin(key, cat);
    }
    
}

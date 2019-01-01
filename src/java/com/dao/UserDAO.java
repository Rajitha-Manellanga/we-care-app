/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.pojos.Role;
import com.pojos.SecurityQuestion;
import com.pojos.User;
import java.util.List;

/**
 *
 * @author Rajitha
 */
public interface UserDAO {

    User searchUser(String email, String password);

    void saveUserLogin(User user);

    void updateUserAdmin(User user);

    void registerUserLogin(User user, String username, String password);

    void registerUser(User user);

    Role searchUserRole();

    long getUserCount();

    List<User> searchUserByAdmin(String key, String cat);

    public User searchRegisterUser(String nic, String email);

    public SecurityQuestion searchQuestion();
}

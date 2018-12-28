/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.daoimp.SecurityQueDAOImp;
import com.daoimp.UserDAOImp;
import com.pojos.Login;
import com.pojos.NeedyLogin;
import com.pojos.NeedyPerson;
import com.pojos.User;
import com.service.UserService;
import java.io.Serializable;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rajitha
 */
@Controller

public class LoginController implements Serializable {
    
    private static final String session_key="LOGGEDIN_USER";

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public ModelAndView welcomePage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("index");
        return model;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView showLoginForm() {
        return new ModelAndView("login", "logdata", new Login());
    }

    @RequestMapping(value = "/submitlogin", method = RequestMethod.POST)

    public String submitLoginForm(@RequestParam Map<String, String> reqPar, Model model, HttpSession httpSession) {

        String username = reqPar.get("useremail");
        String password = reqPar.get("userpassword");

        User searchUser = this.userService.searchUser(username, password);

        //serach user type
        String roleName = searchUser.getRole().getName();
        Set<Login> logins = searchUser.getLogins();
        Login login = logins.iterator().next();

        //validate login
        if (searchUser.getEmail().equals(username) && login.getPassword().equals(password)) {
            //create http session
            httpSession.setAttribute(session_key, searchUser);

            if (roleName.equals(UserDAOImp.RoleName.ADMIN.toString())) {
                model.addAttribute("user_name", searchUser.getFirstName() + " " + searchUser.getLastName());
                return "redirect:adminhome.htm";
            } else if (roleName.equals(UserDAOImp.RoleName.DATA_ENTRY_OPERATOR.toString())) {
                model.addAttribute("user_name", searchUser.getFirstName() + " " + searchUser.getLastName());
                return "redirect:home";
            }
        } else {
            return "login";
        }
        return null;
    }

    @RequestMapping(value = "/logout.htm")
    public String logout(HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("LOGGEDIN_USER");
        if (user != null) {
            httpSession.invalidate();
        }

        return "login";
    }

    @RequestMapping(value = "addsecurityquestion")
    @ResponseBody
    public String addSecurityQuestion() {
        SecurityQueDAOImp securityQueDAOImp = new SecurityQueDAOImp();
        String displayQuestion = securityQueDAOImp.displaySecurityQuestion();
        return displayQuestion;

    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public ModelAndView showRegistrationForm() {
        ModelAndView modelAndView = new ModelAndView("signup");
        modelAndView.addObject("user", new User());
        return modelAndView;
    }

    @RequestMapping(value = "/userlogin", method = RequestMethod.POST)
    public ModelAndView registerUser(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, String> reqPar) {

        String nic = reqPar.get("nic");
        String username = reqPar.get("useremail");
        String password = reqPar.get("userpassword");

        //create User Object
        User user = new User();
        user.setNic(nic);
        this.userService.registerUserLogin(user, username, password);

        ModelAndView mav = new ModelAndView("login");
        return mav;
    }

    ///needy login option
    @RequestMapping(value = "/needylogin", method = RequestMethod.GET)
    public ModelAndView showNeedyLoginForm() {
        ModelAndView modelAndView = new ModelAndView("needy_login");
        modelAndView.addObject("needylogdata", new NeedyLogin());
        modelAndView.addObject("needy", new NeedyPerson());
        return modelAndView;
    }

//    @ExceptionHandler(value = NullPointerException.class)
//    public ModelAndView handleNullPointerException(Exception e){
//        //model.addAttribute("errormsg","Incorrect Login Details!!");
//       
//        ModelAndView modelAndView=new ModelAndView("login");
//        modelAndView.addObject("errormsg","Incorrect Login Details!!!");
//        return  modelAndView;
//    }
}

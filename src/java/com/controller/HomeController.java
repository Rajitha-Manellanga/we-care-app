/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.pojos.User;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rajitha
 */
@Controller
public class HomeController {
    
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public ModelAndView displayLandingPage(){
        ModelAndView mav=new ModelAndView("index");
        return mav;
    }
   
    @RequestMapping(value = "/adminhome",method = RequestMethod.GET)
    public ModelAndView displayAdminHome(HttpSession httpSession){
        User searchuser=(User) httpSession.getAttribute("LOGGEDIN_USER");
        ModelAndView mav=new ModelAndView("home_admin");
        if(searchuser!=null){
            mav.addObject("user_name", searchuser.getFirstName()+" "+searchuser.getLastName());
        }
        
        
        return mav;
    
    }
//    @RequestMapping(value = "/home",method = RequestMethod.POST)
//    public ModelAndView displayHome(){
//        ModelAndView modelAndView=new ModelAndView("home");
//        return modelAndView;
//    }
    @RequestMapping(value = "/needyhome",method = RequestMethod.GET)
    public ModelAndView displayNeedyHome(){
        
        ModelAndView mav=new ModelAndView("home_needy");
        return mav;
    
    }
    
     @RequestMapping(value = "/home",method = RequestMethod.GET)
    public ModelAndView displayDataEntryHome(){
        
        ModelAndView mav=new ModelAndView("home");
        return mav;
    
    }
}

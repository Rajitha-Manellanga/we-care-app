/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.pojos.Allowance;
import com.pojos.AllowanceDonator;
import com.pojos.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rajitha
 */
@Controller
public class AllowanceController {

    @RequestMapping(value = "/newdonor", method = RequestMethod.GET)
    public ModelAndView displayForm() {
        ModelAndView modelAndView=new ModelAndView("new_donor");
        modelAndView.addObject("donor",new AllowanceDonator());
        return modelAndView;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.pojos.Event;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rajitha
 */
@Controller
public class EventController {
    @RequestMapping(value = "/newevent", method = RequestMethod.GET)
    public ModelAndView displayForm(){
        ModelAndView modelAndView=new ModelAndView("new_event");
        modelAndView.addObject("event",new Event());
        return modelAndView;
    }
    
}

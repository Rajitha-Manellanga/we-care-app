/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.pojos.DeathDetail;
import com.pojos.NeedyPerson;
import com.pojos.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author Rajitha
 */
public class NeedyHandler extends HandlerInterceptorAdapter{
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
//        String path = request.getRequestURI().substring(request.getContextPath().length());
        User user = (User) session.getAttribute("LOGGEDIN_USER");
        //NeedyPerson needyPerson=(NeedyPerson) session.getAttribute("needyperson");
        //List l=(List) session.getAttribute("disabilitylist");
       // DeathDetail deathDetail=(DeathDetail) session.getAttribute("deathdetails");
      
            if (user == null) {
                ModelAndView modelAndView = new ModelAndView();
                //modelAndView.setViewName("redirect:login.htm");
                modelAndView.setViewName("login");
                //throw new ModelAndViewDefiningException(modelAndView);

                return false;
            }
        
        return true;

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
       
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex); //To change body of generated methods, choose Tools | Templates.
    }

    
}

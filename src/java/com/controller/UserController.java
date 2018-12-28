/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.pojos.NeedyPerson;
import com.pojos.Role;
import com.pojos.User;
import com.service.UserService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rajitha
 */
@Controller
public class UserController {
    
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/newuser", method = RequestMethod.GET)
    public ModelAndView displayForm() {
        ModelAndView modelAndView = new ModelAndView("new_user");
        return modelAndView;
    }

    @RequestMapping(value = "/registerdeo", method = RequestMethod.POST)
    @DateTimeFormat(pattern = "YYYY-MM-dd")
    public String submitUserRegisterForm(@RequestParam Map<String, String> reqPar, Model model) {
        String firstname = reqPar.get("firstname");
        String lastname = reqPar.get("lastname");
        String nic = reqPar.get("nic");
        String dob = reqPar.get("dob");
        String gender = reqPar.get("gender");
        String addressLine1 = reqPar.get("addressline1");
        String addressLine2 = reqPar.get("addressline2");
        String city = reqPar.get("city");
        String postalcode = reqPar.get("postalcode");
        String mobile = reqPar.get("mobile");
        String username = reqPar.get("useremail");

        User user = new User();
        //get count and increment by 1
        int id=(int) this.userService.getUserCount();
        user.setId(id);
        //set other variables
        user.setFirstName(firstname);
        user.setLastName(lastname);
        //check gender
        if ("M".equals(gender)) {
            user.setGender("M");
        } else {
            user.setGender("F");
        }
        String[] split = dob.split("/");
        dob = split[2] + "-" + split[1] + "-" + split[0];
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date birth = df.parse(dob);
            user.setDob(birth.toString());
        } catch (ParseException ex) {
           ex.printStackTrace();;
        }
        
        
        user.setNic(nic);
        user.setAddressLine1(addressLine1);
        user.setAddressLine2(addressLine2);
        user.setCity(city);
        user.setPostalCode(postalcode);
        user.setEmail(username);
        user.setMobile(mobile);
        //set user role

        Role role =this.userService.searchUserRole();
        user.setRole(role);

        //set registration date
       
        Date regDate=new Date();
        try {
            Date reg = df.parse(regDate.toString());
            user.setRegDate(reg);
        } catch (ParseException ex) {
           ex.printStackTrace();
        }

        this.userService.registerUser(user);
        return "home_admin";

    }
    
     @RequestMapping(value = "/searchuser", method = RequestMethod.GET)
    public String SearchNeedy(HttpSession httpSession, @RequestParam Map<String, String> reqPar, HttpServletRequest request, ModelMap map) throws ParseException {
        String key = reqPar.get("keyword");
        String category = reqPar.get("category");

        List<User> searchNeedyPerson = this.userService.searchUserByAdmin(key, key);
        map.addAttribute("needyList", searchNeedyPerson);
        //ModelAndView mav=new ModelAndVie
        //mav.addObject(searchNeedyPerson);
        return "view_user";
    }
    @RequestMapping(value = "/viewuser", method = RequestMethod.GET)

    public ModelAndView displayProfile() {
        ModelAndView modelAndView = new ModelAndView("view_user");
        return modelAndView;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.daoimp.PRCategory;
import com.pojos.AllowanceDonator;
import com.pojos.Event;
import com.pojos.PrivateRecord;
import com.service.SettingService;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

public class SettingsController {

    @Autowired
    private SettingService settingservice;

    @ResponseBody
    @RequestMapping(value = "/addprovince", method = RequestMethod.GET)
    public String receiveProvince() {
        String province = this.settingservice.receiveProvince();
        return province;
    }

    @ResponseBody
    @RequestMapping(value = "/adddistrict", method = RequestMethod.GET)
    public String receiveDistrict() {
        String province = this.settingservice.receiveDistrict();
        return province;
    }

    @ResponseBody
    @RequestMapping(value = "/adddds", method = RequestMethod.GET)
    public String receiveDS() {
        String province = this.settingservice.receiveDS();
        return province;
    }
    
    @RequestMapping(value = "/addpr", method = RequestMethod.POST)
    public String addPR(@RequestParam String cat,HttpServletRequest request) {
       
        if(cat.equals("DISABILITY")){
            String mcat=request.getParameter("category");
            String subcat=request.getParameter("subcategory");
            
            PrivateRecord pr=new PrivateRecord();
            pr.setType(PRCategory.DISABILITY.toString());
            pr.setName(mcat);
            pr.setSubName(subcat);
            
            this.settingservice.savePR(pr);
        }
         if(cat.equals("SKILL")){
            String mcat=request.getParameter("category");
            String subcat=request.getParameter("subcategory");
            
            PrivateRecord pr=new PrivateRecord();
            pr.setType(PRCategory.SKILL.toString());
            pr.setName(mcat);
            pr.setSubName(subcat);
            
            this.settingservice.savePR(pr);
        }
        return "redirect:settings.htm";
    }
    
    
    
     @RequestMapping(value = "/addsubpr", method = RequestMethod.POST)
    public String addsubPR(@RequestParam String cat,HttpServletRequest request) {
       
        if(cat.equals("DISABILITY")){
            String mcat=request.getParameter("category");
            String subcat=request.getParameter("subcategory");
            
            PrivateRecord pr=new PrivateRecord();
            pr.setType(PRCategory.DISABILITY.toString());
            pr.setName(mcat);
            pr.setSubName(subcat);
            
            this.settingservice.savePR(pr);
        }
         if(cat.equals("SKILL")){
            String mcat=request.getParameter("category");
            String subcat=request.getParameter("subcategory");
            
            PrivateRecord pr=new PrivateRecord();
            pr.setType(PRCategory.SKILL.toString());
            pr.setName(mcat);
            pr.setSubName(subcat);
            
            this.settingservice.savePR(pr);
        }
        return "redirect:settings.htm";
    }
    @RequestMapping(value = "/settings", method = RequestMethod.GET)
    public ModelAndView viewSettings() {
       ModelAndView mav=new ModelAndView("settings");
       return mav;
    }
    @ResponseBody
    @RequestMapping(value = "/getrowcount", method = RequestMethod.GET)
    public String receiveRowCount() {
        String province = this.settingservice.receiveRowCount();
        return province;
    }
     @ResponseBody
    @RequestMapping(value = "/discategory", method = RequestMethod.GET)
    public String receiveCat() {
        String province = this.settingservice.receiveCatNo();
        return province;
    }
    
    

    @ResponseBody
    @RequestMapping(value = "/loadskill", method = RequestMethod.GET)
    public String receiveSkill() {
        String val = this.settingservice.loadPrivateRecord(PRCategory.SKILL.toString());
        return val;
    }

    @ResponseBody
    @RequestMapping(value = "/loadsubskill", method = RequestMethod.GET)
    public String receiveSUbSkill(@RequestParam String cat) {
        String val = this.settingservice.loadPrivateRecord(PRCategory.SKILL.toString(), cat);
        return val;
    }

    @ResponseBody
    @RequestMapping(value = "/loadallowance", method = RequestMethod.GET)
    public String receiveAllowance() {
        String val = this.settingservice.loadPrivateRecord(PRCategory.ALLOW.toString());
        return val;
    }
    @ResponseBody
    @RequestMapping(value = "/loadsuballowance", method = RequestMethod.GET)
    public String receiveSUbAllowance(@RequestParam String cat) {
        String val = this.settingservice.loadPrivateRecord(PRCategory.ALLOW.toString(),cat);
        return val;
    }

    @ResponseBody
    @RequestMapping(value = "/loadevent", method = RequestMethod.GET)
    public String receiveEvents() {
        String val = this.settingservice.loadPrivateRecord(PRCategory.EVENT.toString());
        return val;
    }

    @ResponseBody
    @RequestMapping(value = "/loadsubevent", method = RequestMethod.GET)
    public String receiveSubEvents(@RequestParam String eventcat) {
        String val = this.settingservice.loadPrivateRecord(PRCategory.EVENT.toString(), eventcat);
        return val;
    }

    @RequestMapping(value = "/savedonor", method = RequestMethod.POST)
    public String saveDonor(HttpServletRequest request) {
        String cat = request.getParameter("evt1");
        String subcat = request.getParameter("evt2");
        String name = request.getParameter("dname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");

        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String country = request.getParameter("country");

        try {
            AllowanceDonator ad = new AllowanceDonator();
            ad.setAddressLine1(address1);
            ad.setAddressLine2(address2);
            ad.setCity(city);
            ad.setCountry(country);
            ad.setEmail(email);
            ad.setMobile(mobile);
            ad.setName(name);
            ad.setStatus("A");

            PrivateRecord pr = this.settingservice.loadPrivateRecord(PRCategory.DON.toString(), cat, subcat);
            ad.setPrivateRecord(pr);
            
            this.settingservice.saveDonor(ad);

        } catch (NullPointerException e) {
        }
        return "redirect:donor.htm";
    }

    @RequestMapping(value = "/saveevent", method = RequestMethod.POST)
    public String saveEvents(HttpServletRequest request) {
        String cat = request.getParameter("evt1");
        String subcat = request.getParameter("evt2");
        String begindate = request.getParameter("begindate");
        String enddate = request.getParameter("enddate");
        String name = request.getParameter("ename");
        String venue = request.getParameter("evenue");

        try {
            if (begindate.length() == 0 || enddate.length() == 0 || name.length() == 0 || venue.length() == 0) {
                return "redirect:events.htm";
            }
            String[] arr1 = begindate.split("/");
            String[] arr2 = enddate.split("/");
            begindate = arr1[0] + "-" + arr1[1] + "-" + arr1[2];
            enddate = arr2[0] + "-" + arr2[1] + "-" + arr2[2];

            Date bd = new SimpleDateFormat("dd-MM-yyyy").parse(begindate);
            Date ed = new SimpleDateFormat("dd-MM-yyyy").parse(enddate);

            Event event = new Event();
            event.setDescription(name);
            event.setVenue(venue);
            event.setBeginDate(bd);
            event.setEndDate(ed);
            event.setStatus("A");
            PrivateRecord pr = this.settingservice.loadPrivateRecord(PRCategory.EVENT.toString(), cat, subcat);
            event.setPrivateRecord(pr);

            this.settingservice.saveEvent(event);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:events.htm";
    }

    @ResponseBody
    @RequestMapping(value = "/loadneedyevent", method = RequestMethod.GET)
    public String receiveEventsNeedy() {
        String val = this.settingservice.loadEvents();
        return val;
    }

    @ResponseBody
    @RequestMapping(value = "/loaddonor", method = RequestMethod.GET)
    public String receiveDonors() {
        String val = this.settingservice.loadPrivateRecord(PRCategory.DON.toString());
        return val;
    }

    @ResponseBody
    @RequestMapping(value = "/loadsubdonor", method = RequestMethod.GET)
    public String receiveSubConors(@RequestParam String eventcat) {
        String val = this.settingservice.loadPrivateRecord(PRCategory.DON.toString(), eventcat);
        return val;
    }

    @RequestMapping(value = "/events.htm", method = RequestMethod.GET)
    public ModelAndView addEvents() {
        ModelAndView mav = new ModelAndView("event");
        return mav;
    }

    @RequestMapping(value = "/donor.htm", method = RequestMethod.GET)
    public ModelAndView addDonor() {
        ModelAndView mav = new ModelAndView("new_donor");
        return mav;
    }
}

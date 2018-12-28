/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.daoimp.PRCategory;
import com.service.SettingService;
import javafx.scene.input.KeyCode;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @ResponseBody
    @RequestMapping(value = "/loadskill", method = RequestMethod.GET)
    public String receiveSkill() {
        String province = this.settingservice.loadPrivateRecord(PRCategory.SKILL.toString());
        return province;
    }
}

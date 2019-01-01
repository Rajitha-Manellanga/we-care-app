/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.serviceImp;

import com.dao.SettingDAO;
import com.daoimp.PRCategory;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pojos.AllowanceDonator;
import com.pojos.District;
import com.pojos.DivisionalSecretariat;
import com.pojos.Event;
import com.pojos.PrivateRecord;
import com.pojos.Province;
import com.service.SettingService;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rajitha
 */
@Service("SettingService")
public class SettingServiceImp implements SettingService {

    @Autowired
    private SettingDAO settingdao;

    @Override
    public String receiveProvince() {
        String toJson = null;
        try {

            List<Province> list = this.settingdao.receiveProvince();
            ArrayList al = new ArrayList(list);
            ObjectMapper objectMapper = new ObjectMapper();
            toJson = objectMapper.writeValueAsString(al);
        } catch (JsonProcessingException ex) {
            ex.printStackTrace();
        }
        return toJson;

    }

    @Override
    public String receiveDistrict() {
        String toJson = null;
        try {

            List<District> list = this.settingdao.receiveDistrict();
            ArrayList al = new ArrayList(list);
            ObjectMapper objectMapper = new ObjectMapper();
            toJson = objectMapper.writeValueAsString(al);
        } catch (JsonProcessingException ex) {
            ex.printStackTrace();
        }
        return toJson;
    }

    @Override
    public String receiveDS() {
        String toJson = null;
        try {

            List<DivisionalSecretariat> list = this.settingdao.receiveDS();
            ArrayList al = new ArrayList(list);
            ObjectMapper objectMapper = new ObjectMapper();
            toJson = objectMapper.writeValueAsString(al);
        } catch (JsonProcessingException ex) {
            ex.printStackTrace();
        }
        return toJson;
    }

    @Override
    public String loadPrivateRecord(String type) {
        String toJson = null;
        try {

            List<PrivateRecord> list = this.settingdao.loadPrivateRecord(type);
            ArrayList al = new ArrayList(list);
            ObjectMapper objectMapper = new ObjectMapper();
            toJson = objectMapper.writeValueAsString(al);
        } catch (JsonProcessingException ex) {
            ex.printStackTrace();
        }
        return toJson;
    }

    @Override
    public String loadPrivateRecord(String type, String subtype) {
        String toJson = null;
        try {

            List<PrivateRecord> list = this.settingdao.loadPrivateRecord(type, subtype);
            ArrayList al = new ArrayList(list);
            ObjectMapper objectMapper = new ObjectMapper();
            toJson = objectMapper.writeValueAsString(al);
        } catch (JsonProcessingException ex) {
            ex.printStackTrace();
        }
        return toJson;
    }

    @Override
    public PrivateRecord loadPrivateRecord(String type, String subtype, String value) {
        PrivateRecord pr = null;
        try {

            pr = this.settingdao.loadPrivateRecord(type, subtype, value);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return pr;
    }

    @Override
    public String loadEvents(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String loadDonors(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String loadEvents() {
        String toJson = null;
        try {

            List<Event> list = this.settingdao.loadEvents();
            ArrayList al = new ArrayList(list);
            ObjectMapper objectMapper = new ObjectMapper();
            toJson = objectMapper.writeValueAsString(al);

        } catch (JsonProcessingException ex) {
            ex.printStackTrace();
        }
        return toJson;
    }

    @Override
    public void saveEvent(Event event) {
        this.settingdao.saveEvent(event);
    }

    @Override
    public Event searchEvent(String event) {
        return this.settingdao.searchEvent(event);
    }

    @Override
    public void saveDonor(AllowanceDonator ad) {
        this.settingdao.saveDonor(ad);
    }

    @Override
    public String receiveRowCount() {

        String toJson = null;
        try {

            List<Long> list = this.settingdao.loadRecordCount();
            ArrayList al = new ArrayList(list);
            ObjectMapper objectMapper = new ObjectMapper();
            toJson = objectMapper.writeValueAsString(al);

        } catch (JsonProcessingException ex) {
            ex.printStackTrace();
        }
        return toJson;
    }

    @Override
    public String receiveCatNo() {
         String toJson = null;
        try {

            List<PrivateRecord> list = this.settingdao.loadPrivateRecord(PRCategory.DISABILITY.toString());
            ArrayList al = new ArrayList(list);
            ObjectMapper objectMapper = new ObjectMapper();
            toJson = objectMapper.writeValueAsString(al);

        } catch (JsonProcessingException ex) {
            ex.printStackTrace();
        }
        return toJson;
    }

    @Override
    public void savePR(PrivateRecord pr) {
        
        this.settingdao.savePR(pr);
       
    }

}

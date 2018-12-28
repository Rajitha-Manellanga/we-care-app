/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.serviceImp;

import com.dao.SettingDAO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pojos.District;
import com.pojos.DivisionalSecretariat;
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String loadPrivateRecord(String type, String subtype) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String loadPrivateRecord(String type, String subtype, String value) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String loadEvents(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String loadDonors(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

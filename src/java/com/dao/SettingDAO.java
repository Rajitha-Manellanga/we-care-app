/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.pojos.Allowance;
import com.pojos.AllowanceDonator;
import com.pojos.District;
import com.pojos.DivisionalSecretariat;
import com.pojos.Event;
import com.pojos.PrivateRecord;
import com.pojos.Province;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Rajitha
 */

public interface SettingDAO {
    List<Province> receiveProvince();

    List<District> receiveDistrict();

    List<DivisionalSecretariat> receiveDS();

    List<PrivateRecord> loadPrivateRecord(String type);

    List<PrivateRecord> loadPrivateRecord(String type, String name);

    PrivateRecord loadPrivateRecord(String type, String subtype, String value);

    Event loadEvents(String name);

    AllowanceDonator loadDonors(String name);
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.pojos.AllowanceDonator;
import com.pojos.Event;
import com.pojos.PrivateRecord;

/**
 *
 * @author Rajitha
 */
public interface SettingService {

    String receiveProvince();

    String receiveDistrict();

    String receiveDS();

    String loadPrivateRecord(String type);

    String loadPrivateRecord(String type, String subtype);

    PrivateRecord loadPrivateRecord(String type, String subtype, String value);

    String loadEvents(String name);

    String loadDonors(String name);

    public String loadEvents();

    public void saveEvent(Event event);

    public Event searchEvent(String event);

    public void saveDonor(AllowanceDonator ad);

    public String receiveRowCount();

    public String receiveCatNo();

    public void savePR(PrivateRecord pr);
}

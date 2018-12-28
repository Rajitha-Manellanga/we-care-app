/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

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

    String loadPrivateRecord(String type, String subtype, String value);

    String loadEvents(String name);

    String loadDonors(String name);
}

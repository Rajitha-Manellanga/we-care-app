/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.pojos.Event;
import com.pojos.NeedyPerson;
import java.util.List;

/**
 *
 * @author Rajitha
 */
public interface EventService {
    
    void saveEvent(Event event);
    void updateEvent(Event event);
    void deleteEvent(Event event);
    List<Event> searchEvent();
    List<NeedyPerson> searchEventNeedy();
    
}

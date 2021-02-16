/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// testing comment

package com.dao;

import com.pojos.Event;
import com.pojos.NeedyPerson;
import java.util.List;

/**
 *
 * @author Rajitha
 */
public interface EventDAO {
    
    void saveEvent(Event event);
    void updateEvent(Event event);
    void deleteEvent(Event event);
    List<Event> searchEvent();
    List<NeedyPerson> searchEventNeedy();
    
}

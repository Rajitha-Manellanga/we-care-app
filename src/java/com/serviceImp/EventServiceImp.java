/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.serviceImp;

import com.dao.EventDAO;
import com.pojos.Event;
import com.pojos.NeedyPerson;
import com.service.EventService;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rajitha
 */
//@Service("eventService")
public class EventServiceImp implements EventService{
    
    @Autowired
    private EventDAO eventDAO;

    @Override
    @Transactional
    public void saveEvent(Event event) {
        this.eventDAO.saveEvent(event);
    }
    @Override
    @Transactional
    public void updateEvent(Event event) {
        this.eventDAO.updateEvent(event);
    }

    @Override
    @Transactional
    public void deleteEvent(Event event) {
        this.eventDAO.deleteEvent(event);
    }

    @Override
    @Transactional
    public List<Event> searchEvent() {
       return this.eventDAO.searchEvent();
    }

    @Override
    @Transactional
    public List<NeedyPerson> searchEventNeedy() {
        return this.searchEventNeedy();
    }
    
}

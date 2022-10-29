package com.finalpj.nbw.event.controller;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.service.EventService;
import com.finalpj.nbw.event.domain.PageHandler;
import com.finalpj.nbw.event.domain.SearchCondition;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.List;

@Log4j
@RequestMapping("/event/*")
@Controller
public class EventController {

    EventService eventService;

    public EventController(EventService eventService){
        this.eventService = eventService;
    }

    @GetMapping("/detail")
    public String eventDetail(){
        return "/event/eventDetail";
    }
    @GetMapping("/list")
    public String eventList(){
        return "/event/eventList";
    }

    // 공지글 목록 페이지 요청

    @GetMapping("read")
    public String read(Integer ev_no, SearchCondition sc, Model m){
        try {
            Event eventDto = eventService.getEvent(ev_no);
            m.addAttribute("eventDto", eventDto);
            m.addAttribute("SearchCondition", sc);
            log.info("eventDto = " + eventDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/event/eventDetail";
    }

}

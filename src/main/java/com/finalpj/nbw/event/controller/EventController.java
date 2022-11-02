package com.finalpj.nbw.event.controller;


import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.service.EventService;
import lombok.extern.log4j.Log4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    /******************************* [[이벤트 리스트 페이지]] *****************************/
    @GetMapping("/list")
    public String eventList(Model m) throws Exception {
        log.info("컨트롤러 이벤트 리스트 호출 성공");
        m.addAttribute("eventSelectAll", eventService.eventList());
        log.info("이벤트 호출 성공"+eventService.eventList().toString());
        return "/event/eventList";
    }
    /***************************** [[이벤트 디테일 페이지]] *******************************/
    @GetMapping("/detail")
    public String eventRead(Integer ev_no, Model m){
        log.info(ev_no);
        try {
            Event event = (Event) eventService.eventRead(ev_no);
            m.addAttribute("eventSelect",event);
            log.info(event);
        } catch (Exception e) {
        }
        return "/event/eventDetail";
    }

}

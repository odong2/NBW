package com.finalpj.nbw.event.controller;

import com.finalpj.nbw.event.service.EventService;
import com.finalpj.nbw.event.domain.Event;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@RequestMapping("/event/*")
@Controller
public class EventController {

    EventService eventService;

    public EventController(EventService eventService){
        this.eventService = eventService;
    }

    /******************************* [[이벤트 리스트 페이지]] *****************************/
    @GetMapping("list")
    public String eventList(Model m) throws Exception {
        log.info("컨트롤러 이벤트 리스트 호출 성공");
        m.addAttribute("eventSelectAll", eventService.eventList());
        log.info("이벤트 호출 성공"+eventService.eventList().toString());
        return "/event/eventList";
    }
    /***************************** [[이벤트 디테일 페이지]] *******************************/
    @GetMapping("detail")
    public String eventRead(Integer ev_no, Model m){
        try {
            Event event = (Event) eventService.eventRead(ev_no);
            if(event.getEv_file() != null) {
                String saveFileName = event.getEv_file();
                int idx = saveFileName.indexOf("_");
                String originalFileName = saveFileName.substring(idx+1);
//                event.setEv_filename(originalFileName);
            }
            m.addAttribute("eventSelect",event);
            log.info(event);
        } catch (Exception e) {
        }
        return "/event/eventDetail";
    }

}

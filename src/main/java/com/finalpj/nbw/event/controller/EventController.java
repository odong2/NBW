package com.finalpj.nbw.event.controller;

import com.finalpj.nbw.event.service.EventService;
import lombok.extern.log4j.Log4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@RequestMapping("/event/*")
@Controller
public class EventController {

    EventService eventService;

    Logger logger = LoggerFactory.getLogger(EventController.class);

    public EventController(EventService eventService){
        this.eventService = eventService;
    }

//    @GetMapping("/detail")
//    public String eventDetail(){
//        return "/event/eventDetail";
//    }
//    @GetMapping("/list")
//    public String eventList(){
//        return "/event/eventList";
//    }

    @GetMapping("/list")
    public String eventList(Model model) throws Exception {
        logger.info("컨트롤러 이벤트 리스트 호출 성공");
        model.addAttribute("eventListAll", eventService.eventList());
//        logger.info("Event컨트롤러");
        logger.info("이벤트 호출 성공"+eventService.eventList().toString());
        return "/event/eventList";
    }

//    @GetMapping("/detail")
//    public String read(Integer ev_no, SearchCondition sc, Model m){
//        try {
//            Event eventDto = eventService.selectList(ev_no);
//            m.addAttribute("eventDto", eventDto);
////            m.addAttribute("SearchCondition", sc);
//            log.info("eventDto = " + eventDto);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "/event/eventDetail";
//    }

}

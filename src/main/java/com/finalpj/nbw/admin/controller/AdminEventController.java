package com.finalpj.nbw.admin.controller;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.service.EventService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/event/*")
public class AdminEventController {

    EventService eventService;

    Logger logger = LoggerFactory.getLogger(AdminEventController.class);

    public AdminEventController (EventService eventService) {
        this.eventService = eventService;
    }
    /***************** [[관리자 이벤트 조회페이지]] *********************/
    @GetMapping("list")
    public String adminEvent() {
        return "admin/event/event";
    }

    /***************** [[관리자 이벤트 신청자 조회페이지]] ***************/
    @GetMapping("applicant")
    public String adminEventApplicant() {
        return "admin/event/eventApplicant";
    }

    /***************** [[관리자 이벤트 등록페이지]] ***************/
    @GetMapping("write")
    public String eventWrite(Model m) {
        return "admin/event/eventRegister";
    }
    @PostMapping("/write")
    public String eventWrite(Event event) throws Exception {
        eventService.eventWrite(event);
        return "redirect:/admin/event/list";
    }


    /************************************ [[이벤트 삭제 페이지]] *********************************/
//    public String eventRemove (Integer ev_no, Model m) {
//        try {
//            eventService.eventRemove(ev_no);
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//        return "redirect:/admin/event/list";
//    }
}

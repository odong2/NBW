package com.finalpj.nbw.mypage.controller;

import com.finalpj.nbw.event.service.EventService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Log4j
@RequestMapping("/mypage/event/")
@Controller
public class MypageEventController {

    EventService eventService;

    public MypageEventController(EventService eventService) {
        this.eventService = eventService;
    }
    /********************************* [[신청한 이벤트 페이지]] *********************************/
    @GetMapping("/list")
    public String mypageEventList(Model m, HttpSession session) throws Exception {


        log.info("qna 컨트롤러 호출 성공");
        log.info("mypageEventList 마이페이지 컨트롤러 호출 성공 ");
        m.addAttribute("myEventSelectAll",eventService.mypageEventList());
        return "mypage/event/event";
    }

}

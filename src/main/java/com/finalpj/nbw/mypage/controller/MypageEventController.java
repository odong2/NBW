//package com.finalpj.nbw.mypage.controller;
//
//import com.finalpj.nbw.event.service.EventService;
//import lombok.extern.log4j.Log4j;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Log4j
//@RequestMapping("/mypage/*")
//@Controller
//public class MypageEventController {
//
//    EventService eventService;
//
//    public MypageEventController(EventService eventService) {
//        this.eventService = eventService;
//    }
//
//    @GetMapping("eventlist")
//    public String mypageEventList() {
//        return "mypage/event/event";
//    }
//
//}

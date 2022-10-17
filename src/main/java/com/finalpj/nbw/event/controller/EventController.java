package com.finalpj.nbw.event.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@RequestMapping("/event/*")
@Controller
public class EventController {

    @GetMapping("eventTest")
    public String eventTest() {
        log.info("테스트");
        return "eventList";
    }
}

package com.finalpj.nbw.qna.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@RequestMapping("/error/*")
@Controller
public class QnaController {

    @GetMapping("error")
    public String errorTest() {
        return "/error/error";
    }
}

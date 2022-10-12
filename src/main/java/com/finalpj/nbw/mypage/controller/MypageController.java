package com.finalpj.nbw.mypage.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@RequestMapping("/mypage/*")
@Controller
public class MypageController {

        @GetMapping("mypageTest")
        public String mypageTest(){
            log.info("테스트");
            return "/mypage/mypage";
        }
}

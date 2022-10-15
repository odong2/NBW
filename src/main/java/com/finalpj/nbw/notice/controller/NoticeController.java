package com.finalpj.nbw.notice.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
@Log4j
@Controller
@RequestMapping("/notice/*")
public class NoticeController {
   @GetMapping("noticeList")
    public String noticeList(){
        return "/notice/noticePage";
    }

    @GetMapping("notice")
    public String notice(){
    return "/notice/noticeDetail";
   }
}

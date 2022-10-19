package com.finalpj.nbw.qna.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class QnaController {
    @GetMapping("mypageQnaTest")
    public String mypageQnaTest() {
        return "/mypage/mypageQna";
    }
}

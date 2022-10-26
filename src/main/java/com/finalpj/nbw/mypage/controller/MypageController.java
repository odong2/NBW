package com.finalpj.nbw.mypage.controller;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.mypage.service.MypageService;
import lombok.extern.log4j.Log4j;

//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@RequestMapping("/mypage/*")
@Controller
public class MypageController {

        @Autowired
        private MypageService mypageService;

        @GetMapping("mypageTest")
        public String mypageTest(//Authentication authentication
        		){
//        	Member member = (Member) authentication.getPrincipal();
//            log.info("member: "+ member.getUsername());
            return "/mypage/mypage";
        }

        /* ========= 회원 정보 수정 페이지 ========= */
        @GetMapping("info")
        public String getMypageInfo(){
            log.info("mypageInfo페이지");
            return "/mypage/mypageInfo";
        }

        @PostMapping("info")
        public String postMypageInfo(@ModelAttribute Member member) throws Exception{
            log.info("====================== 내 정보 수정 처리 POST =======================");
            int intI = mypageService.postMyInfo(member);
            return "redirect:info";
        }

        @GetMapping("event")
        public String mypageEventTest() {
            return "/mypage/mypageEvent";
        }

        @GetMapping("qna")
        public String mypageQnaTest() {
        return "/mypage/mypageQna";
    }
        @GetMapping("test")
        public String test() {
        	return "/mypage/mypage";
        }
}

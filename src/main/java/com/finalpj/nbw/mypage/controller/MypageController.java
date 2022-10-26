package com.finalpj.nbw.mypage.controller;

import com.finalpj.nbw.member.domain.Member;
import lombok.extern.log4j.Log4j;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@RequestMapping("/mypage/*")
@Controller
public class MypageController {

        @GetMapping("mypageTest")
        public String mypageTest(Authentication authentication){
        	Member member = (Member) authentication.getPrincipal();
            log.info("member: "+ member.getUsername());
            return "/mypage/mypage";
        }

        /* ========= 회원 정보 수정 페이지 ========= */
        @GetMapping("info")
        public String doMypageInfo(){
            log.info("mypageInfo페이지");
            return "/mypage/mypageInfo";
        }
    /***************** [[마이페이지 참여중인 이벤트 조회페이지]] ***************/
        @GetMapping("event")
        public String mypageEventTest() {
            return "/mypage/mypageEvent";
        }
    /***************** [[마이페이지 문의 접수페이지]] ***************/
        @GetMapping("qna")
        public String mypageQnaTest() {
        return "/mypage/mypageQna";
    }
    /***************** [[마이페이지 문의 조회페이지]] ***************/
        @GetMapping("qnalist")
        public String mypageQnaListTest() {
        return "/mypage/mypageQnaList";
    }
    /***************** [[마이페이지 문의 디테일 조회페이지]] ***************/
        @GetMapping("qnaDetail")
        public String mypageQnaDetailTest() {
        return "/mypage/mypageQnaDetail";
    }

        @GetMapping("test")
        public String test() {
        	return "/mypage/mypage";
        }
}

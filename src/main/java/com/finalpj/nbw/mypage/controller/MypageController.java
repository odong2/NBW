package com.finalpj.nbw.mypage.controller;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.member.service.MemberService;
import com.finalpj.nbw.mypage.service.MypageService;
import lombok.extern.log4j.Log4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Log4j
@RequestMapping("/mypage/*")
@Controller
public class MypageController {

        @Autowired
        private MypageService mypageService;

        @GetMapping("mypageTest")
        public String mypageTest(Authentication authentication, Model model){
        	Member member = (Member) authentication.getPrincipal();
            log.info("member: "+ member.getUsername());
            return "/mypage/mypage";
        }

        /* ========= 회원 정보 수정 페이지 GET ========= */
//        @GetMapping("info")
//        public String getMypageInfo(Authentication authentication) throws Exception {
//            /* 현재 세션의 사용자 객체를 가져온다. */
//            Member member = (Member) authentication.getPrincipal();
//
//            /* 사용자 아이디를 변수 id에 할당한다. */
//            String id = member.getUsername();
//            log.info("조회된 사용자 아이디 ===> "+ id);
//            /* 조회 서비스의 파라미터로 현자 세션의 사용자 아이디를 넘기고 그에 해당하는 객체를 다시 반환받는다. */
//            member = mypageService.getMyInfo(id);
//            return "/mypage/mypageInfo";
//        }


//        @PostMapping("info")
//        public String postMypageInfo(Authentication authentication) throws Exception{
//            Member member = (Member)authentication.getPrincipal();
//            log.info("====================== 내 정보 수정 처리 POST ======================= 수정할 아이디 ==> "+ member.getMem_id());
//            int intI = mypageService.postMyInfo(member);
//            return "redirect:info";
//        }


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

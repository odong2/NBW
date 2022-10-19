package com.finalpj.nbw.member.controller;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.member.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {

    @Autowired(required = false)
    private MemberService memberService;

    @Autowired(required = false)
    private BCryptPasswordEncoder pwEncoder;

    /* GET : 회원가입 페이지 */
    @GetMapping("/register")
    public String joinPage(){
        log.info("===================== 회원가입 페이지 GET =======================");
        return "join";
    }

    @PostMapping("/register")
    public String joinPageExe(@ModelAttribute Member member) throws Exception {
        log.info("===================== 회원가입 처리 POST =======================");

        /* 인코딩 하기 전 비밀번호 */
        String publicPw="";
        /* 인코딩 한 이후 비밀번호 */
        String encodePw="";

        /* ======================== 비밀번호 인코딩 과정 ================================
        * (1) member 객체로부터 비밀번호 데이터를 얻는다.
        * (2) pwEncoder 객체는 publicPw를 인코딩한 뒤 encodePw 객체에 담는다.
        * (3) 인코딩된 비밀번호가 담긴 encodePw를 member 객체에 set 한다.
        * =========================================================================*/

        /* (1) */
        publicPw = member.getMem_pw();
        log.info("publicPw ==> "+ publicPw);
        /* (2) */
        encodePw = pwEncoder.encode(publicPw);
        log.info("encodePw ==> "+ encodePw);
        /* (3) */
        member.setMem_pw(encodePw);

        int intI = memberService.insertMember(member);
        log.info("insertMember 의 intI ====> "+ intI);

        /* 회원가입이 성공하면 이동할 디폴트 페이지는? 로그인 페이지*/
        return "login";
    }



}


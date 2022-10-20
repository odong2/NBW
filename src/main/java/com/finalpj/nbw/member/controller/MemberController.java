package com.finalpj.nbw.member.controller;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.member.service.JoinService;

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

    @Autowired
    JoinService joinService;


    /* GET : 회원가입 페이지 */
    @GetMapping("/register")
    public String joinPage(){
        log.info("===================== 회원가입 페이지 GET =======================");
        return "join";
    }

    @PostMapping("/register")
    public String joinPageExe(@ModelAttribute Member member) throws Exception {
        log.info("===================== 회원가입 처리 POST =======================");
        String url = "";

        int count = joinService.idCheck(member.getMem_id());
        /* count 가 0 이면 joinService 객체야 회원가입 진행시켜,, 그리고 로그인 페이지로 이동해줘..
        * 아니면? 회원가입 진행하지 말고 계속 이 회원가입 페이지에 있어줘.. */
        if(count != 0) {
            url = "redirect:/register";
        } else {
            int intI = joinService.postMem(member);
            log.info("insertMember 의 intI ====> "+ intI);
            url = "login";

            log.info("=============== 회원가입 성공! "+url+" 로 이동합니다.===============");
        }
        /* 회원가입이 성공하면 이동할 디폴트 페이지는? 로그인 페이지*/
        return url;
    }



}


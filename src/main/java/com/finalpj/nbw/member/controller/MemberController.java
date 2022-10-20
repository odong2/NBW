package com.finalpj.nbw.member.controller;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.member.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/member/")
public class MemberController {

    @Autowired
    private MemberService memberService;
    /* GET : 회원가입 페이지 */
    @GetMapping("/register")
    public String joinPage(){
//        log.info("===================== 회원가입 페이지 GET =======================");
        return "join/join";
    }

    @GetMapping("/idCheck")
    public String idCheck(String id, Model model) throws Exception{
        model.addAttribute("id", memberService.idCheck(id));
        return "join/idCheck";
    }

    @PostMapping("/register")
    public String joinPageExe(@ModelAttribute Member member) throws Exception {
        log.info("===================== 회원가입 처리 POST =======================");
        int intI = memberService.postMem(member);
        /* 회원가입이 성공하면 이동할 디폴트 페이지는? 로그인 페이지*/
        return "redirect:/login";
    }

}

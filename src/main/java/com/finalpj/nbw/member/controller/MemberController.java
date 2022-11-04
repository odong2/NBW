package com.finalpj.nbw.member.controller;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.member.domain.PasswordMeter;
import com.finalpj.nbw.member.domain.PasswordStrength;
import com.finalpj.nbw.member.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequestMapping("/member/")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private PasswordMeter passwordMeter;

    /* GET : 회원가입 페이지 */
    @GetMapping("register")
    public String joinPage(){
        log.info("===================== 회원가입 페이지 GET =======================");
        return "join/join";
    }

    @GetMapping("idCheck")
    public String idCheck(String id, Model model) throws Exception{
        model.addAttribute("id", memberService.idCheck(id));
        return "join/idCheck";
    }


    @RequestMapping(value="join", method= RequestMethod.POST)
    public String joinPageExe(@ModelAttribute Member member) throws Exception {
        log.info("===================== 회원가입 처리 POST =======================");
        int intI = memberService.postMem(member);
        /* 회원가입이 성공하면 이동할 디폴트 페이지는? 로그인 페이지*/
        return "redirect:/login";
    }


    @GetMapping(value = "pwCheck")
    @ResponseBody
    public String pwCheck(String pw) throws Exception{
        String result = passwordMeter.meter(pw).toString();
        log.info("비밀번호 안전도 수준은? ====> "+ result);

        /* ajax 를 통해 뷰로 안전도 수준을 반환한다. */
        return result;
    }
    
    @PostMapping("like")
    @ResponseBody
    public Map<String,Object> like(HttpSession session, @RequestBody Map<String,Object> map){
    	Member member = (Member) session.getAttribute("member");
    	
    	if (member != null) {
    		map.put("isLogin",true);
        	map.put("mem_id", member.getMem_id());
    		map = memberService.addLkie(map);
    	}else {
    		map.put("isLogin",false);
    		map.put("msg","로그인이 필요합니다.");
    	}
    	
    	return map;
    }
}

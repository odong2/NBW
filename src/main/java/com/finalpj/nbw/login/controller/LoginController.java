package com.finalpj.nbw.login.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalpj.nbw.login.dto.FindDto;
import com.finalpj.nbw.login.dto.LoginDto;
import com.finalpj.nbw.login.exception.LoginException;
import com.finalpj.nbw.login.service.LoginService;
import com.finalpj.nbw.login.service.Oauth2LoginService;
import com.finalpj.nbw.member.domain.Member;

import lombok.extern.log4j.Log4j;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Controller
public class LoginController {
	
	private Oauth2LoginService oauth2LoginService;
	private LoginService loginService;
	
	public LoginController() {}
	
	@Autowired
	public LoginController(Oauth2LoginService oauth2LoginService, LoginService loginService) {
		this.oauth2LoginService = oauth2LoginService;
		this.loginService = loginService;
	}
	
	@GetMapping("/login")
	public String getLogin(Model model) {
		String naverUrl = oauth2LoginService.getAuthorizationUrl("naver");
		String kakaoUrl = oauth2LoginService.getAuthorizationUrl("kakao");
		
		HashMap<String,String> urlMap = new HashMap<>();
		urlMap.put("NaverUrl", naverUrl);
		urlMap.put("KakaoUrl", kakaoUrl);
		
		model.addAllAttributes(urlMap);
		return "/login/login";
	}
	
	@PostMapping("/login")
	public void postLogin(LoginDto logindto, Model model){
		Member member = null;
		try {
			member = loginService.loginCheck(logindto);
			model.addAttribute("member", member);
		} catch (LoginException e) {
			model.addAttribute("LoginFailMsg", e.getMessage());
		}
	}
	
	@GetMapping("/logout")
	public void logout(HttpSession session, HttpServletResponse response) throws Exception{
		if (session.getAttribute("member") == null) {
			response.sendError(403, "로그인 상태가 아닙니다.");
		} else {
			session.removeAttribute("member");
			session.invalidate();
			response.sendRedirect("/login");
		}
	}
	
	@GetMapping("login/oauth2/code/{platform}")
	public String snsLoginCallback(@PathVariable String platform,
			Model model, @RequestParam String code, HttpSession session) throws Exception {
		String nextURL = "/home";
		
		System.out.println(platform);
		System.out.println(code);
		
		// access_token을 이용해서 사용자 profile 정보 가져오기
		Member member = oauth2LoginService.getUserProfile(code, platform);
		
		// DB 해당 유저가 존재하는 체크
		if (!loginService.idCheck(member.getMem_id())) {
			// 미존재시 가입페이지로!!
			model.addAttribute("member",member);
			nextURL = "/join/join";
		} else {
			// 존재시 가입된 아이디 불러오기!!
			Member resultMember = loginService.loginCheck(member.getMem_id());
			session.setAttribute("member", resultMember);
		}
		
		return nextURL;
	}
	
	@GetMapping("/login/find")
	public String Getfind() {
		return "/login/find";
	}
	
	@PostMapping("/login/find/{findValue}")
	@ResponseBody
	public Map<String,Object> Postfind(@PathVariable String findValue, @RequestBody FindDto dto, Model model) {
		log.info(dto);
		
		Map<String,Object> map = null;
		
		switch (findValue) {
		case "id":
			map = loginService.findId(dto);
			break;
		case "password":
			break;
		default:
			break;
		}
	
		return map;
	}
}



package com.finalpj.nbw.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalpj.nbw.login.service.LoginService;
import com.finalpj.nbw.login.service.Oauth2LoginService;
import com.finalpj.nbw.member.domain.Member;

@Controller
public class LoginController {
	
	private Oauth2LoginService oauth2LoginService;
	
	public LoginController() {}
	
	//@Autowired
	public LoginController(Oauth2LoginService oauth2LoginService) {
		this.oauth2LoginService = oauth2LoginService;
	}
	
	@GetMapping("/login")
	public String getLogin(Model model) {
//		String url = oauth2LoginService.getAuthorizationUrl();
//		model.addAttribute("url", url);
		return "/login";
	}
	
	@PostMapping("/login")
	public String postLogin(@RequestParam String userId, @RequestParam String userPassword) {
		System.out.println("Controller -> userId: "+userId);
		System.out.println("Controller -> userPassword: "+userPassword);
		return "/login";
	}
	
	@RequestMapping("login/oauth2/code/{snsService}")
	@ResponseBody
	public String snsLoginCallback(@PathVariable String snsService,
			Model model, @RequestParam String code, HttpSession session) throws Exception {
		
		System.out.printf("snsLoginCallback: service={%s} \n",snsService);
		System.out.println("code: "+code);
		
		Member member = oauth2LoginService.getUserProfile(code);

		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기

		// 3. DB 해당 유저가 존재하는 체크 (googleid, naverid 컬럼 추가)

			//미존재시 가입페이지로!!

			// 4. 존재시 강제로그인
			
		return "loginResult";
	}
}

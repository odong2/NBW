package com.finalpj.nbw.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalpj.nbw.login.service.Oauth2LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private Oauth2LoginService oauth2LoginService;
	
	@RequestMapping("/login")
	public String Login(Model model) {
		String url = oauth2LoginService.getAuthorizationUrl();
		
		System.out.println(url);
		
		model.addAttribute("url", url);
		return "/login";
	}
	
	@RequestMapping("login/oauth2/code/{snsService}")
	@ResponseBody
	public String snsLoginCallback(@PathVariable String snsService,
			Model model, @RequestParam String code) throws Exception {
		
		System.out.printf("snsLoginCallback: service={%s} \n",snsService);
		System.out.println("code: "+code);
		
		oauth2LoginService.getUserProfile(code);
		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기

		// 3. DB 해당 유저가 존재하는 체크 (googleid, naverid 컬럼 추가)

			//미존재시 가입페이지로!!

			// 4. 존재시 강제로그인

		return "loginResult";
	}
}

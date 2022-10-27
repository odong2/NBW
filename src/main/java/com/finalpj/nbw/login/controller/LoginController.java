package com.finalpj.nbw.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String Login() {
		return "/login";
	}


	/* 채은 추가 부분 =============== 로그아웃 =====================> */

//	@GetMapping("/logout")
//	public String logout(HttpServletRequest request){
//		/* false ==> 기존에 가지고 있는 세션을 쓰도록 하겠다. */
//		HttpSession session = request.getSession(false);
//		/* 세션을 버리는 메소드로 세션을 날리도록 하겠다. ==> 로그아웃 */
//		session.invalidate();
//		return "redirect:/home";
//	}
	/* <========================== 로그아웃 ========== 채은 추가 부분 끝 */

}



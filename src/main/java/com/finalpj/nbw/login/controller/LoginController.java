package com.finalpj.nbw.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalpj.nbw.login.domain.Find;
import com.finalpj.nbw.login.domain.Login;
import com.finalpj.nbw.login.exception.LoginException;
import com.finalpj.nbw.login.service.LoginService;
import com.finalpj.nbw.login.service.Oauth2LoginService;
import com.finalpj.nbw.mail.service.MailService;
import com.finalpj.nbw.member.domain.Member;

import lombok.extern.log4j.Log4j;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

@Log4j
@Controller
public class LoginController {

	private Oauth2LoginService oauth2LoginService;
	private LoginService loginService;
	private MailService mailService;

	public LoginController() {
	}

	@Autowired
	public LoginController(Oauth2LoginService oauth2LoginService, LoginService loginService, MailService mailService) {
		this.oauth2LoginService = oauth2LoginService;
		this.loginService = loginService;
		this.mailService = mailService;
	}

	@GetMapping("/login")
	public String getLogin(Model model) {
		String naverUrl = oauth2LoginService.getAuthorizationUrl("naver");
		String kakaoUrl = oauth2LoginService.getAuthorizationUrl("kakao");

		HashMap<String, String> urlMap = new HashMap<>();
		urlMap.put("NaverUrl", naverUrl);
		urlMap.put("KakaoUrl", kakaoUrl);

		model.addAllAttributes(urlMap);
		return "/login/loginpage";
	}

	@PostMapping("/login")
	public String postLogin(Login logindto, Model model, HttpServletResponse response, HttpSession session,
			@CookieValue(value = "remember_id", required = false) Cookie remembercoockie,
			RedirectAttributes rattr) throws IOException {

		try {
			Member member = loginService.loginCheck(logindto);
			session.setAttribute("member", member);

			if (logindto.getRememberme() != null) {
				Cookie cookie = new Cookie("remember_id", logindto.getUserId());
				response.addCookie(cookie);
			} else {
				if (remembercoockie != null) {
					remembercoockie.setValue("");
					remembercoockie.setMaxAge(0);
					response.addCookie(remembercoockie);
				}
			}

		} catch (LoginException e) {
			//rattr.addFlashAttribute("LoginFailMsg", e.getMessage());
			model.addAttribute("LoginFailMsg", e.getMessage());
		}
		
		return "/login/loginpage";
	}

	@GetMapping("/logout")
	public void logout(HttpSession session, HttpServletResponse response,
			@RequestParam(required = false) String url) throws Exception {
		if (session.getAttribute("member") == null) {
			response.sendError(403, "로그인 상태가 아닙니다.");
		} else {
			session.removeAttribute("member");
			session.invalidate();
		}
		
		System.out.println(url);
		
		if(url != null) {
			if(url.contains("payment")) {
				url = "/home";
			}else {
				url = URLDecoder.decode(url, "UTF-8");
			}
			response.sendRedirect(url);
		}else {
			response.sendRedirect("/login");
		}
	}

	@GetMapping("login/oauth2/code/{platform}")
	public String snsLoginCallback(@PathVariable String platform, Model model, @RequestParam String code,
			HttpSession session) throws Exception {
		String nextURL = "/home";

		System.out.println(platform);
		System.out.println(code);

		// access_token을 이용해서 사용자 profile 정보 가져오기
		Member member = oauth2LoginService.getUserProfile(code, platform);

		// DB 해당 유저가 존재하는 체크
		if (!loginService.idCheck(member.getMem_id())) {
			// 미존재시 가입페이지로!!
			model.addAttribute("member", member);
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
	public Map<String, Object> Postfind(@PathVariable String findValue, @RequestBody Find dto, Model model) {
		Map<String, Object> map = null;

		switch (findValue) {
		case "id":
			map = loginService.findId(dto);
			break;
		case "emailcheck":
			map = new HashMap<String, Object>();
			if (loginService.emailCheck(dto)) {
				map.put("code", mailService.sendMail(dto));
				map.put("success", true);
			} else {
				map.put("msg", "존재하지 않는 회원입니다.");
				map.put("success", false);
			}
			break;
		case "pw":
			map = loginService.changePw(dto);
			break;
		default:
			break;
		}

		return map;
	}

	@GetMapping("/login/change")
	public String change(Model model, Find dto) {
		model.addAttribute("dto", dto);
		return "/login/change";
	}

	@PostMapping("/login/exist")
	@ResponseBody
	public Map<String, Object> isLogin(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (session.getAttribute("member") == null) {
			map.put("isLogin", false);
		} else {
			map.put("isLogin", true);
		}
		return map;
	}
}

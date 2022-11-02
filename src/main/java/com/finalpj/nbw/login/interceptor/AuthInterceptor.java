package com.finalpj.nbw.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.log4j.Log4j;

@Log4j
public class AuthInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("member") == null) {
			saveUri(request, session);
			//request.setAttribute("LoginFailMsg", "로그인이 필요한 페이지입니다.");
			response.sendRedirect("/login");
			return false;
		}
		return true;
	}

	private void saveUri(HttpServletRequest request, HttpSession session) {
		String uri = request.getRequestURI(); //board/register
		String query = request.getQueryString(); //dfd=121
		
		if (!StringUtils.isEmpty(query))
			uri += "?" + query;
		
		session.setAttribute("saveUri", uri);
	}

}

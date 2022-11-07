package com.finalpj.common.exception.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.finalpj.nbw.member.domain.Member;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String pno = request.getParameter("pno");
		
		// 1. 로그인 상태인지검사
		// 1-1. 로그인 상태에서 요청시 에러 페이지로 이동
		if (request.getSession().getAttribute("member") != null) {
			response.sendError(403, "이미 로그인한 사용자 입니다. ");
			return false;
		}
		if (pno != null)
			UriUtils.saveUri("/product/"+pno, request.getSession());
		
		// 1-2. 로그인 상태가 아닐시 계속 진행
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		String uri = (String) session.getAttribute("saveUri");
		Member member = (Member) session.getAttribute("member");
		
		
		if(member != null) {
			if (!StringUtils.isEmpty(uri)) {
				session.removeAttribute(uri);
				response.sendRedirect(uri);
			}else {
				response.sendRedirect("/home");
			}
		}
	}

}

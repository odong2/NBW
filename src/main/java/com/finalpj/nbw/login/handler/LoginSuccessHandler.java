package com.finalpj.nbw.login.handler;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	private final String Default_URL = "/home";


	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		/* 현재 세션의 사용자 객체를 가져온다. */
		Member member = (Member) authentication.getPrincipal();

		// IP, 세션 ID
		WebAuthenticationDetails web = (WebAuthenticationDetails) authentication.getDetails();
		System.out.println("Session ID : " + web.getSessionId());
		
		// 인증 ID
		System.out.println("ID : " + authentication.getName());


		/* 채은 추가 부분 ====================================> */
//				HttpSession session = request.getSession();
//				System.out.println("Session : "+ session.getId());
//
//				// 로그인된 사용자 객체를 통채로 넘긴다.
//				session.setAttribute("loginMember", member);
		/* <==================================== 채은 추가 부분 끝 */


		// 권한 리스트
		List<GrantedAuthority> authList = (List<GrantedAuthority>) authentication.getAuthorities();
		System.out.print("권한 : ");
		for(int i = 0; i< authList.size(); i++) {
			System.out.print(authList.get(i).getAuthority() + " ");
		}
		
		System.out.println("");
		
		// Security가 요청을 가로챈 경우 사용자가 원래 요청했던 URI 정보를 저장한 객체
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);

		// 있을 경우 URI 등 정보를 가져와서 사용
		if (savedRequest != null) {
			String uri = savedRequest.getRedirectUrl();
						
			System.out.println("URI: "+uri);
			
			// 세션 Attribute 확인
			Enumeration<String> list = request.getSession().getAttributeNames();
			while (list.hasMoreElements()) {
				System.out.println(list.nextElement());
			}
			
			// 세션에 저장된 객체를 다 사용한 뒤에는 지워줘서 메모리 누수 방지
			requestCache.removeRequest(request, response);
			
			response.sendRedirect(uri);
			
		}else {
			response.sendRedirect(Default_URL);
		}
		
	}

}

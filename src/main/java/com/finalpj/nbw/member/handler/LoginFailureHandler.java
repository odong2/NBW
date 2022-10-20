package com.finalpj.nbw.member.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler{
	
	public LoginFailureHandler() {
	}
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String errorMsg = null;
		
			// DB에서 null 값을 리턴 -> 존재하지 않는 사용자인 경우 발생하는 Exception 
		if (exception instanceof AuthenticationServiceException) {
			errorMsg = "관리자에게 문의해주세요.";
	
			// DB에서 비교한 아이가 틀릴경우 발생하는 Exception
		}else if(exception instanceof BadCredentialsException) {
			errorMsg = "아이디, 비밀번호를 확인해주세요.";
		
			// UserDetails 객체의 isAccountNonLocked() 메소드의 리턴값이 false 일 경우
		} else if(exception instanceof LockedException) {
			errorMsg = "잠긴 계정입니다..";
		
			// UserDetails 객체의 isEnabled() 메소드의 리턴값이 false 일 경우
		} else if(exception instanceof DisabledException) {
			errorMsg = "비활성화된 계정입니다..";
			
			// UserDetails 객체의 isAccountNonExpired() 메소드의 리턴값이 false 일 경우 
		} else if(exception instanceof AccountExpiredException) {
			errorMsg = "만료된 계정입니다..";
			
			// UserDetails 객체의 isCredentialsNonExpired() 메소드의 리턴값이 false 일 경우
		} else if(exception instanceof CredentialsExpiredException) {
			errorMsg = "비밀번호가 만료되었습니다.";
		}
        
        System.out.println(errorMsg+", "+exception);
        
        request.setAttribute("LoginFailMsg", errorMsg);
		request.getRequestDispatcher("/login").forward(request, response);
		
	}
}

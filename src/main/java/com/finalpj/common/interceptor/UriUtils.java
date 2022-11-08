package com.finalpj.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

public class UriUtils {

	private String uri;
	private String querystring;
	
	public static void saveUri(HttpServletRequest request,HttpSession session) {
		String uri = request.getRequestURI(); //board/register
		String query = request.getQueryString(); //dfd=121
		
		if (!StringUtils.isEmpty(query))
			uri += "?" + query;
		
		session.setAttribute("saveUri", uri);
	}
	
	public static void saveUri(String uri,HttpSession session) {
		session.setAttribute("saveUri", uri);
	}
	
//	public static void removeUri(HttpSession session) {
//		String uri = (String) session.getAttribute("saveUri");
//		
//		if (uri != null)
//			session.removeAttribute(uri);
//	}
}

package com.finalpj.nbw.login.oauth2.module;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverOAuth2 extends DefaultApi20{

	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}

	
	public String getUserInfoEndPoint() {
	    return "https://openapi.naver.com/v1/nid/me";
	}
}

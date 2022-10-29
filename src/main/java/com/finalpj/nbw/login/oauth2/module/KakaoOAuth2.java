package com.finalpj.nbw.login.oauth2.module;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.concurrent.ExecutionException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalpj.nbw.member.domain.Member;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.builder.api.DefaultApi20;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.AccessTokenRequestParams;
import com.github.scribejava.core.oauth.OAuth20Service;

import lombok.extern.log4j.Log4j;

@Log4j
public class KakaoOAuth2 extends DefaultApi20{
	
	OAuth20Service service;
	ApiKeyBean kakaoApiKeyBean;
	
	public KakaoOAuth2() {}
	
	public KakaoOAuth2(ApiKeyBean kakaoApiKeyBean) {
		this.service = new ServiceBuilder(kakaoApiKeyBean.getApi())
				.apiSecret(kakaoApiKeyBean.getSecret())
				.callback(kakaoApiKeyBean.getCallback())
				.build(this);
		
		this.kakaoApiKeyBean = kakaoApiKeyBean;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://kauth.kakao.com/oauth/token";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://kauth.kakao.com/oauth/authorize";
	}
	
	public String getAuthorizationUrl() {
		return service.getAuthorizationUrl();
	}
	
	public String getUserInfoEndPoint() {
	    return "https://kapi.kakao.com/v2/user/me";
	}
	
	public Member getUserInfo(String code) throws IOException, InterruptedException, ExecutionException {
		// AccessToken 생성
		AccessTokenRequestParams params = new AccessTokenRequestParams(code);
		params.addExtraParameter("client_id", kakaoApiKeyBean.getApi());
		params.addExtraParameter("client_secret", kakaoApiKeyBean.getSecret());
		OAuth2AccessToken accessToken = service.getAccessToken(params);
		
		// 생성한 AccessToken으로 유저 정보 요청함
		OAuthRequest request = new OAuthRequest(Verb.GET, getUserInfoEndPoint());
		service.signRequest(accessToken, request);
		
		// 응답받은 유저정보
		Response response = service.execute(request);
		
		// JSON 형태로 전달받기 때문에 jackson 라이브러리로 포멧팅처리
	    ObjectMapper mapper = new ObjectMapper();
	    JsonNode node = mapper.readTree(response.getBody());
	    
	    // 필요한 유저정보 변수로 선언
	    String id = "KAKAO_"+node.get("id").textValue();
	    
	    String name = node.get("kakao_account").get("profile").get("nickname").textValue();
	    String email = node.get("kakao_account").get("email").textValue();

	    
	    // 저장한 자료구조를 이용해서 전달할 member 객체 생성
		Member member = Member
				.builder()
				.mem_id("KAKAO_"+id)
				.mem_name(name)
				.mem_email(email)
				.build();
		
	    return member;
	}
}

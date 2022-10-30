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
public class NaverOAuth2 extends DefaultApi20{
	
	private OAuth20Service service;
	private ApiKeyBean naverApiKeyBean;
	
	public NaverOAuth2() {}
	
	public NaverOAuth2(ApiKeyBean naverApiKeyBean) {
		this.service = new ServiceBuilder(naverApiKeyBean.getApi())
				.apiSecret(naverApiKeyBean.getSecret())
				.callback(naverApiKeyBean.getCallback())
				.build(this);
		this.naverApiKeyBean = naverApiKeyBean;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}
	
	public String getAuthorizationUrl() {
		return service.getAuthorizationUrl();
	}
	
	public String getUserInfoEndPoint() {
	    return "https://openapi.naver.com/v1/nid/me";
	}
	
	public Member getUserInfo(String code) throws IOException, InterruptedException, ExecutionException {
		// AccessToken 생성
		OAuth2AccessToken accessToken = service.getAccessToken(code);
		
		// 생성한 AccessToken으로 유저 정보 요청함
		OAuthRequest request = new OAuthRequest(Verb.GET, getUserInfoEndPoint());
		service.signRequest(accessToken, request);
		
		// 응답받은 유저정보
		Response response = service.execute(request);
		
		// JSON 형태로 전달받기 때문에 jackson 라이브러리로 포멧팅처리
	    ObjectMapper mapper = new ObjectMapper();
	    JsonNode node = mapper.readTree(response.getBody());
	    
	    // JSON 문자열 데이터에서 유저정보만 담을 자료구조 선언
	    HashMap<String,String> map = new HashMap<>();
	    
	    // 유저정보만 담은 JsonNode를 Iterator로 받아서 값이 없을때까지 저장
	    Iterator<Entry<String, JsonNode>> elements = node.get("response").fields();
	    while(elements.hasNext()) {
	    	String key = elements.next().getKey();
	    	String value = node.get("response").get(key).textValue();
	    	map.put(key, value);
	    }
	    
	    // 저장한 자료구조를 이용해서 전달할 member 객체 생성
		Member member = Member
	    		.builder()
	    		.mem_id("NAVER_"+map.get("id"))
	    		.mem_gender(map.get("gender"))
	    		.mem_email(map.get("email"))
	    		.mem_phone(map.get("mobile"))
	    		.mem_name(map.get("name"))
	    		.mem_birthday(map.get("birthyear")+"-"+map.get("birthday"))
	    		.build();
		
	    return member;
	}
}

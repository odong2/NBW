package com.finalpj.nbw.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalpj.nbw.login.oauth2.module.ApiKeyBean;
import com.finalpj.nbw.login.oauth2.module.NaverOAuth2;
import com.finalpj.nbw.member.domain.Member;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

@Service
public class Oauth2LoginService {
	OAuth20Service service;
	NaverOAuth2 naverOAuth2 = new NaverOAuth2();
	ApiKeyBean naverApiKeyBean;
	
	@Autowired
	public Oauth2LoginService(ApiKeyBean naverApiKeyBean) {
		this.naverApiKeyBean = naverApiKeyBean;
	}
	
	public String getAuthorizationUrl() {
		service = new ServiceBuilder(naverApiKeyBean.getApi())
				.apiSecret(naverApiKeyBean.getSecret())
				.callback(naverApiKeyBean.getCallback())
				.build(naverOAuth2);
		
		return service.getAuthorizationUrl();
	}
	
	public Member getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = service.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, naverOAuth2.getUserInfoEndPoint());
		service.signRequest(accessToken, request);
		
		Response response = service.execute(request);
		
	    ObjectMapper mapper = new ObjectMapper();
	    
	    JsonNode node = mapper.readTree(response.getBody());
	    
	    System.out.println(response.getBody());
	    
	    String email = node.get("response").get("email") == null ? "미동의" : node.get("response").get("email").textValue();
	    String name = node.get("response").get("name") == null ? "미동의" : node.get("response").get("name").textValue();
	    
	    System.out.println("email: "+email);
	    System.out.println("name: "+name);
		
	    Member member = new Member().builder().mem_id(email).build();
	    
	    return member;
	}
	
}

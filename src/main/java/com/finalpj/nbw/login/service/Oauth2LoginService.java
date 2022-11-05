package com.finalpj.nbw.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalpj.nbw.login.oauth2.module.KakaoOAuth2;
import com.finalpj.nbw.login.oauth2.module.NaverOAuth2;
import com.finalpj.nbw.member.domain.Member;

@Service
public class Oauth2LoginService {

	NaverOAuth2 naverOAuth2;
	KakaoOAuth2 kakaoOAuth2;

	@Autowired
	public Oauth2LoginService(NaverOAuth2 naverOAuth2,KakaoOAuth2 kakaoOAuth2) {
		this.naverOAuth2 = naverOAuth2;
		this.kakaoOAuth2 = kakaoOAuth2;
	}
	
	public String getAuthorizationUrl(String platform) {
		String platform_url = null;
		
		switch (platform) {
			case "naver": 
				platform_url = naverOAuth2.getAuthorizationUrl();
				break;
			case "kakao":
				platform_url = kakaoOAuth2.getAuthorizationUrl();
				break;
			default: 
				platform_url = "javascript:alert('잠시 점검중입니다.');";
				break;
			}
		
		return platform_url;
	}
	
	public Member getUserProfile(String code, String platform) throws Exception {
		Member member = null;
		
		switch (platform) {
			case "naver": 
				member = naverOAuth2.getUserInfo(code);
				break;
			case "kakao":
				member = kakaoOAuth2.getUserInfo(code);
			default:
				break;
			}
		return member;
	}
}

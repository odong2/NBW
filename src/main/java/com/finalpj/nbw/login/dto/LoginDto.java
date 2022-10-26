package com.finalpj.nbw.login.dto;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.Getter;

@Getter
public class LoginDto {
	
	BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
	
	private String userId;
	private String userPassword;
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public void setUserPasswordEncoder(String userPassword) {
		this.userPassword = bCryptPasswordEncoder.encode(userPassword);
	}
}

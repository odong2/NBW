package com.finalpj.nbw.login.oauth2.module;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ApiKeyBean {
	private String api;
	private String secret;
	private String callback;
}

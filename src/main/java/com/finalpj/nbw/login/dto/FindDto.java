package com.finalpj.nbw.login.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FindDto {
	
	private String mem_id;
	private String mem_pw;
	private Timestamp mem_cdate;
	private String mem_email;
	private String mem_name;

}
package com.finalpj.nbw.qna.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Answer {
	
	private Integer qn_no;
	private Date an_cdate;
	private String an_content;
	private String read_yn;
}

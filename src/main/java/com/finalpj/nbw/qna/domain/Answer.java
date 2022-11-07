package com.finalpj.nbw.qna.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Answer {
	
	private Integer qn_no; // 문의번호
	private Date an_cdate; // 문의 답변 날짜
	private String an_content; // 문의 답변 내용
}

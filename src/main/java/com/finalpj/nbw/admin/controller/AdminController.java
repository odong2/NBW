package com.finalpj.nbw.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	
	@GetMapping("test")
	public String main() {
		return "admin/test";
	}
	
	/***************** [[ 관리자 문의사항 조회페이지 ]] *****************/
	@GetMapping("qna")
	public String adminQna() {
		return "admin/qna";
	}
	/***************** [[ 관리자 문의사항 답변페이지 ]] *****************/
	@GetMapping("answer")
	public String adminAnswer() {
		return "admin/answer";
	}
	/***************** [[관리자 이벤트 조회페이지]] *********************/
	@GetMapping("event")
	public String adminEvent() {
		return "admin/event";
	}
	/***************** [[관리자 이벤트 신청자 조회페이지]] ***************/
	@GetMapping("applicant")
	public String adminEventApplicant() {
		return "admin/eventApplicant";
	}
	/***************** [[관리자 이벤트 등록페이지]] ***************/
	@GetMapping("register")
	public String adminEventregister() {
		return "admin/eventRegister";
	}
}

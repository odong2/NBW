package com.finalpj.nbw.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalpj.nbw.qna.service.QnaService;

@Controller
@RequestMapping("/admin/qna")
public class AdminQnaController {
	
	private QnaService qnaService;
	
	public AdminQnaController(QnaService qnaService) {
		this.qnaService = qnaService;
	}
	
	@GetMapping("list")
	public String qnaList() {
		return "admin/qna";
	}
}

package com.finalpj.nbw.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalpj.nbw.qna.domain.Qna;
import com.finalpj.nbw.qna.service.QnaService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/qna")
public class AdminQnaController {

	private QnaService qnaService;

	public AdminQnaController(QnaService qnaService) {
		this.qnaService = qnaService;
	}

	/***** [[ 답변하지 않은 질문만 조회하는 페이지 ]] *****/
	@GetMapping("list")
	public String qnaList(Model model) {
		log.info("답변하지 않은 질문 조회페이지 호출");
		List<Qna> questionList = null; // 전체 문의사항 조회
		List<Qna> questionIngList = null; // 처리해야할 문의사항 조회
		List<Qna> questionFinishList = null; // 처리한 문의사항 조회
		
		try {
			questionList = qnaService.qnaList();
			questionIngList = qnaService.qnaIngList();
			questionFinishList = qnaService.qnaFinishList();
			model.addAttribute("questionList", questionList);
			model.addAttribute("questionIngList", questionIngList);
			model.addAttribute("questionFinishList", questionFinishList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/qna/qna";
	}

}

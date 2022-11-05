package com.finalpj.nbw.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalpj.nbw.qna.domain.Answer;
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

	/***** [[ 관리자 문의사항 조회하는 페이지 ]] *****/
	@GetMapping("list")
	public String qnaList(Model model) {
		log.info("관리자 문의사항 조회페이지 호출");
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
		return "/admin/qna/qna";
	}
	
	/***** [[ 관리자 문의사항 디테일 조회하는 페이지 ]] *****/
	@GetMapping("answer")
	public String qnaDetailList(Model model, Integer qn_no) {
		log.info("문의사항 답변 페이지 호출");
		Qna qt  = null;
		Answer an = null;
		try {
			qt = qnaService.qnaRead(qn_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		an = qnaService.answerRead(qn_no);
		log.info(an);
		model.addAttribute("qt",qt);
		model.addAttribute("an",an);
		return "/admin/qna/answer";
	}
	
	/***** [[ 관리자 문의사항 답변 등록 ]] *****/
	@PostMapping("answer")
	public String writeAnswer(Integer qn_no, Answer answer) {
		log.info("컨트롤러에서 관리자 문의사항 답변 등록 호출");
		try {
			qnaService.writeAnswer(answer, qn_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/qna/list";
	}
	/***** [[ 관리자 문의사항 답변 수정 ]] *****/
	@PostMapping("modify")
	public String modifyAnswer(Answer answer) {
		log.info("컨트롤러에서 관리자 문의사항 답변 수정 호출");
		try {
			qnaService.modifyAnswer(answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/qna/answer?qn_no="+answer.getQn_no();
	}
	/***** [[ 관리자 문의사항 답변 삭제 ]] *****/
	@PostMapping("remove")
	public String removeAnswer(Integer qn_no) {
		log.info("컨트롤러에서 관리자 문의사항 답변 삭제 호출");
		try {
			qnaService.deleteAnswer(qn_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/qna/list";
	}
}

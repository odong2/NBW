package com.finalpj.nbw.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalpj.nbw.notice.domain.PageHandler;
import com.finalpj.nbw.notice.domain.SearchCondition;
import com.finalpj.nbw.qna.domain.Answer;
import com.finalpj.nbw.qna.domain.Qna;
import com.finalpj.nbw.qna.service.QnaService;

import lombok.extern.log4j.Log4j;

import javax.servlet.http.HttpSession;

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
	public String qnaList(SearchCondition sc, HttpSession session, Model model) {
		log.info("관리자 문의사항 조회페이지 호출");
		List<Qna> questionList = null; // 문의사항 조회
		List<Qna> questionIngList = null; // 답변하지 않은 문의사항
		int ingCnt = 0; // 답변하지 않은 문의글 갯수
		
		try {
			// 문의하지 않은 개수 가져오기
			ingCnt = qnaService.getQuestionIngCnt();
			log.info("ingCnt: "+ingCnt);
			model.addAttribute("ingCnt", ingCnt);
			// 답변하지 않은 문의 가져오기
			questionIngList = qnaService.qnaIngList(session);
			log.info("questionIngList: "+questionIngList);
			model.addAttribute("questionIngList", questionIngList);
			
			log.info("키워드 가져와보기"+sc.getKeyword());
			// 전체 페이지 게시물 조회
			int totalCnt = qnaService.getSearchCnt(sc);
			// pageHandler에 페이징에 필요한 값들 넘기기
			PageHandler pageHandler = new PageHandler(totalCnt, sc);
			log.info("총 게시물 개수는 " + totalCnt + "개");
			log.info("pageHandler는 " + pageHandler);
			
			model.addAttribute("ph", pageHandler);
			questionList = qnaService.getSearchPage(sc);
			model.addAttribute("questionList", questionList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/qna/qna";
	}
	
	/***** [[ 관리자 문의사항 디테일 조회하는 페이지 ]] *****/
	@GetMapping("answer")
	public String qnaDetailList(Model model, HttpSession session, Integer qn_no) {
		log.info("문의사항 답변 페이지 호출");
		List<Qna> questionIngList = null; // 답변하지 않은 문의사항
		int ingCnt = 0; // 답변하지 않은 문의글 갯수
		Qna qt  = null;
		Answer an = null;
		try {
			ingCnt = qnaService.getQuestionIngCnt();
			model.addAttribute("ingCnt", ingCnt);
			questionIngList = qnaService.qnaIngList(session);
			model.addAttribute("questionIngList", questionIngList);
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

package com.finalpj.nbw.mypage.controller;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.qna.domain.Answer;
import com.finalpj.nbw.qna.domain.Qna;
import com.finalpj.nbw.qna.service.QnaService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j
@RequestMapping("/mypage/qna/")
@Controller
public class MypageQnaController {
    QnaService qnaService;

    public MypageQnaController(QnaService qnaService){
        this.qnaService = qnaService;
    }

    /********************************* [[QNA 전체 조회]] **************************************/
    @GetMapping("list")
    public String qnaList(Model model, HttpSession session) throws Exception {
        Member member = (Member) session.getAttribute("member");
        List<Qna> qnaSelectAll = null;
        List<Qna> qnaSelectIngAll = null;
        List<Qna> qnaSelectFinishAll = null;
        if(member != null) { // 회원일 경우
            String id = member.getMem_id();
            qnaSelectAll = qnaService.qnaList(id);
            qnaSelectIngAll = qnaService.qnaIngList(session);
            qnaSelectFinishAll = qnaService.qnaFinishList(id);
        }
        log.info("컨트롤러 타고 있습니다... qnaSelectAll"+ qnaSelectAll);
        log.info("컨트롤러 타고 있습니다... qnaSelectIngAll" + qnaSelectIngAll);
        log.info("컨트롤러 타고 있습니다... qnaSelectFinishAll" + qnaSelectFinishAll);
        model.addAttribute("qnaSelectAll",qnaSelectAll);
        model.addAttribute("qnaSelectIngAll", qnaSelectIngAll);
        model.addAttribute("qnaSelectFinishAll", qnaSelectFinishAll);
        log.info("컨트롤러 타고 있습니다... 제발22222");
        return "mypage/Qna/qnaList";
    }
    /***************************** [[QNA 디테일 페이지]] *******************************/
    @GetMapping("detail")
    public String qnaRead(Integer qn_no, Model m, HttpSession session){
        log.info(qn_no);
        try {
            Qna qna = qnaService.qnaRead(qn_no); // 회원 문의
            Answer an = qnaService.answerRead(qn_no); //운영자 답변
            m.addAttribute("qna",qna);
            m.addAttribute("an",an);
            log.info(qna);
        } catch (Exception e) {
        }
        return "mypage/Qna/qnaDetail";
    }

    /************************************ [[QNA 삭제 페이지]] *********************************/
    @GetMapping("/delete/{qn_no}")
    public String qnaDelete (@PathVariable Integer qn_no, RedirectAttributes rattr, HttpSession session) {
        log.info("qnaRemove 컨트롤러 호출");
        try {
        log.info("qnaRemove 컨트롤러 호출");
            int result = qnaService.qnaDelete(qn_no);
            log.info(result);
            rattr.addFlashAttribute("msg", "DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DEL_ERR");
        }
        return "redirect:/mypage/qna/list";
    }

    /*********************************** [[Qna 작성]] ***************************************/
    @GetMapping("write")
    public String qnaWrite(Model m) {
    return "mypage/Qna/qna";
    }
    /*********************************** [[Qna 작성]] ***************************************/
    @PostMapping("/write")
    public String qnaWrite(Qna qna, RedirectAttributes rattr, Model m, HttpSession session) {
        Member member = (Member)session.getAttribute("member");
        String mem_id = member.getMem_id();
//        session.setAttribute("qn_from", "동현");
//        String qn_from = (String) session.getAttribute("qn_from");
        qna.setQn_from(mem_id);
        log.info("qna 컨트롤러 호출 성공");

        try {
            if (qnaService.qnaWrite(qna) != 1)
                throw new Exception("Write failed.");

            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/mypage/qna/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(qna);
            m.addAttribute("mode", "new");
            m.addAttribute("msg", "WRT_ERR");
            return "/mypage/qna/write";
        }
    }
}

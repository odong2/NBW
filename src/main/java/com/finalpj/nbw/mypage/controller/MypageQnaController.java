package com.finalpj.nbw.mypage.controller;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.qna.domain.Qna;
import com.finalpj.nbw.qna.service.QnaService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Log4j
@RequestMapping("/mypage/*")
@Controller
public class MypageQnaController {
    QnaService qnaService;

    public MypageQnaController(QnaService qnaService){
        this.qnaService = qnaService;
    }

    /********************************* [[QNA 전체 조회]] **************************************/
    @GetMapping("qnalist")
    public String qnaList(Model model) throws Exception {
        log.info("컨트롤러 타고 있습니다... 제발11111");
        model.addAttribute("qnaSelectAll", qnaService.qnaList());
        model.addAttribute("qnaSelectIngAll", qnaService.qnaIngList());
        model.addAttribute("qnaSelectFinishAll", qnaService.qnaFinishList());
        log.info("컨트롤러 타고 있습니다... 제발22222");
        return "mypage/Qna/qnaList";
    }
    /***************************** [[QNA 디테일 페이지]] *******************************/
    @GetMapping("qnadetail")
    public String qnaRead(Integer qn_no, Model m){
        log.info(qn_no);
        try {
            Qna qna = qnaService.qnaRead(qn_no);
            m.addAttribute("qna",qna);
            log.info(qna);
        } catch (Exception e) {
        }
        return "mypage/Qna/qnaDetail";
    }

    /************************************ [[QNA 삭제 페이지]] *********************************/
    @GetMapping("/qnadelete/{qn_no}")
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
        return "redirect:/mypage/qnalist";
    }

    /*********************************** [[Qna 작성]] ***************************************/
    @GetMapping("qnawrite")
    public String qnaWrite(Model m) {
    return "mypage/Qna/qna";
    }
    /*********************************** [[Qna 작성]] ***************************************/
    @PostMapping("/qnawrite")
    public String qnaWrite(Qna qna, RedirectAttributes rattr, Model m, HttpSession session) {
//        String qn_writer = (String)session.getAttribute("id");
//        Event.setWriter(qn_writer);
        log.info("qna 컨트롤러 호출 성공");

        try {
            if (qnaService.qnaWrite(qna) != 1)
                throw new Exception("Write failed.");

            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/mypage/qnalist";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(qna);
            m.addAttribute("mode", "new");
            m.addAttribute("msg", "WRT_ERR");
            return "/mypage/qnawrite";
        }
    }
}

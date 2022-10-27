package com.finalpj.nbw.admin.controller;

import com.finalpj.nbw.notice.domain.Notice;
import com.finalpj.nbw.notice.domain.PageHandler;
import com.finalpj.nbw.notice.domain.SearchCondition;
import com.finalpj.nbw.notice.service.NoticeService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Log4j
@Controller
@RequestMapping("admin/notice")
public class AdminNoticeController {

    NoticeService noticeService;

    public AdminNoticeController(NoticeService noticeService){
        this.noticeService = noticeService;
    }

    @GetMapping("/list")
    public String getNoticeList(SearchCondition sc,  Model m){
        try {
            // 전체 게시물 개수 조회
            int totalCnt = noticeService.getSearchResultCnt(sc);
            PageHandler pageHandler = new PageHandler(totalCnt, sc);
//         PageHandler pageHandler = new PageHandler(totalCnt, page);
            log.info("총 게시물 개수는 " + totalCnt + "개");
            log.info("pageHandler는 " + pageHandler);

            m.addAttribute("ph", pageHandler);

            List<Notice> noticeList= noticeService.getSearchResultPage(sc);
            m.addAttribute("noticeList", noticeList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/admin/notice/notice";
    }
    @GetMapping("/read")
    public String getNoticeRead(Integer nt_no,SearchCondition sc, Model m){
        try {
            Notice noticeDto = noticeService.getNotice(nt_no);
            m.addAttribute("noticeDto", noticeDto);
            m.addAttribute("SearchCondition", sc);
            log.info("noticeDto = " + noticeDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/admin/notice/noticeRead";
    }

    @GetMapping("/write")
    public String getWritePage(){

        return "/admin/notice/noticeWrite";
    }
    @PostMapping("/write")
    public String writeNotice(Notice notice, RedirectAttributes rattr){
        try{
            noticeService.writeNotice(notice);
            rattr.addFlashAttribute("msg","WRT_OK");
        }catch (Exception e){
            e.printStackTrace();
            rattr.addFlashAttribute("msg","WRT_ERR");
        }

        return "redirect:/admin/notice/list";
    }

}

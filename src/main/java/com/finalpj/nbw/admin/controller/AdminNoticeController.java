package com.finalpj.nbw.admin.controller;

import com.finalpj.nbw.notice.domain.Notice;
import com.finalpj.nbw.notice.domain.PageHandler;
import com.finalpj.nbw.notice.domain.SearchCondition;
import com.finalpj.nbw.notice.service.NoticeService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Log4j
@Controller
@RequestMapping("admin/notice")
public class AdminNoticeController {

    NoticeService noticeService;

    public AdminNoticeController(NoticeService noticeService){
        this.noticeService = noticeService;
    }

    @GetMapping("/page")
    public String getNoticePage(SearchCondition sc,  Model m){
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


}

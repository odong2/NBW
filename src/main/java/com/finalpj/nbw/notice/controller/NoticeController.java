package com.finalpj.nbw.notice.controller;

import com.finalpj.nbw.notice.domain.Notice;
import com.finalpj.nbw.notice.domain.PageHandler;
import com.finalpj.nbw.notice.service.NoticeService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Controller
@RequestMapping("/notice/*")
public class NoticeController {

    NoticeService noticeService;

    public NoticeController(NoticeService noticeService){
        this.noticeService = noticeService;
    }
   @GetMapping("noticeList")
    public String noticeList(){
        return "/notice/noticePage";
    }

    @GetMapping("notice")
    public String notice(){
    return "/notice/noticeDetail";
   }
   /******************* 공지사항 페이지 테스트 ********************/
    @GetMapping("noticePageTest")
    public String noticePageTest(Integer page, Integer pageSize, Model m){
        if (page == null)page = 1;
        if (pageSize == null )pageSize = 10;

        try {
            // 전체 게시물 개수 조회
            int totalCnt = noticeService.getNoticeTotalCnt();
            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
            log.info("총 게시물 개수는 " + totalCnt + "개");
            log.info("pageHandler는 " + pageHandler);

            int offset = (page-1)*pageSize;
            int offsetTo = page == 1 ? 10 : page * pageSize;

            Map map = new HashMap();
            map.put("offset", offset);
            map.put("pageSize", offsetTo);
            m.addAttribute("ph", pageHandler);
            List<Notice> noticeList= noticeService.getPageNotiseList(map);
            m.addAttribute(noticeList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/notice/noticePageTest";
    }
}

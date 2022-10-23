package com.finalpj.nbw.notice.controller;

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
    /************************ 공지글 목록 페이지 요청  ***********************/
   @GetMapping("list")
    public String noticeList(SearchCondition sc, Model m){

       try {
           // 전체 게시물 개수 조회
           int totalCnt = noticeService.getSearchResultCnt(sc);
           PageHandler pageHandler = new PageHandler(totalCnt, sc);
//           PageHandler pageHandler = new PageHandler(totalCnt, page);
           log.info("총 게시물 개수는 " + totalCnt + "개");
           log.info("pageHandler는 " + pageHandler);

           m.addAttribute("ph", pageHandler);

           List<Notice> noticeList= noticeService.getSearchResultPage(sc);
           m.addAttribute(noticeList);
       } catch (Exception e) {
           e.printStackTrace();
       }
        return "/notice/noticePage";
    }

    @GetMapping("read")
    public String noticeRead(Integer nt_no, Integer page, Model m){
        try {
            Notice noticeDto = noticeService.getNotice(nt_no);
            m.addAttribute(noticeDto);
            m.addAttribute("page", page);
/*            m.addAttribute("pageSize", pageSize);*/
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/notice/noticeDetail";
   }

}

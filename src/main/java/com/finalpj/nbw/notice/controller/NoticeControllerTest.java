//package com.finalpj.nbw.notice.controller;
//
//import com.finalpj.nbw.notice.domain.Notice;
//import com.finalpj.nbw.notice.domain.PageHandler;
//import com.finalpj.nbw.notice.domain.PageHandlerTest;
//import com.finalpj.nbw.notice.service.NoticeService;
//import lombok.extern.log4j.Log4j;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//@Log4j
//@Controller
//@RequestMapping("/notice/*")
//public class NoticeControllerTest {
//
//    NoticeService noticeService;
//
//    public NoticeControllerTest(NoticeService noticeService){
//        this.noticeService = noticeService;
//    }
//    /********************** 공지글 목록 페이지 요청  ***********************/
//   @GetMapping("list")
//    public String noticeList(Integer page, Model m){
//       if (page == null)page = 1;
//
//       try {
//           // 전체 게시물 개수 조회
//           int totalCnt = noticeService.getNoticeTotalCnt();
//           PageHandlerTest pageHandler = new PageHandlerTest(totalCnt, page);
//           log.info("총 게시물 개수는 " + totalCnt + "개");
//           log.info("pageHandler는 " + pageHandler);
//
//           int pageSize = pageHandler.getPageSize();
//           int offset = (page-1) * pageSize;
//           int offsetTo = page == 1 ? 10 : page * pageSize;
//
//           Map map = new HashMap();
//           map.put("offset", offset);
//           map.put("pageSize", offsetTo);
//           m.addAttribute("ph", pageHandler);
//
//           List<Notice> noticeList= noticeService.getPageNotiseList(map);
//           m.addAttribute(noticeList);
//       } catch (Exception e) {
//           e.printStackTrace();
//       }
//        return "/notice/noticePage";
//    }
//
//    @GetMapping("read")
//    public String noticeRead(Integer nt_no, Integer page, Model m){
//        try {
//            Notice noticeDto = noticeService.getNotice(nt_no);
//            m.addAttribute(noticeDto);
//            m.addAttribute("page", page);
///*            m.addAttribute("pageSize", pageSize);*/
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "/notice/noticeDetail";
//   }
//
//}

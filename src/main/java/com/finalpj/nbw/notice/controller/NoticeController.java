package com.finalpj.nbw.notice.controller;

import com.finalpj.nbw.notice.domain.Notice;
import com.finalpj.nbw.notice.domain.PageHandler;
import com.finalpj.nbw.notice.domain.SearchCondition;
import com.finalpj.nbw.notice.service.NoticeService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Log4j
@Controller
@RequestMapping("/notice/*")
public class NoticeController {

    NoticeService noticeService;

    public NoticeController(NoticeService noticeService){
        this.noticeService = noticeService;
    }

    /************************ 공지글 목록 페이지 ***********************
     * param(SearchCondition sc): 사용자로 부터 조건 검색 및 페이징 계산에 필요한 필드값을 받는 Dto
     * param(Model m) : 공지글의 총 게시물 개수 조회 후 pageHandler의 필드값을 계산하여 model에 저장
     * return : notice 페이지
     * **************************************************************/
   @GetMapping("list")
    public String getnoticeList(SearchCondition sc, Model m){
       try {
           // 전체 게시물 개수 조회
           int totalCnt = noticeService.getSearchResultCnt(sc);
           PageHandler pageHandler = new PageHandler(totalCnt, sc);
//         PageHandler pageHandler = new PageHandler(totalCnt, page);
           log.info("총 게시물 개수는 " + totalCnt + "개");
           log.info("pageHandler는 " + pageHandler);

           m.addAttribute("ph", pageHandler);

           List<Notice> noticeList= noticeService.getSearchResultPage(sc);
           m.addAttribute(noticeList);
       } catch (Exception e) {
           e.printStackTrace();
       }
        return "/notice/notice";
    }

    /************************ 공지글 상세 페이지  ***********************
     * param(Integer nt_no) : 공지글의 번호 
     * param(SearchCondition sc): notice 페이지에서 상세페이지 클릭전 page 및 조건검색어를 넘겨 받아 목록으로 가기 처리
     * param(Model m) : nt_no(공지글 번호)로 조회한 공지글의 정보를 noticeDto에 담아 model에 저장
     * return : noticeDetail페이지
     * **************************************************************/
    
    @GetMapping("read")
    public String readNotice(Integer nt_no, SearchCondition sc, Model m){
        try {
            Notice noticeDto = noticeService.getNotice(nt_no);
            // 첨부파일이 존재하면 기존 파일 이름을 세팅하여 모델에 dto에 저장
            if(noticeDto.getNt_file() != null){
                String saveFileName = noticeDto.getNt_file();
                int idx = saveFileName.indexOf("_");
                // uuid를 제거하여 저장
                String originalFileName = saveFileName.substring(idx+1);
                noticeDto.setNt_filename(originalFileName);
            }
            m.addAttribute("noticeDto", noticeDto);
            m.addAttribute("SearchCondition", sc);
            log.info("noticeDto = " + noticeDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/notice/noticeDetail";
   }

}

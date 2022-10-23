package com.finalpj.nbw.notice.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

@Data
@ToString
public class PageHandler {
//    private int page;               // 현재페이지
//    private int pageSize = 10;     // 한페이지의 크기
//    private String option;
//    private String keyword;
    private SearchCondition sc;
    private int totalCnt;           // 총 게시물 개수

    private int naviSize = 5;      // 페이지 내비게이션의 크기
    private int totalPage;          // 전체 페이지 개수

    private int beginPage;          // 내비게이션의 첫번째 페이지
    private int endPage;            // 내비게이션의 첫번째 페이지
    private boolean showPrev;       // 이전 페이지 이동 링크 여부
    private boolean showNext;       // 다음 페이지 이동 링크 여부

    public PageHandler(int totalCnt, SearchCondition sc){
        this.totalCnt = totalCnt;
        this.sc = sc;

        doPaging(totalCnt, sc);
    }
    public void doPaging(int totalCnt,SearchCondition sc){
    this.totalCnt = totalCnt;

    totalPage = (int)Math.ceil(totalCnt / (float)sc.getPageSize()); // 나머지 값 있을 경우 페이지 하나 추가
    beginPage = (sc.getPage()-1) / naviSize * naviSize + 1;
    endPage =  Math.min(beginPage + naviSize-1 , totalPage);
    showPrev = beginPage != 1;
    showNext = endPage != totalPage;
    }


    public void print(){
        System.out.println("현재 페이지는 = " + sc.getPage() + "page");
        System.out.print(showPrev ? "[PREV]" : "");
        for (int i = beginPage; i <= endPage; i++) {
            System.out.print(i+ " ");
        }
        System.out.println(showNext ? "[Next]" : "");
    }


}

package com.finalpj.nbw.notice.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PageHandler {
    private int totalCnt;           // 총 게시물 개수
    private int pageSize = 10;           // 한페이지의 크기
    private int naviSize = 5;      // 페이지 내비게이션의 크기
    private int totalPage;          // 전체 페이지 개수
    private int page;               // 현재페이지
    private int beginPage;          // 내비게이션의 첫번째 페이지
    private int endPage;            // 내비게이션의 첫번째 페이지
    private boolean showPrev;       // 이전 페이지 이동 링크 여부
    private boolean showNext;       // 다음 페이지 이동 링크 여부

    public PageHandler(int totalCnt, int page){
    this.totalCnt = totalCnt;
    this.page = page;

    totalPage = (int)Math.ceil(totalCnt / (float)pageSize); // 나머지 값 있을 경우 페이지 하나 추가
    beginPage = (page-1) / naviSize * naviSize + 1;
    endPage =  Math.min(beginPage + naviSize-1 , totalPage);
    showPrev = beginPage != 1;
    showNext = endPage != totalPage;
    }


    void print(){
        System.out.println("현재 페이지는 = " + page + "page");
        System.out.print(showPrev ? "[PREV]" : "");
        for (int i = beginPage; i <= endPage; i++) {
            System.out.print(i+ " ");
        }
        System.out.println(showNext ? "[Next]" : "");
    }


}

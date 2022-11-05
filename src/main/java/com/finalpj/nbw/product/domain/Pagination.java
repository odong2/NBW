package com.finalpj.nbw.product.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Pagination {
    /* 시작 페이지 */
    private int startPage;

    /* 마지막 페이지 */
    private int endPage;

    /* 이전, 다음 페이지 존재 여부 */
    private boolean isPrev;
    private boolean isNext;

    /* 조회한 전체 게시물 수 */
    private int totalCount;

    /* 현재 페이지, 페이지 당 게시물 표시수 정보 */
    private Criteria criteria;

    /* 전달받은 Criteria 와 totalCount 정보를 활용해서 계산 후 Pagination 의 변수 값을 초기화 한다. */
    public Pagination(Criteria criteria, int totalCount){
        this.criteria = criteria;
        this.totalCount = totalCount;

        /* 마지막 페이지 : 화면에 보일 끝 번호
        * (1) 현재 페이지를 10으로 나눈다.
        * (2) 그 결과 값을 올림한다.
        * (3) 다시 10을 곱한다.
        * ex) 현재 페이지가 9인 경우 ==> (반올림(9/10.0)) * 10 = 10 */
        this.endPage = (int)(Math.ceil(criteria.getPageNum()/10.0))*10;

        /* 시작 페이지 : 화면에 보일 시작 번호
        * (1) 마지막 페이지 - 9 */
        this.startPage = this.endPage - 9;

        /* 전체 마지막 페이지 : */
        int realEnd = (int)(Math.ceil((totalCount * 1.0/criteria.getAmount())));

        /* 전체 마지막 페이지가 화면에 보이는 마지막 페이지보다 작은 경우 , 보이는 페이지에서 조정 */
        if(realEnd < this.endPage){
            this.endPage = realEnd;
        }

        /* 시작 페이지 값이 1보다 큰 경우 true 반환 */
        this.isPrev = this.startPage > 1;

        /* 미자믹 페이지 값이 1보다 큰 경우 true 반환
        * 예를 들면 화면에 보이는 마지막 페이지가 20인데 전체 페이지의 마지막 번호가 27이면 '다음 페이지 버튼'이 존재해야 한다.
        * 반대로 화면에 보이는 마지막 페이지가 23인데 마지막 번호가 23이면 다음 페이지가 존재하지 않기 때문에 다음 페이지 버튼이 없어야 한다. */
        this.isNext = this.endPage > realEnd;


    }

}

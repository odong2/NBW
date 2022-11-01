package com.finalpj.nbw.product.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Criteria {
    /* 한 페이지 당 10개씩 보여준다고 할 때 rownum 번호는 계속 변화한다.
        따라서 다음과 같이 변수로 치환할 수 있다.
        현재 있는 페이지가 1페이지일 때 rownum 번호 범위 => 1-10
        현재 있는 페이지가 2페이지일 때 rownum 번호 범위 => 11-20
        ...
        # 한 페이지 당 {amount}개씩 보여준다. 현재 있는 페이지가 {pageNum}일 때 rownum 번호 범위는?
        (pageNum -1) * amount ~ pageNum * amount
    */

    /* 현재 페이지 */
    private int pageNum;

    /* 한 페이지당 보여질 게시물 갯수 */
    private int amount;

    /* 검색 키워드 */
    private String keyword;

    /* 기본 생성자 */
    public Criteria (int pageNum, int amount){
        this.pageNum = 1;
        this.amount = 10;
    }

    /* 생성자 => 원하는  pageNum, amount */
    public Criteria(Integer pageNum, Integer amount){
        this.pageNum = pageNum;
        this.amount = amount;
    }
}

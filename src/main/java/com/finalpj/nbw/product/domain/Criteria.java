package com.finalpj.nbw.product.domain;

import lombok.*;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class Criteria  {

    /* 한 페이지 당 10개씩 보여준다고 할 때 rownum 번호는 계속 변화한다.
        따라서 다음과 같이 변수로 치환할 수 있다.
        현재 있는 페이지가 1페이지일 때 rownum 번호 범위 => 1-10
        현재 있는 페이지가 2페이지일 때 rownum 번호 범위 => 11-20
        ...
        # 한 페이지 당 {amount}개씩 보여준다. 현재 있는 페이지가 {pageNum}일 때 rownum 번호 범위는?
        (pageNum -1) * amount ~ pageNum * amount
    */

    /* 현재 페이지 */
    private int pageNum = 1;

    /* 한 페이지당 보여질 게시물 갯수 */
    private int amount = 10;

    /* 검색 키워드 */
    private String keyword;

    /* 검색 타입 */
    /* 사용자가 카테고리버튼을 이용해 검색할 경우 type = 'C' */
    private String type;

    /* 졍렬 타입 */
    /* recent = 최신순
    *  sell = 핀매순
    *  lowerprice = 낮은가격순
    *  higherprice = 높은가격순
    *  review = 리뷰순
    *  like = 좋아요순
    *  score = 평점순 */
    private String sort;

    /* 사용자가 요청하는 카테고리 */
    private String p_category;

    /* 카테고리에 속한 상품 수 */
  //  private int categoryCount;



}

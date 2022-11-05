package com.finalpj.nbw.product.domain;

import lombok.*;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CategoryFilter { /* 카테고리 필터 검색을 하기 위해서 필요한 데이터 */

    /* 카테고리 코드 번호 */
    private String categoryCode;

    /* 카테고리에 속한 상품 수 */
    private int categoryCount;

}

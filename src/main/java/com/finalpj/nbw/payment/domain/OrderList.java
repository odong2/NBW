package com.finalpj.nbw.payment.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
/****************** 마이페이지 주문 조회 페이지에서 사용하는 Dto **************************/
public class OrderList {
    private String p_title;           // 상품 제목
    private String p_category;        // 상품 카테고리
    private String p_img;             // 상품 이미지
    private Integer p_price;          // 상품 가격
    private Date order_date;          // 주문 결제일
    private Integer total_price;      // 총 결제 금액
    private String order_no;          // 주문번호
    private Integer used_point;       // 포인트 사용금액
    private String receiver_name;     // 수령자 이름
    private String receiver_phone;    // 수령자 전화번호
    private String receiver_address1; // 수령자 주소
    private String receiver_address2; // 수령자 상세주소
    private String delivery_memo;     // 배송메모
    private String p_no;              // 상품번호
    private String order_status;      // 배송 상태
    private Integer p_count;          // 상품 수량
    private String cp_no;             // 쿠폰번호
    private String cp_name;           // 쿠폰이름(사용유무)
    private Integer cp_price;         // 쿠폰 금액
}

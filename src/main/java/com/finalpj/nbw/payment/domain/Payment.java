package com.finalpj.nbw.payment.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Payment implements Pay{
    private Integer[] p_no;             // 주문상품 번호
    private String[] p_title;           // 주문상품 이름
    private Integer[] p_price;          // 주문상품 가격
    private String[] p_img;             // 주문상품 이미지
    private Integer[] p_count;          // 주문상품 수량
    private String order_no;            // 주문번호
    private String mem_id;              // 회원 아이디
    private String mem_email;           // 회원 이메일
    private String mem_name;            // 회원 이름
    private Integer mem_point = 0;      // 회원 보유 포인트
    private Integer used_point = 0;     // 사용포인트 
    private String cp_no;               // 쿠폰번호
    private Integer total_price;        // 총 결제금액
    private String receiver_name;       // 수취인 이름
    private String receiver_phone;      // 수취인 폰번호
    private String receiver_zipcode;    // 수취인 우편번호
    private String receiver_address1;   // 수취인 주소
    private String receiver_address2;   // 수취인 상세주소
    private String delivery_memo;       // 배송메모

}

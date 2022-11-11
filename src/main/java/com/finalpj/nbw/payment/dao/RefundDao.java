package com.finalpj.nbw.payment.dao;

import java.util.Map;

import com.finalpj.nbw.payment.domain.Refund;

public interface RefundDao {
    // 주문 상품 환불상태 변경()
    int insertRefundOrder (Map<String,Object>pMap) throws Exception;
    Refund selectRefundInfo(Map<String,Object> pMap) throws Exception; // 모달창에 가져올 환불 요청 정보
    int updateRefundOrder(Map<String,Object> pMap) throws Exception; // 반품상태 변경
}

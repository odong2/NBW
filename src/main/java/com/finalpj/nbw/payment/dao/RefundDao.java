package com.finalpj.nbw.payment.dao;

import java.util.Map;

public interface RefundDao {
    // 주문 상품 환불상태 변경()
    int insertRefundOrder (Map<String,Object>pMap) throws Exception;

}

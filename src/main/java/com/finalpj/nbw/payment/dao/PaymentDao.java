package com.finalpj.nbw.payment.dao;

import com.finalpj.nbw.payment.domain.CartProduct;
import com.finalpj.nbw.payment.domain.Payment;

import java.util.List;
import java.util.Map;

public interface PaymentDao {
    // tb_memberPayment에 결제정보 넣기(1건)
    int insertMemPayment(Payment paymentDto) throws Exception;
    // tb_memberPaymentdetail 결제 정보 넣기(n건)
    int insertMemPayDetail(List<Map<String,Object>> payDetailList) throws Exception;

    List<CartProduct> selectPayAfter (String order_no) throws Exception;

    Map<String,Object> selectReceiver (String order_no) throws Exception;

}

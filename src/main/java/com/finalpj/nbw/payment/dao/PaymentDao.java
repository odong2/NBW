package com.finalpj.nbw.payment.dao;

import com.finalpj.nbw.payment.domain.Payment;

public interface PaymentDao {
    // tb_memberpayment에 결제정보 넣기(1건)
    int insertMemPayment(Payment paymentDto) throws Exception;
    // tb_memberpaymentdetail 결제 정보 넣기(n건)
    int insertMemPayDetail(Payment paymentDto) throws Exception;
    // tb


}

package com.finalpj.nbw.payment.service;

import com.finalpj.nbw.coupon.dao.CouponDao;
import com.finalpj.nbw.coupon.domain.Coupon;
import com.finalpj.nbw.payment.dao.PaymentDao;
import com.finalpj.nbw.product.dao.ProductDao;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

@Log4j
@Service
public class PaymentService {

    private final PaymentDao paymentDao;
    private final CouponDao couponDao;
    private final ProductDao productDao;

    public PaymentService(PaymentDao paymentDao, CouponDao couponDao, ProductDao productDao){
        this.paymentDao = paymentDao;
        this.couponDao = couponDao;
        this.productDao= productDao;
    }



}

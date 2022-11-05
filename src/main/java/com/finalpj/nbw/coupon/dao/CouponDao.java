package com.finalpj.nbw.coupon.dao;

import com.finalpj.nbw.coupon.domain.Coupon;
import com.finalpj.nbw.notice.domain.Notice;

import java.util.List;
import java.util.Map;

public interface CouponDao {

    int selectIsCoupon(String mem_id) throws Exception; // 쿠폰 존재 여부
    List<Coupon> selectCouponList(String mem_id) throws Exception; // 멤버 쿠폰 가져오기

    int deleteMemCoupon(Map pMap) throws Exception; // 멤버 쿠폰 삭제(결제시 사용하였을 경우)
}

package com.finalpj.nbw.coupon.service;

import com.finalpj.nbw.coupon.dao.CouponDao;
import com.finalpj.nbw.coupon.domain.Coupon;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Log4j
@Service
public class CouponService {
    private final CouponDao couponDao;
    public CouponService(CouponDao couponDao){
        this.couponDao = couponDao;
    }

    /**************************** 회원 쿠폰정보 조회 *****************************/
    public List<Coupon> getCouponList(String mem_id) throws Exception{

        List<Coupon> couponList = null;
        /* (1) 쿠폰이 있는지 조회 */
        int isCoupon = couponDao.selectIsCoupon(mem_id);
        log.info("쿠폰 존재 여부 ====> " + isCoupon);
        /* (2) 쿠폰 조회결과로 분기 */
        if(isCoupon > 0){
            log.info("쿠폰이 존재함");
            /* (3) 쿠폰이 존재할 경우 회원의 쿠폰조회 */
            couponList = couponDao.selectCouponList(mem_id);
        }else {
            /* (3) 쿠폰이 존재하지 않을 경우 couponList 빈값 */
            log.info("쿠폰이 존재하지 않음");
        }
        return couponList;
    }

}

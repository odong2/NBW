package com.finalpj.nbw.admin.controller;

import com.finalpj.nbw.coupon.domain.Coupon;
import com.finalpj.nbw.coupon.service.CouponService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Log4j
@Controller
@RequestMapping("/admin/coupon/")
public class AdminCouponController {
    private final CouponService couponService;

    public AdminCouponController(CouponService couponService){
        this.couponService = couponService;
    }

    /************************* 쿠폰 관리 페이지 ************************/
    @GetMapping("list")
    public String couponList(Model m){
//        try {
//            // 등록된 쿠폰 모두 조회
//            List<Coupon> couponList = couponService.getAllRegistedCoupon();
//            m.addAttribute(couponList);
//        } catch (Exception e){
//            e.printStackTrace();
//        }
        return "/admin/coupon/couponList";
    }

}

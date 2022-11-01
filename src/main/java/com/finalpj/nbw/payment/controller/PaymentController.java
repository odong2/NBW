package com.finalpj.nbw.payment.controller;

import com.finalpj.nbw.coupon.domain.Coupon;
import com.finalpj.nbw.coupon.service.CouponService;
import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.payment.domain.CartList;
import com.finalpj.nbw.payment.service.PaymentService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j
@Controller
@RequestMapping("/payment/*")
public class PaymentController {
    private final PaymentService paymentService;
    private final CouponService couponService;

    public PaymentController(PaymentService paymentService, CouponService couponService){
        this.paymentService = paymentService;
        this.couponService = couponService;
    }

    /*************************  결제페이지  ********************************
     * param(CartList cartList) : p_no, p_title, p_price, p_img, p_category,mcart_count - 정보를 List<cartProduct>의 형태로 넘겨 받는다.
     * param(HttpSession session) : 회원, 비회원을 구별하기 위해 session의 member.mem_id를 꺼내어 분기한다.
     * param(Model m) : cartSize(총 주문 개수) 및 couponList(멤버의 쿠폰)을 view에 보내기 위해 사용
     * return : payment view 페이지
     * *******************************************************************/
    @GetMapping("list")
    public String getPaymentList(@ModelAttribute CartList cartList, HttpSession session, Model m){
        log.info("장바구니에서 넘어온 상품 결제페이지로 넘어온 삼품의 정보 ========> " + cartList);
        Member member = (Member)session.getAttribute("member");
        String mem_id = member.getMem_id();
        // 회원일 경우만 쿠폰을 조회
        if(mem_id != null && mem_id.trim() != "") {
            List<Coupon> couponList = null;
            try {
                couponList = couponService.getCouponList(mem_id);
                log.info("회원의 쿠폰 정보 ==========> " + couponList);
                m.addAttribute("couponList", couponList);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // 총 상품 개수를 담는다
        int cartSize= cartList.getCartProducts().size();
        m.addAttribute("cartSize",cartSize);
        return "/payment/payment";
    }
    /* */
    /************************************************************
     * Information : 결제 페이지에서 넘겨 받는 값 테스트 하기 위한 페이지
     * return : payTest 페이지
     * **********************************************************/
    @GetMapping("test")
    public String getTest(){
        return "/payment/payTest";
    }
    
}

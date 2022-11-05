package com.finalpj.nbw.payment.controller;

import com.finalpj.nbw.cart.domain.Cart;
import com.finalpj.nbw.coupon.domain.Coupon;
import com.finalpj.nbw.coupon.service.CouponService;
import com.finalpj.nbw.mail.service.MailService;
import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.payment.domain.CartList;
import com.finalpj.nbw.payment.domain.CartProduct;
import com.finalpj.nbw.payment.domain.Payment;
import com.finalpj.nbw.payment.service.PaymentService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Log4j
@Controller
@RequestMapping("/payment/*")
public class PaymentController {
    private final PaymentService paymentService;
    private final CouponService couponService;
    private final MailService mailService;
    public PaymentController(PaymentService paymentService, CouponService couponService, MailService mailService){
        this.paymentService = paymentService;
        this.couponService = couponService;
        this.mailService = mailService;
    }

    /*************************  결제페이지  ********************************
     * @param(CartList cartList) : p_no, p_title, p_price, p_img, p_category,mcart_count - 정보를 List<cartProduct>의 형태로 넘겨 받는다.
     * @param(HttpSession session) : 회원, 비회원을 구별하기 위해 session의 member.mem_id를 꺼내어 분기한다.
     * @param(Model m) : cartSize(총 주문 개수) 및 couponList(멤버의 쿠폰)을 view에 보내기 위해 사용
     * @return : payment view 페이지
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
     * @Information : 결제 페이지에서 넘겨 받는 값 테스트 하기 위한 페이지
     * @return : payTest 페이지
     * **********************************************************/
    @GetMapping("test")
    public String getTest(){
        return "/payment/payTest";
    }


    /************************ 결제페이지에서 결제하기  ****************************/
    @PostMapping("pay")
    public String orderPay(@ModelAttribute Payment paymentDto, HttpSession session, RedirectAttributes rattr){
        Member member = (Member)session.getAttribute("member");
        String cp_no = paymentDto.getCp_no();


        /** (1) 주문번호 생성(날짜생성 ex.20220522fsa)**/
        String order_no = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String uuid = UUID.randomUUID().toString();
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());

        // 하이픈 제외
        String resultUuid = uuid.toString().replaceAll("-", "");
        order_no = strToday + resultUuid.substring(0,8);
        paymentDto.setOrder_no(order_no);

        log.info(paymentDto);

        try {
            // (1) 결제
            paymentService.memorderPay(paymentDto, session);
            // (2) 결제 정보 메일전송
//            mailService.sendPayHtml(paymentDto);
        } catch (Exception e){
            e.printStackTrace();
        }

        return "redirect:/payment/pay/" + order_no;
    }

    @GetMapping("pay/{order_no}")
    public String resultPay(@PathVariable String order_no, Model m){
        List<CartProduct> productList = null;
        Map<String, Object> rMap = null;
        String orderDate = order_no.substring(0,8);
        log.info("orderDate = " + orderDate);
        try{
        productList = paymentService.afterPaySearchOrder(order_no);
        rMap = paymentService.afterpaySearchReceiver(order_no);
        m.addAttribute("receiverInfo",rMap);
        m.addAttribute("productList", productList);
        } catch (Exception e){
            e.printStackTrace();
        }

        return "/payment/successPayment";
    }
}

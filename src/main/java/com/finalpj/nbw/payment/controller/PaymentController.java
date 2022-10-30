package com.finalpj.nbw.payment.controller;

import com.finalpj.nbw.payment.domain.CartList;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Log4j
@Controller
@RequestMapping("/payment/*")
public class PaymentController {


    @GetMapping("list")
    public String getPaymentList(@ModelAttribute CartList cartList, Model m){
        log.info("장바구니에서 넘어온 상품 결제페이지로 넘어온 삼품의 정보 ========> " + cartList);
        int cartSize= cartList.getCartProducts().size();
        m.addAttribute("cartSize",cartSize);
        return "/payment/payment";
    }
    @GetMapping("test")
    public String getTest(){
        return "/payment/payTest";
    }

    // ?p_no=1&p_title=test1&p_price=1000&p_img=이미지1?p_category=도서&mcart_count=1&p_no=2&p_title=test2&p_price=2000&p_img=이미지2?p_category=금융&mcart_count=2


    /*마이페이지 결제 조회 페이지*/
//    @GetMapping("list")
//    public String paymentList(){
//        return "/mypage/payment";
//
//    }
}

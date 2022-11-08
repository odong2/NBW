package com.finalpj.nbw.mypage.controller;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.payment.domain.OrderList;
import com.finalpj.nbw.payment.domain.Payment;
import com.finalpj.nbw.payment.service.PaymentService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Controller
@RequestMapping("mypage/payment")
public class MyPagePaymentController {

    private final PaymentService paymentService;

    public MyPagePaymentController(PaymentService paymentService){
        this.paymentService = paymentService;
    }

    /******************** 결제 조회 페이지 ***********************/
    @GetMapping("list")
    public String paymentList(HttpSession session, Model m){
        Member member = (Member)session.getAttribute("member");
        String mem_id = member.getMem_id();
        List<OrderList> orderList = null;
        Map<String,Integer> sMap = null;
        try{
        // (1) 주문 리스트 가져오기
        orderList = paymentService.getMemOrderList(mem_id);
        // (2) 주문상태 개수 가져오기(ex.취소,반품,교환등)
        sMap = paymentService.getMemStatusCnt(mem_id);
        m.addAttribute("orderList",orderList);
        m.addAttribute("orderStatus", sMap);
        }catch (Exception e){
            e.printStackTrace();
        }

        return "/mypage/payment";
    }
}

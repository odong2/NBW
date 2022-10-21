package com.finalpj.nbw.payment.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Log4j
@Controller
@RequestMapping("/payment/*")
public class PaymentController {
    @GetMapping("list")
    public String paymentList(){
        return "/payment/payment";

    }
}

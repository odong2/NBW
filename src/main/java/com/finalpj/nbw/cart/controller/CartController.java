package com.finalpj.nbw.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@GetMapping("list")
	public String cartList() {
		return "/cart/cartPage";
	}
}

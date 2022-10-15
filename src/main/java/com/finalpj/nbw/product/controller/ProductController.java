package com.finalpj.nbw.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.repository.ProductDaoImpl;


@Controller
public class ProductController {
	
	@Autowired
	private ProductDaoImpl productdao;
	
	@GetMapping("/product/{id}")
	public String detail(@PathVariable("id") String number, Model model) {
		System.out.println("number: "+number);
		Product product = productdao.getProduct(number);
		System.out.println("product: "+product.toString());
		model.addAttribute("product",product);
		return "/detail";
	}

	@GetMapping("/category")
	public String goCategory(){
		return "/search/detailSearch";
	}
}


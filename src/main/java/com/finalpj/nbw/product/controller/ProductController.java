package com.finalpj.nbw.product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.member.service.MemberService;
import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.repository.ProductDaoImpl;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ProductController {
	
	@Autowired
	private ProductDaoImpl productdao;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/product/{id}")
	public String detail(@PathVariable("id") String number, Model model, HttpSession session) {
		System.out.println("number: "+number);
		Product product = productdao.getProduct(number);
		System.out.println("product: "+product.toString());
		model.addAttribute("product",product);
		
		Member member = (Member) session.getAttribute("member");
		
		if(member != null) {
			Map<String,Object> map = new HashMap<>();
			map.put("p_no", number);
			map.put("mem_id", member.getMem_id());
			model.addAttribute("isLike", memberService.existLike(map));
		}
		return "/detail";
	}

	@GetMapping("/category")
	public String goCategory(){
		return "/search/detailSearch";
	}

	/* ============================ 검색 =========================== */
	@GetMapping("/product/search")
	@ResponseBody
	public String search(String keyword) throws Exception{
		String result = "";
		return result;
	}
}


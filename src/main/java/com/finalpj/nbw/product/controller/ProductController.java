package com.finalpj.nbw.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.finalpj.common.exception.FileUploader;
import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.member.service.MemberService;
import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.domain.Review;
import com.finalpj.nbw.product.repository.ProductDaoImpl;
import com.finalpj.nbw.product.service.ProductService;

import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ProductController {
	
	private MemberService memberService;
	private ProductService productService;
	
	@Autowired
	public ProductController(MemberService memberService, ProductService productService) {
		this.memberService = memberService;
		this.productService = productService;
	}
	
	@GetMapping("/product/{id}")
	public String detail(@PathVariable("id") String p_no, Model model, HttpSession session) {
		
		Product product = productService.getProduct(p_no);
		model.addAttribute("product",product);
		
		Member member = (Member) session.getAttribute("member");
		
		if(member != null) {
			Map<String,Object> map = new HashMap<>();
			map.put("p_no", p_no);
			map.put("mem_id", member.getMem_id());
			model.addAttribute("isLike", memberService.existLike(map));
		}
		
		return "/detail";
	}

	@PostMapping("/review")
	@ResponseBody
	public Map<String, Object> review(Review review, HttpSession session) {
		Map<String, Object> map = null;
		
		Member member = (Member) session.getAttribute("member");
		
		if(member != null) {
			review.setMem_id(member.getMem_id());
			map = productService.reviewRegister(review);
		}else {
			map = new HashMap<>();
			map.put("success", false);
			map.put("msg", "로그인이 필요합니다.");
		}

		return map;
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


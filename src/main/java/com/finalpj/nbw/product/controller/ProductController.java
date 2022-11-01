package com.finalpj.nbw.product.controller;


import com.finalpj.nbw.product.domain.Criteria;
import com.finalpj.nbw.product.domain.Pagination;
import com.finalpj.nbw.product.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.repository.ProductDaoImpl;

import java.util.*;


@Controller
@RequestMapping("/product/")
@Slf4j
public class ProductController {

	@Autowired
	private ProductDaoImpl productdao;

	@Autowired
	private ProductService productService;

	@GetMapping("{id}")
	public String detail(@PathVariable("id") String number, Model model) {
		System.out.println("number: "+number);
		Product product = productdao.getProduct(number);
		System.out.println("product: "+product.toString());
		model.addAttribute("product",product);
		return "/detail";
	}

	/* =============================== 추천 검색어 조회 ================================== */
	@PostMapping("search")
	@ResponseBody
	public Map<String, Object> search(@RequestParam Map<String, Object> paramMap) throws Exception{

		List<Map<String, Object>> resultList = productService.search(paramMap);
		paramMap.put("resultList", resultList);

		/* 잘 받아오는지 출력해봄 */
		ListIterator<Map<String, Object>> iter = resultList.listIterator();
		while (iter.hasNext()){
			Integer key = iter.nextIndex()+1;
			String value = iter.next().toString();
			System.out.println(key + " : " + value);
			System.out.println("=================================================");
		}
		return paramMap;
	}

	/* =============================== 상품 목록 검색 > 페이징 ================================== */
	@GetMapping("search")
	public String getProductList(/*@RequestParam(value = "keyword") String keyword,*/ Model model, Criteria criteria) throws Exception {
		log.info("list CONTROLLER 진입");
//		log.info("사용자가 입력한 keyword : "+ keyword);
//		criteria.setKeyword(keyword);
//		log.info("criteria.getKeyword() : "+ criteria.getKeyword());
		log.info("criteria : "+ criteria);

		List<Product> list = productService.searchProduct(criteria);

		if(!list.isEmpty()){
			model.addAttribute("list", list);
			log.info("list : "+ list);
		}else {
			model.addAttribute("empty");
			return "/search/productList";
		}

		model.addAttribute("pagination", new Pagination(criteria, productService.getTotalCount(criteria)));

		return "/search/productList";
	}
}


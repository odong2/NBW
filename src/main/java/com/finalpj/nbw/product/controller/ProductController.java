package com.finalpj.nbw.product.controller;


import com.finalpj.nbw.product.domain.CategoryFilter;
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
		return paramMap;
	}


	/* =============================== 상품 목록 검색 > 페이징 ================================== */
	@GetMapping("search")
	public String getProductList(Model model, Criteria criteria) throws Exception {

		try{
				log.info("list CONTROLLER 진입");
				int totalCount = productService.getTotalCount(criteria);
				Pagination pagination = new Pagination(criteria, totalCount);
				//log.info("DB 에서 불러온 상품 총 개수는 => "+totalCount);


				log.info("CRITERIA : "+ criteria);
				model.addAttribute("criteria", criteria);

				model.addAttribute("pagination", pagination);

				List<Product> list = productService.searchProduct(criteria);

				model.addAttribute("list", list);

				//log.info("LIST : "+ list);
				//log.info("SERVICE 에서 받아온 getCategoryFilter ====> "+ productService.getCategoryFilter(criteria));
				log.info("=========================================================");
				model.addAttribute("categoryFilterList", productService.getCategoryFilter(criteria));

			} catch (Exception e){
				e.printStackTrace();
		}

		return "/product/productList";
	}
}


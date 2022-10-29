package com.finalpj.nbw.product.controller;

import com.finalpj.nbw.product.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.repository.ProductDaoImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;


@Controller
@Slf4j
public class ProductController {
	
	@Autowired
	private ProductDaoImpl productdao;

	@Autowired
	private ProductService productService;

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

	/* =============================== 검색 : 키워드 검색 ================================== */
	@PostMapping("/product/search")
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
}


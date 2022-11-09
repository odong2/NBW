package com.finalpj.nbw.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.finalpj.common.FileUploader;
import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.member.service.MemberService;

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
import com.finalpj.nbw.product.domain.Review;
import com.finalpj.nbw.product.repository.ProductDaoImpl;

import com.finalpj.nbw.product.service.ProductService;

import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;



@Controller
@RequestMapping("/product/")
@Slf4j
public class ProductController {
	
	private MemberService memberService;
	private ProductService productService;
	
	@Autowired
	public ProductController(MemberService memberService, ProductService productService) {
		this.memberService = memberService;
		this.productService = productService;
	}

	@GetMapping("{id}")
	public String detail(@PathVariable("id") String p_no, Model model, HttpSession session) {
		Product product = productService.getProduct(p_no);
		model.addAttribute("product", product);
		
		Member member = (Member) session.getAttribute("member");
		
		if(member != null) {
			Map<String,Object> map = new HashMap<>();
			map.put("p_no", p_no);
			map.put("mem_id", member.getMem_id());
			model.addAttribute("isLike", memberService.existLike(map));
		}
		
		return "/detail";
	}

	@PostMapping("review")
	@ResponseBody
	public Map<String, Object> review(Review review, HttpSession session) {
		Map<String, Object> map = null;
		
		Member member = (Member) session.getAttribute("member");
		
		if(member != null) {
			review.setMem_id(member.getMem_id());
			review.setMem_point(member.getMem_point());
			review.setMem_nickname(member.getMem_nickname());
			try {
				map = productService.reviewRegister(review, session);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
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
	
    @GetMapping(value = "images/{fileName:.+}")
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName){
		final String uploadRoot = System.getProperty("user.home");
     	final String fileFolder = uploadRoot+"/Desktop/upload/review/";
        
        Resource resource = new FileSystemResource(fileFolder + fileName);
        
        if(!resource.exists())
        	return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
        
        HttpHeaders headers = new HttpHeaders();
        Path filePath = null;

        try {
            filePath = Paths.get(fileFolder+fileName);
            String Content_Type = Files.probeContentType(filePath);
			headers.add("Content-Type", Content_Type);
		} catch (IOException e) {
			e.printStackTrace();
		}

        return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
    }
}



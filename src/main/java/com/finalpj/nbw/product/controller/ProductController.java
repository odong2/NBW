package com.finalpj.nbw.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.finalpj.common.PageHandler;
import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.member.service.MemberService;

import com.finalpj.nbw.product.domain.Criteria;
import com.finalpj.nbw.product.domain.Pagination;
import com.finalpj.nbw.product.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

import org.springframework.web.bind.annotation.*;

import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.domain.Review;


import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




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
			Map<String,Object> memberMap = new HashMap<>();
			memberMap.put("p_no", p_no);
			memberMap.put("mem_id", member.getMem_id());
			model.addAttribute("isLike", memberService.existLike(memberMap));
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
	
	@PostMapping("page")
	@ResponseBody
	public void page(int page, String p_no, HttpServletResponse response) {
		int totalCnt = productService.getReviewTotalCnt(p_no);
		PageHandler pageHandler = new PageHandler(totalCnt, page);
		
		Map<String,Object> pageMap = new HashMap<>();
		pageMap.put("offset", pageHandler.getOffset());
		pageMap.put("offsetTo", pageHandler.getOffsetTo());
		pageMap.put("p_no", p_no);
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("reviewList", productService.getReviewListMap(pageMap));
		jsonObject.put("ph", pageHandler.getPageHandler());
		
		String jsonInfo = jsonObject.toString();
		
		response.setCharacterEncoding("utf-8");
		
		try {
			response.getWriter().print(jsonInfo);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/category")
	public String goCategory(){
		return "/search/detailSearch";
	}

	@PostMapping(value="autocomplete",  produces = "application/text; charset=UTF-8")
	public @ResponseBody String keywordSearch(Criteria criteria, String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");

		criteria.setAmount(3);
		criteria.setKeyword(keyword);
		List<Product> keywordList = productService.searchProduct(criteria);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("autocProduct", keywordList);

		String jsonInfo = jsonObject.toString();
		log.info(jsonInfo);
		return jsonInfo;
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

			log.info(productService.getCategoryFilter(criteria).toString());
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



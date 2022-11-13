package com.finalpj.nbw.product.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;

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

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.Cookie;
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

		List<Product> BestProduct = productService.getBestProducts(p_no);
		model.addAttribute("BestProduct", BestProduct);

		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			Map<String, Object> memberMap = new HashMap<>();
			memberMap.put("p_no", p_no);
			memberMap.put("mem_id", member.getMem_id());

			model.addAttribute("memberReview", productService.memberReview(memberMap));
			model.addAttribute("isLike", memberService.existLike(memberMap));
		}

		return "/detail";
	}

	@PostMapping("review")
	@ResponseBody
	public Map<String, Object> review(Review review, HttpSession session) {
		Map<String, Object> map = null;

		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			review.setMem_id(member.getMem_id());
			review.setMem_nickname(member.getMem_nickname());
			try {
				map = productService.reviewRegister(review, session);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			map = new HashMap<>();
			map.put("success", false);
			map.put("msg", "로그인이 필요합니다.");
		}

		return map;
	}

	@PostMapping("review/modify")
	@ResponseBody
	public Map<String, Object> modify(Review review, HttpSession session) {
		Map<String, Object> map = null;

		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			review.setMem_id(member.getMem_id());
			map = productService.reviewModify(review);

		} else {
			map = new HashMap<>();
			map.put("success", false);
			map.put("msg", "로그인 연결이 끊어졌습니다.");
		}

		return map;
	}

	@PostMapping("review/delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestBody Review review, HttpSession session) {
		Map<String, Object> map = null;

		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			review.setMem_id(member.getMem_id());
			map = productService.reviewDelete(review);

		} else {
			map = new HashMap<>();
			map.put("success", false);
			map.put("msg", "로그인 연결이 끊어졌습니다.");
		}

		return map;
	}

	@PostMapping("page")
	@ResponseBody
	public void page(int page, String p_no, HttpServletResponse response) {
		int totalCnt = productService.getReviewTotalCnt(p_no);
		PageHandler pageHandler = new PageHandler(totalCnt, page);

		Map<String, Object> pageMap = new HashMap<>();
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
	public String goCategory() {
		return "/search/detailSearch";
	}

	@PostMapping(value = "autocomplete", produces = "application/text; charset=UTF-8")
	public @ResponseBody String keywordSearch(Criteria criteria, String keyword, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
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

	/*
	 * =============================== 상품 목록 검색 > 페이징
	 * ==================================
	 */
	@GetMapping("search")
	public String getProductList(Model model, Criteria criteria) throws Exception {

		try {
			log.info("list CONTROLLER 진입");
			int totalCount = productService.getTotalCount(criteria);
			Pagination pagination = new Pagination(criteria, totalCount);
			// log.info("DB 에서 불러온 상품 총 개수는 => "+totalCount);
			log.info("CRITERIA : " + criteria);
			model.addAttribute("criteria", criteria);

			model.addAttribute("pagination", pagination);

			List<Product> list = productService.searchProduct(criteria);

			model.addAttribute("list", list);

			log.info(productService.getCategoryFilter(criteria).toString());
			model.addAttribute("categoryFilterList", productService.getCategoryFilter(criteria));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/product/productList";
	}

//    @GetMapping(value = "images/{fileName:.+}")
//    @ResponseBody
//    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName, HttpServletResponse response) {
//    	System.out.println("fileName========================>"+ fileName);
//    	
//		final String uploadRoot = System.getProperty("user.home");
//     	final String fileFolder = uploadRoot+"/Desktop/upload/review/";
//        
//        Resource resource = new FileSystemResource(fileFolder + fileName);
//        
//        if(!resource.exists())
//        	return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
//        
//        HttpHeaders headers = new HttpHeaders();
//        Path filePath = null;
//
//        try {
//            filePath = Paths.get(fileFolder+fileName);
//            String Content_Type = Files.probeContentType(filePath);
//			headers.add("Content-Type", Content_Type);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//        
//        return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
//    }

	@GetMapping("/images/{fileName:.+}")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(@PathVariable String fileName) {
		final String uploadRoot = System.getProperty("user.home");
		final String fileFolder = uploadRoot + "/Desktop/upload/review/";
		File file = new File(fileFolder + fileName);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@PostMapping("/recent")
	@ResponseBody
	public void recentProduct(@RequestBody String product,
			@CookieValue(value = "recent_product", required = false) Cookie coockie, HttpServletResponse response)
			throws UnsupportedEncodingException {
		StringBuilder st = new StringBuilder();
		
		if (coockie == null) { // 만들어둔 쿠키가 없을 경우 
			String encode_product = URLEncoder.encode(product, "UTF-8");

			st.append("[");
			st.append(encode_product);
			st.append("]");

			String cookieValue = st.toString();

			Cookie cookie = new Cookie("recent_product", cookieValue);
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/product/");
			response.addCookie(cookie);
			
		} else { // 만들어둔 쿠키가 있을 경우
			// 기존 쿠키를 디코딩해서 값을 가져옴 -> [ {객체} ' {객체} ' {객체} ]
			String decode_product = URLDecoder.decode(coockie.getValue(), "UTF-8");
			
			// [] 배열로 감싸져 있는 값을 꺼냄 -> {객체} ' {객체} ' {객체}
			String cookieValue = decode_product.substring(1, decode_product.length() - 1);

			// ' 구분자로 나눠서 배열로 저장 ->  [0] = {객체} . . .
			String[] cookieArray = cookieValue.split("'");
			
			boolean exist = true;			
			// 기존 쿠키값에 존재하는지 검사
			for(String cookie : cookieArray) {
				if( cookie.equals(product) )
					exist = false;
			}
			
			st.append("[");
			if(exist) // 기존 쿠키값에 존재하지 않을 경우에만 추가
				st.append(product + "'"); // 클릭해서 들어온 상품을 맨 앞으로 넣어줌 -> [ {클릭한상품 객체} ' 
				
			for(int i=0; i<cookieArray.length; i++) {
				if (i == cookieArray.length-1) {
					st.append(cookieArray[i]); // 마지막 쿠키값 인 경우 닫아줌 -> [ {클릭한상품 객체} ' {기존 쿠키객체} ' {기존 쿠키객체} ]
					st.append("]");
				}else {
					st.append(cookieArray[i]+"'"); // 기존 쿠키값을 넣어줌 -> [ {클릭한상품 객체} ' {기존 쿠키객체} '
				}
			}
			
			// 클릭한 상품과 기존 쿠키값을 합친 뒤 인코딩해서 쿠키에 저장해준뒤 내려주기
			cookieValue = URLEncoder.encode(st.toString(), "UTF-8");
			Cookie cookie = new Cookie("recent_product", cookieValue);
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/product/"); 
			response.addCookie(cookie);
		}
	}
	
	@PostMapping("/recentRemoveAll")
	public void recentRemoveAll(@CookieValue(value = "recent_product", required = false) Cookie cookie, HttpServletResponse response) {
		log.info("쿠키 전부 삭제 요청");
		
		if(cookie != null) { // 쿠키가 존재할 경우 값을 모두 삭제
			cookie.setValue("");
			cookie.setMaxAge(0);
			cookie.setPath("/product/");
			response.addCookie(cookie);
		}
	}
	
	@PostMapping("/recentRemove")
	public void recentRemove(@CookieValue(value = "recent_product", required = false) Cookie cookie, @RequestBody String product, HttpServletResponse response) throws UnsupportedEncodingException {
		System.out.println("개별 삭제 요청 ====>"+product);
		
		if(cookie != null) {// 쿠기가 존재할 경우에만 삭제
			StringBuilder st = new StringBuilder();
			
			// 기존 쿠키를 디코딩해서 값을 가져옴 -> [ {객체} ' {객체} ' {객체} ]
			String decode_product = URLDecoder.decode(cookie.getValue(), "UTF-8");
			
			// [] 배열로 감싸져 있는 값을 꺼냄 -> {객체} ' {객체} ' {객체}
			String cookieValue = decode_product.substring(1, decode_product.length() - 1);

			// ' 구분자로 나눠서 배열로 저장 ->  [0] = {객체} . . .
			String[] cookieArray = cookieValue.split("'");
				
			st.append("[");
			// 삭제할 값만 제외하고 다시 담아줌
			for(int i=0; i<cookieArray.length; i++) {
				if( !cookieArray[i].equals(product) ){
					if (i == cookieArray.length-1) {
						System.out.println(cookieArray[i]);
						st.append(cookieArray[i]); // 마지막 쿠키값 인 경우 닫아줌 -> [ {클릭한상품 객체} ' {기존 쿠키객체} ' {기존 쿠키객체} ]
						st.append("]");
					}else {
						System.out.println(cookieArray[i]);
						st.append(cookieArray[i]+"'"); // 기존 쿠키값을 넣어줌 -> [ {클릭한상품 객체} ' {기존 쿠키객체} '
					}
				}
			}
			
			// 클릭한 상품과 기존 쿠키값을 합친 뒤 인코딩해서 쿠키에 저장해준뒤 내려
			cookieValue = URLEncoder.encode(st.toString(), "UTF-8");
			cookie.setValue(cookieValue);
			cookie.setPath("/product/"); 
			response.addCookie(cookie);
		}
	}
}

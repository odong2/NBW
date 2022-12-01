package com.finalpj.nbw.cart.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalpj.nbw.cart.service.CartService;
import com.finalpj.nbw.member.domain.Member;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/cart/")
public class CartController {
	
	private CartService cartService;
	/* 단일 생성자의 경우 @Autowired 생략 가능 */
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}
	
	/***************** [[ 회원인지 비회원이지 체크해주는 메소드 ]] *****************/
	@PostMapping("check")
	@ResponseBody
	public String checkMember(HttpSession session, HttpServletRequest req) {
		log.info("컨트롤러의 checkMember 호출");
		String result = "";
		if(session.getAttribute("member") != null) { // 회원
			result = "member";
		} else { // 비회원
			result = "nonMember";
		}
		log.info(result);
		return result;
	}
	
	/***************** [[ 장바구니 페이지 ]] *****************/
	@GetMapping("list")
	public String cartList(HttpSession session, Model model) {
		// 현재 접속한 회원 정보가져오기
		Member member = (Member) session.getAttribute("member");
		// 회원 비회원 분리
		if(member != null) { // 회원일 경우
			String id = member.getMem_id();
			List<Map<String,Object>> cartList = cartService.getCartList(id);
			model.addAttribute("cartList", cartList);
		}
		return "/cart/cartPage";
	}
	
	/***************** [[ 회원 장바구니에 상품 추가 ]] *****************/
	/** ajax로 보낼 결과
	 * "fail": 등록 실패
	 * "addCart": 등록 성공
	 * "modifyCart": 등록된 데이터 존재
	 * "unmem": 비회원
	 */
	@PostMapping("add")
	@ResponseBody
	public String cartAdd(HttpSession session, int p_no, int cart_count) {
		log.info("컨트롤러에서 cartAdd호출");
		String msg = "";
		
		// 현재 접속한 회원 정보가져오기
		Member member = (Member) session.getAttribute("member");		

		String id = member.getMem_id();
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("p_no", p_no);
		pMap.put("cart_count", cart_count);
		pMap.put("mem_id", id);
		// 장바구니 담을 결과
		msg = cartService.cartAdd(pMap);
		return msg;
	}
	
	/***************** [[ 비회원 장바구니에 상품 추가 ]] *****************/
	@PostMapping("unmemAdd")
	@ResponseBody
	public String unmemAdd(@CookieValue(value = "cart", required = false) Cookie ck , @RequestBody String cookie, HttpServletRequest req, HttpServletResponse res)
			throws UnsupportedEncodingException{
		log.info(req.getCookies());
		log.info(cookie);
		String msg = "";
		if(ck == null) { // cart 쿠키가 없을 경우
			String cartValue = cookie.substring(8, cookie.length() -1);
			String enc_cart = URLEncoder.encode(cartValue, "UTF-8");
			// 쿠키 생성
			Cookie cart = new Cookie("cart", enc_cart);
			cart.setMaxAge(60*60*24); // 24시간
	    	cart.setPath("/"); // 전체 브라우저에 쿠키 설정
	    	res.addCookie(cart); 
	    	msg = "success";
		} else { // cart 쿠키가 있을 경우
			String enc_cart = URLEncoder.encode(cookie, "UTF-8");
			Cookie cart = new Cookie("cart", enc_cart);
			cart.setMaxAge(60*60*24); // 24시간
			cart.setPath("/"); // 전체 브라우저에 쿠키 설정
			res.addCookie(cart); 
			msg = "success";
		}
		return msg;
	}
	
	/***************** [[ 회원 장바구니에 상품 수량변경 ]] *****************/
	@PostMapping("modify")
	@ResponseBody
	public int cartModify(HttpSession session, @RequestParam("p_no") String p_no, 
							@RequestParam("cart_count") int cart_count,@RequestParam("btn") String btn) {
		log.info("컨트롤러에서 cartModify호출");
		int count = 0;

		// 현재 접속한 회원 정보가져오기
		Member member = (Member) session.getAttribute("member");		
		
		if(member != null) { // 회원인 경우
			String id = member.getMem_id();
			log.info("btn: "+btn);
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("btn", btn);
			pMap.put("p_no", p_no);
			pMap.put("mem_id", id);
			// 장바구니 수량 ajax로 전달
			count = cartService.modifyCart(pMap);
			log.info(count);
		}
		return count;
	}
	
	/***************** [[ 비회원 장바구니에 상품 수량변경 ]] *****************/
	@PostMapping("unmemModify")
	@ResponseBody
	public String unmemModify(@RequestBody String carts, HttpServletRequest req, HttpServletResponse res) {
		String msg = "";
		Cookie[] cookies = req.getCookies();
		for(Cookie ck : cookies) {
			if(ck.getName().equals("cart")) { // 장바구니 쿠키가 있을 때 (비회원 장바구니에 값이 하나라도 있을 경우)
				String enc_carts = "";
				try {
					enc_carts = URLEncoder.encode(carts, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				Cookie cart = new Cookie("cart", enc_carts);
				cart.setMaxAge(60*60*24); // 24시간
				cart.setPath("/"); // 전체 브라우저에 쿠키 설정
				res.addCookie(cart);
				msg = "success";
			}
		}
		return msg;
	}

	/***************** [[ 회원 장바구니에 상품 삭제 ]] *****************/
	@PostMapping("remove")
	public String cartRemove(HttpSession session, @RequestParam("p_no") String p_no) {
		log.info("컨트롤러에서 cartRemove호출");
		// 현재 접속한 회원 정보가져오기
		Member member = (Member) session.getAttribute("member");

		if (member != null) { // 회원인 경우
			String id = member.getMem_id();
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("p_no", p_no);
			pMap.put("mem_id", id);
			
			cartService.removeProduct(pMap);
		} 
		return "redirect:/cart/list";
	}
	
	/***************** [[ 비회원 장바구니에 상품 수량변경 ]] *****************/
	@PostMapping("unmemRemove")
	@ResponseBody
	public String unmemRemove(@RequestBody String carts, HttpServletRequest req, HttpServletResponse res) {
		String msg = "";
		Cookie[] cookies = req.getCookies();
		for(Cookie ck : cookies) {
			if(ck.getName().equals("cart")) { // 장바구니 쿠키가 있을 때 (비회원 장바구니에 값이 하나라도 있을 경우)
				String enc_carts = "";
				try {
					enc_carts = URLEncoder.encode(carts, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				Cookie cart = new Cookie("cart", enc_carts);
				cart.setMaxAge(60*60*24); // 24시간
				cart.setPath("/"); // 전체 브라우저에 쿠키 설정
				res.addCookie(cart);
				msg = "success";
			}
		}
		return msg;
	}
	
}

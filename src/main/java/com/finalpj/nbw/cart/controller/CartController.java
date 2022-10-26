package com.finalpj.nbw.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalpj.nbw.cart.service.CartService;
import com.finalpj.nbw.member.domain.Member;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	private CartService cartService;
	/* 단일 생성자의 경우 @Autowired 생략 가능 */
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}
	
	/***************** [[ 장바구니 페이지 ]] *****************/
	@GetMapping("list")
	public String cartList( HttpServletRequest req, HttpSession session, Model model) {
//		Member member = (Member) session.getAttribute("member");
//		String id = member.getMem_id();
		session.setAttribute("mem_id", "yuri");
		String id = (String)session.getAttribute("mem_id");
		List<Map<String,Object>> cartList = cartService.getCartList(id);
		model.addAttribute("cartList", cartList);
		return "/cart/cartPage";
	}
	
	/***************** [[ 장바구니에 상품 추가 ]] *****************/
	/** 장바구니 담을 결과
	 * 0: 등록 실패
	 * 1: 등록 성공
	 * 2: 등록된 데이터 존재
	 * 5: 비회원
	 */
	@PostMapping("add")
	@ResponseBody
	public String cartAdd(HttpServletRequest req, HttpSession session, @RequestParam("p_no") int p_no,@RequestParam("cart_count") int cart_count) {
		log.info(p_no);
		log.info(cart_count);
		log.info("컨트롤러에서 cartAdd호출");
		// 회원인지 비회원인지 체크해주기 - 우선은 회원인 경우만 - 비회원은 추후 추가
		
		//테스트용
		session.setAttribute("mem_id", "yuri");
		String id = (String)session.getAttribute("mem_id");
		
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("p_no", p_no);
		pMap.put("cart_count", cart_count);
		pMap.put("mem_id", id);
		// 장바구니 담을 결과
		int result = 0;
		// 장바구니에 이미 담겨있는 상품인지 확인한다
		result = cartService.checkCart(pMap);
		log.info(result);

		if(result == 1){ // 카트에 상품이 없는 경우
			log.info("result가 1일경우 컨트롤러에서 여기를 타야함");
			result = cartService.addCart(pMap);
			if(result == 1) {
				result = 1;
			}
			return result+"";
		}else if(result == 2) {// 카트에 상품이 존재하는 경우
			log.info("result가 2일경우 컨트롤러에서 여기를 타야함");
			result = cartService.modifyCart(pMap);
			if(result == 1) {
				result = 2;
			}
			return result+"";
		}else {
			log.info(result);
			return result+"";
		}
	}
	
	/***************** [[ 장바구니에 상품 수량변경 ]] *****************/
	@PostMapping("modify")
	public String cartModify() {
		return "/cart/";
	}

	/***************** [[ 장바구니에 상품 삭제 ]] *****************/
	@PostMapping("remove")
	public String cartRemove() {
		return "/cart/";
	}
	
}

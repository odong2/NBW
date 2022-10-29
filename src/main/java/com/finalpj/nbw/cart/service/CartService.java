package com.finalpj.nbw.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalpj.nbw.cart.dao.CartDao;
import com.finalpj.nbw.cart.domain.Cart;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartService {
	
	private CartDao cartDao;
	
	public CartService(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	
	/* [[ 회원의 장바구니 전체 목록가져오기 ]] */
	public List<Map<String, Object>> getCartList(String id) {
		log.info("서비스의 getCartList호출");
		List<Map<String,Object>> cartList;
		cartList = cartDao.selectCartList(id);
		return cartList;
	}

	/* [[ 상품 장바구니 등록하기 ]] */
	public String cartAdd(Map<String, Object> pMap) {
		String msg = "";
		// Dao에서 결과 담아올 변수
		int result = 0;
		try {
			// 회원 장바구니에 이미 존재하는지 확인하기
			result = cartDao.selectProductList(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		/** selectProductList로 받아온 결과
		 * 1: 장바구니에 존재하지 않을 경우
		 * 2: 장바구니에 존재하는 경우
		 */
		// msg 설정해줄 값 담을 변수
		int result2 = 0;
		if(result == 1) {
			// 상품이 존재하지 않으므로 insert해준다
			result2 = cartDao.insertCart(pMap);
			if(result2 == 1) {
				msg = "addCart";
			}
		} else if(result == 2) {
			// 상품이 존재하므로 수량 update 해준다
			result2 = cartDao.updateCart(pMap);
			if(result2 == 1) {
				msg = "modifyCart";
			}
		}
		return msg;
	}
	
	/* [[ 회원 장바구니 수량 변겅하기]] */
	public int modifyCart(Map<String, Object> pMap) {
		log.info("서비스의 modifyCart호출");
		// update결과 담을 result
		int result = 0;
		result = cartDao.updateCart(pMap);
		
		// 장바구니 수량 담아갈 변수
		int cart_count = 0;
		if(result == 1) {
			cart_count = cartDao.selectCount(pMap);
		}
		return cart_count;
	}

	/* [[ 장바구니 삭제하기 ]] */
	public void removeProduct(Map<String, Object> pMap) {
		cartDao.deleteCart(pMap);
	}

	
}

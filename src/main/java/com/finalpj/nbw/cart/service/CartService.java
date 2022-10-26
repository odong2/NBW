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
//	@Transactional
	public List<Map<String, Object>> getCartList(String id) {
		log.info("서비스의 getCartList호출");
		List<Map<String,Object>> cartList;
		cartList = cartDao.selectCartList(id);
		return cartList;
	}

	/* [[ 회원 장바구니에 이미 존재하는지 확인하기 ]] */
//	@Transactional
	public int checkCart(Map<String, Object> pMap) {
		log.info("서비스의 checkCart호출");
		int result = 0;
		try {
			result = cartDao.selectProductList(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* [[ 회원 장바구니 추가하기 ]] */
//	@Transactional
	public int addCart(Map<String, Object> pMap) {
		log.info("서비스의 addCart호출");
		int result = 0;
		result = cartDao.insertCart(pMap);
		return result;
	}
	public int modifyCart(Map<String, Object> pMap) {
		log.info("서비스의 modifyCart호출");
		int result = 0;
		result = cartDao.updateCart(pMap);
		return result;
	}
	
	
	
}

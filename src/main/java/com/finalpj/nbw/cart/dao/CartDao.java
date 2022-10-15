package com.finalpj.nbw.cart.dao;

import java.util.List;

import com.finalpj.nbw.cart.domain.Cart;
import com.finalpj.nbw.product.domain.Product;

public interface CartDao {
	
	List<Cart> selectCartList(String mem_id); // 회원의 장바구니 목록조회
	
	int insertCart(Product productVO); // 장바구니에 상품추가
	
	int updateCart(Product productVO); // 장바구니 수량변경
	
	int deleteCart(Product productVO); // 장바구니 상품삭제
}

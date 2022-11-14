package com.finalpj.nbw.cart.dao;

import java.util.List;
import java.util.Map;

import com.finalpj.nbw.cart.domain.Cart;
import com.finalpj.nbw.payment.domain.Payment;
import com.finalpj.nbw.product.domain.Product;

public interface CartDao {
	
	List<Map<String, Object>> selectCartList(String mem_id); // 회원의 장바구니 목록조회
	
	int selectProductList(Map<String, Object> pMap) throws Exception; // 카트에 상품이 존재하는지 조회

	int insertCart(Map<String, Object> pMap); // 장바구니에 상품추가

	int updateCart(Map<String, Object> pMap); // 장바구니 수량변경

	void deleteCart(Map<String, Object> pMap); // 장바구니 상품삭제

	int deleteAfterPayCart(Payment paymentDto) throws Exception; // 결제후 장바구니 삭제
	
	int selectCount(Map<String,Object> pMap); // 장바구니 상품 수량
}

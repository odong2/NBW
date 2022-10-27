package com.finalpj.nbw.cart.dao;

import java.util.List;
import java.util.Map;

import com.finalpj.nbw.cart.domain.Cart;
import com.finalpj.nbw.product.domain.Product;

public interface CartDao {
	
	List<Map<String, Object>> selectCartList(String mem_id); // 회원의 장바구니 목록조회
	
	boolean selectProductList(String mem_id, Product productVO) throws Exception; // 장바구니에 상품이 있는지 확인
	
	int insertCart(Product productVO) throws Exception; // 장바구니에 상품추가
	
	int updateCart(Product productVO) throws Exception; // 장바구니 수량변경
	
	int deleteCart(Product productVO) throws Exception; // 장바구니 상품삭제

	int selectProductList(Map<String, Object> pMap) throws Exception;

	int insertCart(Map<String, Object> pMap);

	int updateCart(Map<String, Object> pMap);

	void deleteCart(Map<String, Object> pMap);
}

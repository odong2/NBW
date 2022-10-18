package com.finalpj.nbw.cart.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalpj.nbw.cart.dao.CartDao;
import com.finalpj.nbw.cart.domain.Cart;
import com.finalpj.nbw.product.domain.Product;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
    private SqlSession sqlSession;
	
	@Override
	public List<Cart> selectCartList(String mem_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertCart(Product productVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCart(Product productVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCart(Product productVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}

package com.finalpj.nbw.product.repository;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalpj.nbw.product.dao.ProductDao;
import com.finalpj.nbw.product.domain.Product;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Product getProduct(String number) {
		Product product = null;
		product = sqlSessionTemplate.selectOne("getProduct",number);
		return product;
	}

	@Override
	public List<Product> selectProductByWord(String key) throws Exception {
		List<Product> productList = new ArrayList<>();
		productList = sqlSession.selectList("selectProductByWord", key);
		return productList;
	}
}

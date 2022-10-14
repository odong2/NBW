package com.finalpj.nbw.product.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalpj.nbw.product.dao.ProductDao;
import com.finalpj.nbw.product.domain.Product;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Product getProduct(String number) {
		Product product = null;
		product = sqlSessionTemplate.selectOne("getProduct",number);
		return product;
	}
}

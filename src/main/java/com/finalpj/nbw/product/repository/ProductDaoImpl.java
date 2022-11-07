package com.finalpj.nbw.product.repository;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalpj.nbw.product.dao.ProductDao;
import com.finalpj.nbw.product.domain.Product;
import com.finalpj.nbw.product.domain.Review;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class ProductDaoImpl implements ProductDao{

	private SqlSession sqlSession;
	
    public ProductDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
	
	@Override
	public Product getProduct(String number) {
		return sqlSession.selectOne("getProduct",number);
	}

	@Override
	public List<Product> selectProductByWord(String key) throws Exception {
		List<Product> productList = new ArrayList<>();
		productList = sqlSession.selectList("selectProductByWord", key);
		return productList;
	}

	@Override
	public void updateLike(Map<String, Object> map) {
		sqlSession.update("updateLike",map);
	}

	@Override
	public void reviewCountUpdate(Review review) {
		sqlSession.update("reviewCountUpdate", review);
	}

	@Override
	public void reviewInsert(Review review) {
		sqlSession.insert("reviewInsert", review);
	}
}

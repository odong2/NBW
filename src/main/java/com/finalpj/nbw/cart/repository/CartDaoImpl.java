package com.finalpj.nbw.cart.repository;

import java.util.List;
import java.util.Map;

import com.finalpj.nbw.payment.domain.Payment;
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

    private SqlSession sqlSession;
	
    private final String namespace = "com.finalpj.nbw.cart.dao.CartMapper.";
    
	public CartDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
	/* [[ 전체 카트 목록 조회 ]] */
	@Override
	public List<Map<String, Object>> selectCartList(String mem_id) {
		log.info("Dao에서 selectCartList호출");
		List<Map<String,Object>> cartVO = null;
		cartVO = sqlSession.selectList(namespace+"selectCartList", mem_id);
		return cartVO;
	}
	/* [[ 카트에 상품이 존재하는지 조회 ]] */
	@Override
	public int selectProductList(Map<String,Object> pMap) throws Exception {
		log.info("Dao에서 selectProductList호출");
		int result = 0;
		result = sqlSession.selectOne(namespace+"selectProductList", pMap);
		return result;
	}
	/* [[ 카트에 상품 추가 ]] */
	@Override
	public int insertCart(Map<String, Object> pMap) {
		log.info("Dao에서 insertCart호출");
		int result = 0;
		result = sqlSession.insert(namespace+"insertCart", pMap);
		return result;
	}
	
	/* [[ 상품수량 가져오기 ]] */
	@Override
	public int selectCount(Map<String,Object> pMap) {
		log.info("Dao에서 selectCount 호출");
		int cart_count = 0;
		cart_count = sqlSession.selectOne(namespace+"selectCount", pMap);
		return cart_count;
	}
	
	
	/* [[ 상품 수량 변경 ]] */
	@Override
	public int updateCart(Map<String, Object> pMap) {
		log.info("Dao에서 updateCart호출");
		int result = 0;
		result = sqlSession.update(namespace+"updateCart", pMap);
		return result;
	}
	
	/* [[ 상품 삭제 ]] */
	@Override
	public void deleteCart(Map<String, Object> pMap) {
		log.info("Dao에서 deleteCart호출");
		sqlSession.delete(namespace+"deleteCart",pMap);
	}

	@Override
	public int deleteAfterPayCart(Payment paymentDto) throws Exception {
		return sqlSession.delete(namespace + "deleteAfterPayCart", paymentDto);
	}

}

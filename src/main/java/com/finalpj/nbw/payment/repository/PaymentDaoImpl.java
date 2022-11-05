package com.finalpj.nbw.payment.repository;

import com.finalpj.nbw.payment.dao.PaymentDao;
import com.finalpj.nbw.payment.domain.CartProduct;
import com.finalpj.nbw.payment.domain.Payment;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Log4j
@Repository
public class PaymentDaoImpl implements PaymentDao {
    private final SqlSession sqlSession;
    private final String namespace="com.finalpj.nbw.payment.dao.PaymentMapper.";
    public PaymentDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

    @Override
    public int insertMemPayment(Payment paymentDto) throws Exception {
        return sqlSession.insert(namespace + "insertMemPayment", paymentDto);

    }

    /****************************** 주문 상세내역 등록 *********************************/
    @Override
    public int insertMemPayDetail(List<Map<String,Object>> payDetailList) throws Exception {
         return sqlSession.insert(namespace + "insertMemPayDetail", payDetailList);
    }

    /**************************** 결제 후 주문 상품 상세내역 조회 ************************************/
    @Override
    public List<CartProduct> selectPayAfter(String order_no) throws Exception {
        List<CartProduct> productList = null;
        productList =  sqlSession.selectList(namespace + "selectPayAfter", order_no);
        return productList;
    }
    /**************************** 결제 후 수령인 상세내역 및 결제금액 조회  ************************************/
    @Override
    public Map<String, Object> selectReceiver(String order_no) throws Exception {
        return sqlSession.selectOne(namespace + "selectReceiver", order_no);
    }
}

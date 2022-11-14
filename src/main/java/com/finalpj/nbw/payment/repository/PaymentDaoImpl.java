package com.finalpj.nbw.payment.repository;

import com.finalpj.nbw.payment.dao.PaymentDao;
import com.finalpj.nbw.payment.domain.AdminPayment;
import com.finalpj.nbw.payment.domain.CartProduct;
import com.finalpj.nbw.payment.domain.OrderList;
import com.finalpj.nbw.payment.domain.Payment;
import com.finalpj.nbw.payment.domain.UnMemPayment;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
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

    /****************************** (1) 결제 성공시 결제테이블에 insert(비회원) *************************/
    @Override
    public int insertUnMemPayment(UnMemPayment unMemPaymentDto) throws Exception {
        return sqlSession.insert(namespace + "insertUnMemPayment",unMemPaymentDto);
    }
    /****************************** (1) 결제 성공시 결제테이블에 insert(회원) *************************/
    @Override
    public int insertMemPayment(Payment paymentDto) throws Exception {
        return sqlSession.insert(namespace + "insertMemPayment", paymentDto);

    }

    /******************  (2) 결제 테이블에 insert 후 주문 상품에 관해 다중 insert *********************/
    @Override
    public int insertPayDetail(List<Map<String,Object>> payDetailList) throws Exception {
        return sqlSession.insert(namespace + "insertPayDetail", payDetailList);
    }


    /****************************** 결제 후 주문 상품 상세내역 조회 ************************************/
    @Override
    public List<CartProduct> selectPayAfter(Map pMap) throws Exception {
        List<CartProduct> productList = null;
        productList =  sqlSession.selectList(namespace + "selectPayAfter", pMap);
        return productList;
    }

    /**************************** 결제 후 수령인 상세내역 및 결제금액 조회 (회원) ************************************/
    @Override
    public Map<String, Object> selectReceiver(String order_no) throws Exception {
        return sqlSession.selectOne(namespace + "selectReceiver", order_no);
    }

    /**************************** 결제 후 수령인 상세내역 및 결제금액 조회 (비회원) ************************************/
    @Override
    public Map<String, Object> selectUnMemReceiver(String order_no) throws Exception {
        return sqlSession.selectOne(namespace + "selectUnMemReceiver", order_no);
    }

    @Override
    public List<OrderList> selectMemOrderList(String mem_id) throws Exception {
        return sqlSession.selectList(namespace + "selectMemOrderList" , mem_id);
    }


    /**************************** 주문 상태 변경 <취소, 반품, 구매확정, 배송중></취소,> (회원) ************************************/
    @Override
    public int updateOrderStatus(Map<String, Object> pMap) throws Exception {
        return sqlSession.update(namespace + "updateOrderStatus",pMap);
    }
    /******************************** 주문 조회 페이지 상품상태 개수 조회 쿼리문 *********************************/
    @Override
    public Map<String, Integer> selectMemStatusCnt(String mem_id) throws Exception {
        return sqlSession.selectOne(namespace + "selectStatusCnt", mem_id);
    }

    @Override
    public String selectUnMemOrder(Map pMap) throws Exception {
        return sqlSession.selectOne(namespace + "selectUnMemOrder", pMap);
    }

    /******************************** 관리자페이지에서 주문한 상품 조건에 맞게 조회 *********************************/
	@Override
	public List<AdminPayment> selectAdminPayment(Map<String, Object> pMap) throws Exception {
		return sqlSession.selectList(namespace+"selectAdminPayment", pMap);
	}
}

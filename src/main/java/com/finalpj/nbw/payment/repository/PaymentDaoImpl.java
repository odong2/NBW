package com.finalpj.nbw.payment.repository;

import com.finalpj.nbw.payment.dao.PaymentDao;
import com.finalpj.nbw.payment.domain.Payment;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Log4j
@Repository
public class PaymentDaoImpl implements PaymentDao {
    private final SqlSession sqlSession;

    public PaymentDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

    @Override
    public int insertMemPayment(Payment paymentDto) throws Exception {
        return 0;
    }

    @Override
    public int insertMemPayDetail(Payment paymentDto) throws Exception {
        return 0;
    }
}

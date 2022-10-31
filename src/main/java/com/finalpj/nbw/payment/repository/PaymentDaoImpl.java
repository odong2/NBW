package com.finalpj.nbw.payment.repository;

import com.finalpj.nbw.payment.dao.PaymentDao;
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

}

package com.finalpj.nbw.payment.repository;

import com.finalpj.nbw.payment.dao.RefundDao;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Log4j
public class RefundDaoImpl implements RefundDao {
    private final SqlSession sqlSession;
    private final String namespace="com.finalpj.nbw.payment.dao.RefundDao.";
    public RefundDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

    @Override
    public int insertRefundOrder(Map<String, Object> pMap) throws Exception {
        return sqlSession.insert(namespace + "insertRefundOrder", pMap);
    }
}

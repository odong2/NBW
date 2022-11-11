package com.finalpj.nbw.payment.repository;

import com.finalpj.nbw.payment.dao.RefundDao;
import com.finalpj.nbw.payment.domain.Refund;

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

    /* 반품 정보 상세 조회 */
	@Override
	public Refund selectRefundInfo(Map<String, Object> pMap) throws Exception {
		return sqlSession.selectOne(namespace+"selectRefundInfo", pMap);
	}

	/* 반품 상태 변경 (반품 승인, 반품 거절) */
	@Override
	public int updateRefundOrder(Map<String,Object> pMap) throws Exception {
		return sqlSession.update(namespace+"updateRefundOrder", pMap);
	}
}

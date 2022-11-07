package com.finalpj.nbw.coupon.repository;

import com.finalpj.nbw.coupon.dao.CouponDao;
import com.finalpj.nbw.coupon.domain.Coupon;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Log4j
public class CouponDaoImpl implements CouponDao {
    private final SqlSession sqlSession;
    private final String namespace="com.finalpj.nbw.coupon.dao.CouponMapper.";
    public CouponDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

    /********************** 회원 쿠폰여부 조회 ***********************/
    @Override
    public int selectIsCoupon(String mem_id) throws Exception{
        return sqlSession.selectOne(namespace+"selectIsCoupon", mem_id);
    }

    /************************ 보유쿠폰 정보 가져오기 ***********************/
    public List<Coupon> selectCouponList(String mem_id) {
        log.info("OrderDao ===> getCouponList 호출");
        List<Coupon> couponList = null;
        couponList = sqlSession.selectList(namespace+"selectCouponList", mem_id);
        log.info("조회된 couponList " + couponList);
        return couponList;
    }

    @Override
    public int deleteMemCoupon(Map pMap) throws Exception {
        return sqlSession.delete(namespace + "deleteMemCoupon", pMap);
    }
}

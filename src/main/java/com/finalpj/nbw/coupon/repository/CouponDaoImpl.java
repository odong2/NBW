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

    /************************* 회원 쿠폰여부 조회 ***********************/
    @Override
    public int selectIsCoupon(String mem_id) throws Exception{
        return sqlSession.selectOne(namespace+"selectIsCoupon", mem_id);
    }
    /************************** 모든 쿠폰 조회 ****************************/
    @Override
    public List<Coupon> selectAllCoupon() throws Exception {
        return sqlSession.selectList(namespace + "selectAllCoupon");
    }
    /****************** 회원이 쿠폰 다운로드 받았는지 체크 *********************/
    @Override
    public String selectDownloadedCoupon(Map pMap) throws Exception {
        return  sqlSession.selectOne(namespace + "selectDownloadedCoupon", pMap);
    }

    /*********************** 다운로드 가능한 쿠폰 조회 **************************/
    @Override
    public List<Coupon> selectPublicCoupon() throws Exception {
        return sqlSession.selectList(namespace + "selectPublicCoupon");
    }

    /****************** 보유쿠폰 정보 가져오기(로그인한 회원이 보유한 쿠폰리스트) ******************/
    public List<Coupon> selectCouponList(String mem_id) {
        log.info("OrderDao ===> getCouponList 호출");
        List<Coupon> couponList = null;
        couponList = sqlSession.selectList(namespace+"selectCouponList", mem_id);
        log.info("조회된 couponList " + couponList);
        return couponList;
    }
    /********************** 다운로드 가능한 쿠폰 조회(마이페이지 쿠폰에서 사용) ***********************/
    @Override
    public List<Coupon> selectMemPublicCoupon(String mem_id) throws Exception {
        return sqlSession.selectList(namespace + "selectMemPublicCoupon", mem_id);
    }

    /************************ 보유쿠폰 삭제(관리자) ***********************/
    @Override
    public int deleteMemCoupon(Map pMap) throws Exception {
        return sqlSession.delete(namespace + "deleteMemCoupon", pMap);
    }

    /************************* 쿠폰 생성(관리자) ****************************/
    @Override
    public int insertCoupon(Coupon couponDto) throws Exception {
        return sqlSession.insert(namespace + "insertCoupon", couponDto);
    }
    /*************************** 회원 쿠폰 등록 *****************************/
    @Override
    public int insertMemCoupon(Map pMap) throws Exception {
        return sqlSession.insert(namespace + "insertMemCoupon",pMap);
    }

    /************************** *************************/
    @Override
    public int insertDownloadCoupon(Map pMap) throws Exception {
        return sqlSession.insert(namespace + "insertDownloadCoupon", pMap);
    }

    @Override
    public int deleteCoupon(String cp_no) throws Exception {
        return sqlSession.delete(namespace + "deleteCoupon", cp_no);
    }
}

package com.finalpj.nbw.coupon.dao;

import com.finalpj.nbw.coupon.domain.Coupon;
import com.finalpj.nbw.notice.domain.Notice;

import java.util.List;
import java.util.Map;

public interface CouponDao {

    int selectIsCoupon(String mem_id) throws Exception; // 쿠폰 존재 여부
    List<Coupon> selectAllCoupon() throws Exception; // 모든 쿠폰 조회

    String selectDownloadedCoupon(Map pMap) throws Exception; // 회원이 해당 쿠폰을 다운로드 받았는지 체크
    List<Coupon> selectPublicCoupon() throws Exception; // 다운로드 가능한 쿠폰 조회 == > 이후 위의 쿼리문이랑 합칠 것
    List<Coupon> selectCouponList(String mem_id) throws Exception; // 멤버 쿠폰 가져오기
    List<Coupon> selectMemPublicCoupon(String mem_id) throws Exception; // 회원의 다운로드 가능한 쿠폰 조회
    int deleteMemCoupon(Map pMap) throws Exception; // 멤버 쿠폰 삭제(결제시 사용하였을 경우)
    int insertCoupon(Coupon couponDto) throws Exception; // 쿠폰 등록
    int insertMemCoupon(Map pMap) throws Exception; // 회원 쿠폰 등록(쿠폰 다운로드 후 해당 쿼리문 실행하여 tb_couponzip에 등록)
    int insertDownloadCoupon(Map pMap) throws Exception; // 쿠폰 다운로드
    int deleteCoupon(String cp_no) throws Exception; // 쿠폰 삭제(관리자)
    
}

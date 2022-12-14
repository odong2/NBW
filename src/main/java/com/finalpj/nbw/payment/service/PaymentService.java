package com.finalpj.nbw.payment.service;

import com.finalpj.nbw.cart.dao.CartDao;
import com.finalpj.nbw.cart.domain.Cart;
import com.finalpj.nbw.coupon.dao.CouponDao;
import com.finalpj.nbw.coupon.domain.Coupon;
import com.finalpj.nbw.member.dao.MemberDao;
import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.payment.dao.PaymentDao;
import com.finalpj.nbw.payment.dao.RefundDao;
import com.finalpj.nbw.payment.domain.*;
import com.finalpj.nbw.product.dao.ProductDao;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Service
public class PaymentService {

    private final PaymentDao paymentDao;
    private final CouponDao couponDao;
    private final ProductDao productDao;
    private final MemberDao memberDao;
    private final RefundDao refundDao;
    private final CartDao cartDao;

    public PaymentService(PaymentDao paymentDao, CouponDao couponDao, ProductDao productDao, MemberDao memberDao, RefundDao refundDao, CartDao cartDao){
        this.paymentDao = paymentDao;
        this.couponDao = couponDao;
        this.productDao= productDao;
        this.memberDao = memberDao;
        this.refundDao = refundDao;
        this.cartDao = cartDao;
    }
    /************************ 결제하기 (비회원) ****************************/
    @Transactional(rollbackFor = Exception.class)
    public void unMemPay(UnMemPayment unMemPaymentDto) throws Exception{
        Object tableName = "tb_unmempaymentdetail";
        Map<String,Object> pMap = null;
        // (1) 비회원 결제 테이블 insert
        paymentDao.insertUnMemPayment(unMemPaymentDto);
        // (2) 상품의 정보 데이터를 List 형태로 반환
        List<Map<String,Object>> payDetailList = getProductList(unMemPaymentDto, tableName);
        // (3) 결제 디테일 테이블에 다중 Insert
        paymentDao.insertPayDetail(payDetailList);
        // * (해야할 것)쿠키에 있는 장바구니 삭제
    }

    /**************************  결제하기 (회원)  **************************/
    @Transactional(rollbackFor = Exception.class)
    public void memPay(Payment paymentDto, HttpSession session) throws Exception{
        String cp_no = paymentDto.getCp_no();
        String deliveryMemo = paymentDto.getDelivery_memo();
        int used_point = paymentDto.getUsed_point();
        int mem_point = paymentDto.getMem_point();
//        int pointReserve = paymentDto.getPointReserve();
        String mem_id = paymentDto.getMem_id();
        Object tableName = "tb_mempaymentdetail";
        Map<String,Object> pMap = null;
        // 쿠폰이 '0'이면 null값으로 변환
        if(cp_no.equals("0")){
            paymentDto.setCp_no(null);
        }
        // 배송메모 '0'이면 "배송메모 없음"으로 저장
        if(deliveryMemo.equals("0")){
            paymentDto.setDelivery_memo("배송메모 없음");
        }
        // (1) tb_mempayment 테이블에 삽입
        paymentDao.insertMemPayment(paymentDto);
        
        // (2) 상품의 정보 데이터를 List 형태로 반환
        List<Map<String,Object>> payDetailList = getProductList(paymentDto,tableName);
        // (3) 결제 디테일 테이블에 다중 Insert
        paymentDao.insertPayDetail(payDetailList);

        // (4) 쿠폰 사용 하였을 경우 coupon_zip에서 쿠폰 삭제
        if(cp_no != null){
            pMap = new HashMap<>();
            pMap.put("mem_id", mem_id);
            pMap.put("cp_no", cp_no);
            couponDao.deleteMemCoupon(pMap);
        }
        // (5) point 사용 하였을 경우 point 차감
        if(used_point != 0){
            pMap = new HashMap<>();
            // 기존 포인트 - 사용포인트 + 적립금
            mem_point = mem_point - used_point;
            pMap.put("mem_id", mem_id);
            pMap.put("mem_point", mem_point);
            // db에 mem_point 업데이트
            memberDao.updateMemPoint(pMap);
            // session의 mem_point 업데이트
            Member member = (Member)session.getAttribute("member");
            member.setMem_point(mem_point);
            session.setAttribute("member", member);
        }

        // (6)주문한 상품의 재고 감소
        List<Map<String, Object>> productList = new ArrayList<>();
        Map<String, Object> productMap = null;
        /* 상품 재고 감소. 상풍 반품 및 취소시 sort는 plus 이다. */
        for(int i = 0; i < paymentDto.getP_no().length; i++){
            productMap = new HashMap<>();
            int p_count = paymentDto.getP_count()[i];
            int p_no = paymentDto.getP_no()[i];
            productMap.put("p_count", p_count);
            productMap.put("p_no", p_no);
            productList.add(productMap);
        }

        productDao.updateProductCount(productList);

        // (7) 장바구니에서 제거
        cartDao.deleteAfterPayCart(paymentDto);

    }
    /**************************** 결제 후 주문 상품 상세내역 조회 ************************************/
    public List<CartProduct> afterPaySearchOrder(Map pMap) throws Exception{
        List<CartProduct> productList = null;
        productList = paymentDao.selectPayAfter(pMap);
        return productList;
    }

    /**************************** 결제 후 수령인 상세내역 및 결제금액 조회 (회원) ************************************/
    public Map<String, Object> afterPaySearchReceiver(String order_no) throws Exception{
        Map<String, Object> rMap= null;
        rMap = paymentDao.selectReceiver(order_no);
        return rMap;
    }
    
    /**************************** 결제 후 수령인 상세내역 및 결제금액 조회 (비회원) ************************************/
    public Map<String, Object> selectUnMemReceiver(String order_no) throws Exception{
        Map<String, Object> rMap= null;
        rMap = paymentDao.selectUnMemReceiver(order_no);
        return rMap;
    }

    /************************************** 주문상태 변경 (memPaymentDetail 테이블) *************************************************/
    @Transactional(rollbackFor = Exception.class)
    public String modifyOrderStatus(Map<String, Object> pMap){
        String msg = "";
        String orderStatus = (String)pMap.get("order_status");
        // (1) memPaymentDetail 상품 상태 변경
        try {
            paymentDao.updateOrderStatus(pMap);
            // (2) 상품을 취소한 경우 바로 환불
            if (orderStatus.equals("취소")) {
                // (3) refund_status 활불로 변경(취소의 경우는 바로 환불이 된다)
                pMap.put("refund_status", "환불");
                refundDao.insertRefundOrder(pMap);
                msg = "결제가 취소 되었습니다. 환불 금액은 결제계좌로 입금됩니다.";
            }else if(orderStatus.equals("반품")){
            	pMap.put("refund_status", "반품 신청");
                refundDao.insertRefundOrder(pMap);
                msg = "반품신청이 완료 되었습니다. 환불은 관리자가 확인후 진행됩니다.";
            } else if(orderStatus.equals("상품 준비중")) {
            	pMap.put("order_status", "배송완료");
            	paymentDao.updateOrderStatus(pMap);
            	msg = "배송이 완료되었습니다. 배송 완료된 상품은 전체 주문 내역에서 확인 가능합니다.";
            }
        }catch (Exception e){
            e.printStackTrace();
            if(orderStatus.equals("취소")){
                msg = "결제 취소에 실패하였습니다. 확인 후 다시 시도해 주세요.";
            }else if(orderStatus.equals("반품")){
                msg = "반품신청에 실패하였습니다. 확인 후 다시 시도해 주세요";
            }
        }
        return msg;
    }
    /********************************** 주문리스트 조회(회원) ***********************************/
    public List<OrderList> getMemOrderList(String mem_id) throws Exception{
        return paymentDao.selectMemOrderList(mem_id);
    }
    public Map<String,Integer> getMemStatusCnt(String mem_id)throws Exception{
        return paymentDao.selectMemStatusCnt(mem_id);
    }

    /************************* 결제한 상품 N건 List<Map<String,Object>>형태로 변환 해주는 메서드  ***************************/
    public List<Map<String,Object>> getProductList(Pay paymentDto, Object tableName) throws Exception{
        List<Map<String,Object>> payDetailList = new ArrayList<>();
        for(int i = 0; i < paymentDto.getP_no().length; i++){
            Map pMap = new HashMap<String, Object>();

            String order_no = (String)paymentDto.getOrder_no();
            int p_no = (int)paymentDto.getP_no()[i];
            int p_count = (int)paymentDto.getP_count()[i];
            pMap.put("table", tableName);
            pMap.put("p_no", p_no);
            pMap.put("p_count", p_count);
            pMap.put("order_no", order_no);
            payDetailList.add(pMap);
        }
        return payDetailList;
    }
    /************************************************ 비회원 주문 조회 ***********************************************/
    public String searchUnMemOrder(Map pMap) throws Exception{
        return paymentDao.selectUnMemOrder(pMap);
    }

    /********************************** 관리자 페이지에서 조건에 맞는 주문리스트 조회 ***********************************/
    public List<AdminPayment> getAdminPaymentList(String status) throws Exception{
    	List<AdminPayment> paymentList = null; //회원 및 비회원 주문 리스트
    	Map<String,Object> pMap = new HashMap<>();
		// 주문상태에 따라 조건 다르게 리스트 받아와야함
		// 취소 / 반품 / 상품 준비중 / 배송완료/ 환불 상태별 주문 내역 불러오기
		pMap.put("order_status", status);
		pMap.put("table1", "TB_UNMEMPAYMENTDETAIL");
		pMap.put("table2", "TB_UNMEMPAYMENT");
		try {
			// 비회원 정보 가져오기
			paymentList = paymentDao.selectAdminPayment(pMap);
			// 회원 정보 담아주기
			pMap.put("table1", "TB_MEMPAYMENTDETAIL");
			pMap.put("table2", "TB_MEMPAYMENT");
			// 하나의 리스트에 회원 및 비회원 주문 내역 담아주기
			paymentList.addAll(paymentDao.selectAdminPayment(pMap));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentList;
    }

    /********************************** 관리자 페이지에서 조건에 맞는 환불요청 정보조회 ***********************************/
    public Refund getRefundInfo(Map<String,Object> pMap) throws Exception{
    	return refundDao.selectRefundInfo(pMap);
    }
    /********************************** 관리자 페이지에서 반품 신청 들어온 것만 조회 ***********************************/
    public List<Map<String,Object>> getRefundList() throws Exception{
    	return refundDao.selectRefundList();
    }

    /********************************** 반품 상태 업데이트 해주기 ***********************************/
    /** 반품 상태 정리하기
     * (1) 반품 승인: TB_MEMREFUND의 refund_status는 '반품 신청'->'환불'로 변경, TB_MEMPAYMENTDETAIL의 order_status는 '반품'->'환불'로 변경
     * (2) 반품 거절: TB_MEMREFUND의 refund_status는 '반품 신청'->'반품 거절'로 변경, TB_MEMPAYMENTDETAIL의 order_status는 '반품'->'배송완료'로 변경
     */
    @Transactional(rollbackFor = Exception.class)
    public void modifyRefundStatus(Map<String,Object> pMap) throws Exception{
    	String status = (String) pMap.get("refund_status"); // 반품 상태: (1)반품 승인(환불로 컬럼에 상태 저장) (2)반품 거절
    	refundDao.updateRefundOrder(pMap); // TB_MEMREFUND의 상태 변경
    	// (1) 관리자가 반품 승인을 해주었을 경우 
    	if(status.equals("환불")) { 
    		pMap.put("order_status", status);
    	}
    	// (2) 관리자가 반품 거절을 해주었을 경우 
    	else {
    		pMap.put("order_status", "반품 거절");
    	}
    	paymentDao.updateOrderStatus(pMap); // TB_MEMPAYMENTDETAIL에서의 상태 변경
    }

    
}


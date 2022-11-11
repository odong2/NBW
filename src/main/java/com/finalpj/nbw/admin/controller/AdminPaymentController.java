package com.finalpj.nbw.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalpj.nbw.payment.domain.AdminPayment;
import com.finalpj.nbw.payment.domain.Refund;
import com.finalpj.nbw.payment.service.PaymentService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/payment/*")
public class AdminPaymentController {
	
	private PaymentService paymentService;
	
	public AdminPaymentController(PaymentService paymentService) {
		this.paymentService = paymentService;
	}
	/* 이거 서비스로 뺴버리기 */
	public List<AdminPayment> setStatus(String status) {
		List<AdminPayment> paymentList = null; //회원 및 비회원 주문 리스트
		Map<String,Object> pMap = new HashMap<>();
		// 주문상태에 따라 조건 다르게 리스트 받아와야함
		// (1)none: 전체 주문내역 조회 (2)취소 / 반품 / 상품 준비중 / 배송완료 상태별 주문 내역 불러오기
		if(!status.equals("none")) { 
			pMap.put("order_status", status);
		}
		pMap.put("table1", "TB_UNMEMPAYMENTDETAIL");
		pMap.put("table2", "TB_UNMEMPAYMENT");
		try {
			// 비회원 정보 가져오기
			paymentList = paymentService.getAdminPaymentList(pMap);
			// 회원 정보 담아주기
			pMap.put("table1", "TB_MEMPAYMENTDETAIL");
			pMap.put("table2", "TB_MEMPAYMENT");
			// 하나의 리스트에 회원 및 비회원 주문 내역 담아주기
			paymentList.addAll(paymentService.getAdminPaymentList(pMap));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentList;
	}
	
	/*********************** [[ 배송상태 관리페이지 ]] ***********************/
	@GetMapping("/shipmentlist")
	public String getShipmentList(Model model) {
		List<AdminPayment> paymentList = null; //회원 및 비회원 주문 리스트
		String status = "상품 준비중";
		paymentList = this.setStatus(status);
		model.addAttribute("paymentList",paymentList);
		return "admin/payment/shipment";
	}
	
	/*********************** [[ 취소 및 환불 관리페이지 ]] ***********************/
	@GetMapping("/cancellist")
	public String getCancelList(Model model) {
		List<AdminPayment> paymentList = null; //회원 및 비회원 주문 리스트
		String status = "취소";
		paymentList = this.setStatus(status);
		status = "반품";
		paymentList.addAll(this.setStatus(status));
		model.addAttribute("paymentList",paymentList);
		return "/admin/payment/cancel";
	}

	/*********************** [[ 전체 주문 관리페이지 ]] ***********************/
	@GetMapping("/list")
	public String getPaymentList(Model model) {
		List<AdminPayment> paymentList = null; //회원 및 비회원 주문 리스트
		String status = "none";
		paymentList = this.setStatus(status);
		model.addAttribute("paymentList",paymentList);
		return "/admin/payment/payment";
	}
	/*********************** [[ 배송확정 상태 변경 ]] ***********************/
	@PostMapping("modify")
	@ResponseBody
	public void modifyOrderStatus(@RequestParam Map pMap, RedirectAttributes rattr) {
		log.info("받아온 pMap=================="+pMap);
		String msg = paymentService.modifyOrderStatus(pMap);
        rattr.addFlashAttribute("msg", msg);
	}
	/*********************** [[ 반품 상세 정보 받아오기 ]] ***********************/
	@PostMapping("refundlist")
	@ResponseBody
	public Refund getRefundInfo(@RequestParam Map pMap) {
		log.info("ajax로 받아온 pMap: "+pMap);
		Refund refundInfo = null;
		try {
			refundInfo = paymentService.getRefundInfo(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info(refundInfo);
		return refundInfo;
	}
	/*********************** [[ 반품 상태 변경해주기 (반품 신청 -> 반품 승인 or 반품 거절) ]] ***********************/
	@PostMapping("modifyrefundstatus")
	@ResponseBody
	public void modifyRefundStatus(@RequestParam Map pMap) {
		try {
			paymentService.modifyRefundStatus(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

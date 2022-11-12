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
	
	/*********************** [[ 배송상태 관리페이지 ]] ***********************/
	@GetMapping("/shipment")
	public String getShipmentList(Model model) {
		List<AdminPayment> paymentList = null; //회원 및 비회원 주문 리스트
		String status = "상품 준비중";
		try {
			paymentList = paymentService.getAdminPaymentList(status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("paymentList",paymentList);
		return "admin/payment/shipment";
	}
	
	/*********************** [[ 취소 및 환불 관리페이지 ]] ***********************/
	@GetMapping("/cancel")
	public String getCancelList(Model model) {
		List<Map<String,Object>> refundList = null; //회원 및 비회원 주문 리스트
		try {
			refundList = paymentService.getRefundList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("refundList",refundList);
		return "/admin/payment/cancel";
	}

	/*********************** [[ 상태 확정된 주문 내역 관리페이지 ]] ***********************/
	@GetMapping("/list")
	public String getPaymentList(Model model) {
		List<AdminPayment> paymentList = null; //회원 및 비회원 주문 리스트
		String status = "배송완료";
		try {
			paymentList = paymentService.getAdminPaymentList(status);
			status = "환불";
			paymentList.addAll(paymentService.getAdminPaymentList(status));
			status = "취소";
			paymentList.addAll(paymentService.getAdminPaymentList(status));
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("paymentList",paymentList);
		return "/admin/payment/payment";
	}
	/*********************** [[ 배송확정 상태 변경 ]] ***********************/
	@PostMapping("modify")
	@ResponseBody
	public void modifyOrderStatus(@RequestParam Map pMap, RedirectAttributes rattr) {
		String msg = paymentService.modifyOrderStatus(pMap);
        rattr.addFlashAttribute("msg", msg);
	}
	/*********************** [[ 반품 상세 정보 받아오기 ]] ***********************/
	@PostMapping("refundlist")
	@ResponseBody
	public Refund getRefundInfo(@RequestParam Map pMap) {
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
	/*********************** [[ 받아온 상태에 따른 리스트 가져오기 ]] ***********************/
	@PostMapping("searchlist")
	@ResponseBody
	public List<AdminPayment> getSearchList(@RequestParam String status, Model model){
		log.info("ajax로 받아온 status는: "+status);
		List<AdminPayment> searchList = null; 
		try {
			searchList = paymentService.getAdminPaymentList(status);
			log.info("searchList============================="+searchList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("searchList", searchList);
		return searchList;
	}
}

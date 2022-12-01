package com.finalpj.nbw.payment.controller;

import com.finalpj.nbw.coupon.domain.Coupon;
import com.finalpj.nbw.coupon.service.CouponService;
import com.finalpj.nbw.mail.service.MailService;
import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.payment.domain.CartList;
import com.finalpj.nbw.payment.domain.CartProduct;
import com.finalpj.nbw.payment.domain.Payment;
import com.finalpj.nbw.payment.domain.UnMemPayment;
import com.finalpj.nbw.payment.service.PaymentService;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Log4j
@Controller
@RequestMapping("/payment/*")
public class PaymentController {
    private final PaymentService paymentService;
    private final CouponService couponService;
    private final MailService mailService;
    public PaymentController(PaymentService paymentService, CouponService couponService, MailService mailService){
        this.paymentService = paymentService;
        this.couponService = couponService;
        this.mailService = mailService;
    }

    /*************************  결제페이지  ********************************
     * @param(CartList cartList) : p_no, p_title, p_price, p_img, p_category,mcart_count - 정보를 List<cartProduct>의 형태로 넘겨 받는다.
     * @param(HttpSession session) : 회원, 비회원을 구별하기 위해 session의 member.mem_id를 꺼내어 분기한다.
     * @param(Model m) : cartSize(총 주문 개수) 및 couponList(멤버의 쿠폰)을 view에 보내기 위해 사용
     * @return : payment view 페이지
     * *******************************************************************/
    @PostMapping("list")
    public String getPaymentList(@ModelAttribute CartList cartList, HttpSession session, Model m){
        String path = "";
        log.info("장바구니에서 넘어온 상품 결제페이지로 넘어온 삼품의 정보 ========> " + cartList);
        Member member = (Member)session.getAttribute("member");
        String mem_id = "";

        // 회원일 경우만 쿠폰을 조회
        if(member != null) {
            mem_id = member.getMem_id();
            List<Coupon> couponList = null;
            try {
                couponList = couponService.getCouponList(mem_id);
                log.info("회원의 쿠폰 정보 ==========> " + couponList);
                m.addAttribute("couponList", couponList);
                path = "/payment/memPayment";
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // 비회원일 경우
        else{
            path = "/payment/unMemPayment";
        }
        // 총 상품 개수를 담는다
        int cartSize= cartList.getCartProducts().size();
        m.addAttribute("cartSize",cartSize);
        return path;
    }
    /* */
    /************************************************************
     * @Information : 결제 페이지에서 넘겨 받는 값 테스트 하기 위한 페이지
     * @return : payTest 페이지
     * **********************************************************/
    @GetMapping("test")
    public String getTest(){
        return "/payment/payTest";
    }

    /************************* 결제페이지에서 결제하기 (비회원)  ****************************/
    @PostMapping("unmempay")
    public String unMemPay(@ModelAttribute UnMemPayment unMemPaymentDto, RedirectAttributes rattr){
        /** (1)주문번호 생성 **/
        String order_no = makeOrderNo();
        unMemPaymentDto.setOrder_no(order_no);
        log.info(unMemPaymentDto);

        try {
            // (1) 결제
            paymentService.unMemPay(unMemPaymentDto);
        } catch (Exception e){
            e.printStackTrace();
        }

        return "redirect:/payment/pay/" + order_no;
    }

    /********************************* 비회원 주문 조회 *******************************
     * @param pMap : orderName-주문자 이름, order_pw-주문 비밀번호, order_no-주문번호 3개를 넘겨 받는다.
     * @return 주문정보가 있을 경우 주문정보 return, 주문정보가 없을 경우 'ERR' 메시지 return
     *******************************************************************************/
    @GetMapping("unmem/order")
    @ResponseBody
    public ResponseEntity<String> getUnMemOrder(@RequestParam Map<String, String> pMap){
        log.info(pMap);
        String result;
        try{
            result =  paymentService.searchUnMemOrder(pMap);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("ERR", HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<String>(result, HttpStatus.OK);
    }

    /************************* 결제페이지에서 결제하기 (회원) ****************************
     * @param paymentDto
     * @param session
     * @param rattr
     * @return
     */
    @PostMapping("pay")
    public String orderPay(@ModelAttribute Payment paymentDto, HttpSession session, RedirectAttributes rattr){
        // (1)주문번호 생성
        String order_no = makeOrderNo();
        // (2)생성한 주문번호 Dto에 setting
        paymentDto.setOrder_no(order_no);

        log.info(paymentDto);

        try {
            // (1) 결제
            paymentService.memPay(paymentDto, session);
            // (2) 결제 정보 메일전송
            mailService.sendPayHtml(paymentDto);
        } catch (Exception e){
            e.printStackTrace();
        }

        return "redirect:/payment/pay/" + order_no;
    }

    /************************* 주문 결제후 주문상세 페이지 ***************************
     * @param order_no : 주문번호에 해당하는 상풍 및 결제정보 조회
     * @param session :  session의 Member 객체를 통해 회원 비회원 구분
     * @param m
     * @return 회원 및 비회원 분기처리하여 결제 후 주문 상세페이지 return
     */
    @GetMapping("pay/{order_no}")
    public String resultPay(@PathVariable String order_no, HttpSession session, Model m){
        Member member = (Member)session.getAttribute("member");
        List<CartProduct> productList = null;
        Map<String, Object> pMap = null;
        Map<String, Object> rMap = null;
        String orderDate = order_no.substring(0,8);
        log.info("orderDate = " + orderDate);
        // 회원 주문
        if(member != null){
            try{
                pMap = new HashMap<>();
                pMap.put("order_no", order_no);
                // 회원 테이블 동적 바인딩
                pMap.put("table", "tb_mempaymentdetail");
                /* 결제된 상품 정보 조회 */
                productList = paymentService.afterPaySearchOrder(pMap);
                rMap = paymentService.afterPaySearchReceiver(order_no);
                m.addAttribute("receiverInfo",rMap);
                m.addAttribute("productList", productList);
            } catch (Exception e){
                e.printStackTrace();
            }
            return "/payment/memOrder";
        }
        // 비회원 주문
        try{
        pMap = new HashMap<>();
        pMap.put("order_no", order_no);
        // 비회원 테이블 동적 바인딩
        pMap.put("table", "tb_unmempaymentdetail");
        /* 결제된 상품 정보 조회 */
        productList = paymentService.afterPaySearchOrder(pMap);
        rMap = paymentService.selectUnMemReceiver(order_no);
            m.addAttribute("receiverInfo",rMap);
            m.addAttribute("productList", productList);
        } catch(Exception e){
            e.printStackTrace();
        }

        return "/payment/unMemOrder";
    }


    /************************ 주문상태 변경(memPaymentDetail 테이블) **********************
     * @param pMap
     * @param rattr : service단의 결과 메시지 사용자에게 일회성으로 보여주는 역할
     * @return 마이페이지의 주문조회 페이지 return
     */
    @PostMapping("status")
    public String modifyOrderStatus(@RequestParam Map pMap, RedirectAttributes rattr){
        log.info(pMap);
            String msg = paymentService.modifyOrderStatus(pMap);
            rattr.addFlashAttribute("msg", msg);

        return "redirect:/mypage/payment/list";
    }

    /** 주문번호 생성 메서드(날짜생성 ex.202205060s06tf)**/
    public String makeOrderNo(){
        String order_no = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String uuid = UUID.randomUUID().toString();
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());

        // 하이픈 제외
        String resultUuid = uuid.toString().replaceAll("-", "");
        order_no = strToday + resultUuid.substring(0,8);
        return order_no;
    }


}

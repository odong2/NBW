package com.finalpj.nbw.payment.repository;

import com.finalpj.nbw.notice.dao.NoticeDao;
import com.finalpj.nbw.payment.dao.PaymentDao;
import com.finalpj.nbw.payment.domain.Payment;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
                                , "file:src/main/webapp/WEB-INF/spring/oauth2api-context.xml"
                                , "file:src/main/webapp/WEB-INF/spring/mail-context.xml"})
public class PaymentDaoImplTest {
    @Autowired
    PaymentDao paymentDao;

    /****************** tb_mempayment 테이블에 결제 정보 삽입 테스트 ******************/
    @Test
    public void PaymentDaoImplTest() throws Exception {
        Integer[] no = {1,2,3};
        Integer[] count = {3,5,3};
        Payment paymentDto = new Payment();
        paymentDto = paymentDto.builder()
                .p_no(no)
                .p_count(count)
                .order_no("ksgkfkgok2")
                .mem_id("admin").receiver_name("관리자")
                .receiver_phone("010-2323-2323")
                .receiver_zipcode(String.valueOf(0203))
                .receiver_address1("관악구").receiver_address2("봉천동")
                .delivery_memo("집앞에 놔주세요").total_price(30000)
                .used_point(3000).cp_no("1").build();

        log.info(paymentDto);

        int result = paymentDao.insertMemPayment(paymentDto);

        List<Map<String, Object>> payDetailList = new ArrayList<>();
        Map<String, Object> pMap = null;
        for (int i = 0; i < paymentDto.getP_no().length; i++) {
            pMap = new HashMap<String, Object>();

            int p_no = (int) paymentDto.getP_no()[i];
            int p_count = (int) paymentDto.getP_count()[i];
            String order_no = (String) paymentDto.getOrder_no();

            pMap.put("p_no", p_no);
            pMap.put("p_count", p_count);
            pMap.put("order_no", order_no);
            payDetailList.add(pMap);
        }
        assertTrue(result == 1 );
        assertTrue(paymentDao.insertPayDetail(payDetailList) > 0);

    }
}
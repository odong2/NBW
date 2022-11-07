package com.finalpj.nbw.mail.service;

import com.finalpj.nbw.payment.domain.Payment;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import com.finalpj.nbw.login.dto.FindDto;
import java.util.Random;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Service("mailService")
@Slf4j
public class MailService {

    /* (1) mail-context.xml 에서 설정한 빈을 자동으로 주입 */
    @Autowired
    private JavaMailSender mailSender;

    @Async
    public void sendMail(String to, String subject, String body) {
        log.info("SERVICE ===> sendMail 진입");
        log.info("SERVICE ===> to : " + to);
        log.info("SERVICE ===> subject : " + subject);
        log.info("SERVICE ===> body : " + body);

        try {
            /* (2) MimeMessage 타입 객체를 생성한다. */
            MimeMessage message = mailSender.createMimeMessage();
            /* (3) 메일을 보내기 위해 MimeMessageHelper 객체를 생성한다. */
            MimeMessageHelper messageHelper =
                    new MimeMessageHelper(message, true, "UTF-8");

            // (5) 보내는 이의 메일 주소가 보여지는 방식을 사용자 정의로 설정할 수 있다.
            // messageHelper.setFrom("wjdcodms@gachon.ac.kr","NBW");

            // 제목
            messageHelper.setSubject(subject);
            // (4) 수신인을 설정한다.--> Controller 에서 넘어온 수신메일 View -> Controller -> *Service*
            messageHelper.setTo(to);
            // 내용
            messageHelper.setText(body);
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Async
    public String sendMail(FindDto dto) {
        /* 인증 코드 생성 */
        Random random = new Random();
        int ranCode = random.nextInt(888888) + 111111;

        log.info("생성된 코드는 ===>" + ranCode);

        /* 이메일을 보낸다.  -> Service 의 send 에 넘겨줄 값을 변수에 담는다. */
        String to = dto.getMem_email();
        String subject = "NBW 비밀번호 변경 요청입니다.";
        /* 내용에는 생성한 난수를 담는다. */
        String body = "인증 코드는 [" + ranCode + "] 입니다.";

        sendMail(to, subject, body);

        return String.valueOf(ranCode);
    }


    /*************************** 결제 후 주문 내역서 메일 전송  ****************************/
    @Async
    public void sendPayHtml(Payment paymentDto) {
        String toEmail = paymentDto.getMem_email();
        String subject = "NBW결제 내역입니다. 확인바랍니다.";
        StringBuffer body = new StringBuffer();
        body.append("<html>");
        body.append("<body>");
        body.append("<a href='http://localhost/home'><img src='https://user-images.githubusercontent.com/95892601/199779347-40e4e48f-90a0-481c-b6e2-3a00c86d974a.png' style='width:200px'/></a>");
        body.append("<hr>");
        body.append("<h2>").append(paymentDto.getMem_name()).append("님의 주문 내역</h2>");
        body.append("<p style='margin-bottom:10px; font-size: 13px;'>주문번호: ").append(paymentDto.getOrder_no()).append("</p>");
        body.append("<p style='margin-bottom:10px; font-size: 13px;'>총가격: ").append(paymentDto.getTotal_price()).append("원</p>");
        body.append("<p style='margin-bottom:10px; font-size: 13px;'>수령인: ").append(paymentDto.getReceiver_name()).append("</p>");
        body.append("<p style='margin-bottom:10px; font-size: 13px;'>수령인 연락처: ").append(paymentDto.getReceiver_phone()).append("</p>");
        body.append("<p style='margin-bottom:10px; font-size: 13px;'>수령인 주소: ").append(paymentDto.getReceiver_address1()).append("</p>");
        body.append("<p style='margin-bottom:10px; font-size: 13px;'>수령인 상세주소: ").append(paymentDto.getReceiver_address2()).append("</p>");
        if(paymentDto.getDelivery_memo() == "0"){
            body.append("<p style= 'font-size: 13px;'>배송 메모: 없음 </p>");
        }else {
            body.append("<p style= 'font-size: 13px;'>배송 메모: ").append(paymentDto.getDelivery_memo()).append("</p>");
        }
        body.append("<h3 style='margin-top: 10px;'>주문내역 확인 후 이상이 있을 시 고객센터로 연락바랍니다.감사합니다.</h3>");
        body.append("</body>");
        body.append("</html>");

        try {
            /* (1) MimeMessage 타입 객체를 생성한다. */
            MimeMessage message = mailSender.createMimeMessage();
            /* (2) 보내는 내용의 charset과 subtype 설정*/
            message.setText(String.valueOf(body), "UTF-8", "html");
            /* (3) 보내는 사람 설정*/
            message.setFrom("NBW");
            /* (4) 이메일 제목 설정*/
            message.setSubject(subject);
            // (5) 수신인을 설정한다.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail, "USER", "UTF-8"));
            // 보내기
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

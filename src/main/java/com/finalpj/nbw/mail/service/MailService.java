package com.finalpj.nbw.mail.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;

@Service("mailService")
@Slf4j
public class MailService {

    /* (1) mail-context.xml 에서 설정한 빈을 자동으로 주입 */
    @Autowired
    private JavaMailSender mailSender;

    // 인증키를 생성한다.

    // 인증코드 난수를 생성한다.

    @Async
    public void sendMail(String to, String subject, String body){
        log.info("SERVICE ===> sendMail 진입");
        /* (2) MimeMessage 타입 객체를 생성한다. */
        MimeMessage message = mailSender.createMimeMessage();
        try{
            /* (3) 메일을 보내기 위해 MimeMessageHelper 객체를 생성한다. */
            MimeMessageHelper messageHelper =
                    new MimeMessageHelper(message, true, "UTF-8");

            // (4) 수신인을 설정한다.
            messageHelper.setCc("ninxtxn@gmail.com");
            // (5) 보내는 이의 메일 주소가 보여지는 방식을 사용자 정의로 설정할 수 있다.
            messageHelper.setFrom("wjdcodms@gachon.ac.kr", "엔비더");
            // 제목
            messageHelper.setSubject("테스트 메일전송 - SERVICE");
            // 수신처
            messageHelper.setTo("ninxtxn@gmail.com");
            // 내용

            messageHelper.setText("인증번호는 44455 입니다.");
            mailSender.send(message);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

}

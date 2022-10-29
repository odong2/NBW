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

    @Async
    public void sendMail(String to, String subject, String body){
        log.info("SERVICE ===> sendMail 진입");
        log.info("SERVICE ===> to : "+ to);
        log.info("SERVICE ===> subject : "+ subject);
        log.info("SERVICE ===> body : "+ body);

        try{
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
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

}

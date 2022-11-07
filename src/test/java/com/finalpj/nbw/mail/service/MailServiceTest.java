package com.finalpj.nbw.mail.service;

import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

import static org.junit.Assert.*;
@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
        , "file:src/main/webapp/WEB-INF/spring/oauth2api-context.xml"
        , "file:src/main/webapp/WEB-INF/spring/mail-context.xml"})
public class MailServiceTest {

    @Autowired
    MailService mailService;
    @Autowired
    private JavaMailSender mailSender;

    @Test
    public void sendPayHtml() {
        String toEmail ="mjey54@naver.com";
        String subject="NBW결제 내역입니다";
        StringBuffer body = new StringBuffer();

        body.append("<html>");
        body.append("<body>");
        body.append("<a href='https://localhost/home'><img src='https://user-images.githubusercontent.com/95892601/199779347-40e4e48f-90a0-481c-b6e2-3a00c86d974a.png' style='width:200px'/></a>");
        body.append("<hr>");
        body.append("<h3>HTML 메일 테스트</h3>");
        body.append("<p>가입을 축하드립니다.</p>");
        body.append("<p>HTML 메일 테스트</p>");
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
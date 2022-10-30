package com.finalpj.nbw.mail.controller;

import com.finalpj.nbw.mail.service.MailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.Random;

@Controller
@Slf4j
@EnableAsync // 메서드를 호출할 경우 비동기로 동작하게 하는 어노테이션
@RequestMapping("/mail/")
public class MailController {

    @Autowired
    private MailService mailService;

    /* ==================== 인증 메일 전송 ===================== */
    @GetMapping (value="mailCheck")
    @ResponseBody
    public String mailCheckGET(String email){

        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("메일 주소 ===> " + email);

        /* 인증 코드 생성 */
        Random random = new Random();
        int ranCode = random.nextInt(888888) + 111111;

        log.info("생성된 코드는 ===>" +ranCode);

        try {
            /* 이메일을 보낸다.  -> Service 의 send 에 넘겨줄 값을 변수에 담는다. */
            String toMail = email;
            String subject = "NBW 인증메일 발송입니다.";
            /* 내용에는 생성한 난수를 담는다. */
            String body = "인증 코드는 "+ ranCode + "입니다.";
            /* 서비스 층에서 메일을 전송한다. */
            mailService.sendMail(email, subject, body);
        } catch (Exception e) {
            e.printStackTrace();
        }

        /* 뷰(View)로 전송할 코드를 String 형식으로 형변환 후 반환해서 ajax 로 뷰로 다시 반환한다. */
        return Integer.toString(ranCode);
    }

}

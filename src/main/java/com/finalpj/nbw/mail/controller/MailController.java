package com.finalpj.nbw.mail.controller;

import com.finalpj.nbw.mail.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Controller
@EnableAsync // 메서드를 호출할 경우 비동기로 동작하게 하는 어노테이션
@RequestMapping("/mail/")
public class MailController {

    @Autowired
    private MailService mailService;

    @GetMapping("/send")
    public void sendSimpleMail(HttpServletRequest request, HttpServletResponse response) throws Exception{
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        /* (1) mailService 의 sendMail() 메서드로 관련 값 {*주소*, *제목*, *내용*} */
        mailService.sendMail("ninxtxn@gmail.com", "테스트 메일입니다.", "안녕하세요? 테스트 메일입니다.");
        /* (2) mail-context.xml 에 설정한 메일 주소로 내용을 보낸다. */
        //mailService.sendPreConfiguredMail("테스트 메일입니다.");
        out.print("메일을 보냈습니다.");
    }
}

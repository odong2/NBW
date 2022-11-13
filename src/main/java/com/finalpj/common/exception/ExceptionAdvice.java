package com.finalpj.common.exception;

import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Log4j
@ControllerAdvice
public class ExceptionAdvice {

    @ExceptionHandler(Exception.class)
    public String exceptionHandle(Exception e, Model model){
        model.addAttribute("error",e);
//        log.info("아래의 예외 발생하여 에러페이지 출력");
//        log.info(e);
//        model.addAttribute("exception",e);
        return "error/error";
    }


}

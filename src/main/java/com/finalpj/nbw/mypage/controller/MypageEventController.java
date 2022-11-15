package com.finalpj.nbw.mypage.controller;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.domain.EventMember;
import com.finalpj.nbw.event.service.EventService;
import com.finalpj.nbw.member.domain.Member;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j
@RequestMapping("/mypage/event/")
@Controller
public class MypageEventController {

    EventService eventService;

    public MypageEventController(EventService eventService) {
        this.eventService = eventService;
    }
    /********************************* [[신청한 이벤트 페이지]] *********************************/
    @GetMapping("/list")
    public String mypageEventList(Integer ev_no, Model m, HttpSession session) throws Exception {
        Member member = (Member) session.getAttribute("member");
        List<Event> myEventSelectAll = null;
        try {

            if(member != null) { // 회원일 경우
               String id = member.getMem_id();
                myEventSelectAll = eventService.mypageEventList(id);
             }
            log.info("myEventSelectAll은 : "+myEventSelectAll);
            m.addAttribute("myEventSelectAll",myEventSelectAll);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "mypage/event/event";
    }

    @GetMapping("list/all")
    @ResponseBody
    public ResponseEntity<List<Event>> getAllEvent(HttpSession session) throws Exception {
        Member member = (Member) session.getAttribute("member");
        List<Event> myEventSelectAll = null;
        try {
            if(member != null) { // 회원일 경우
                String id = member.getMem_id();
                myEventSelectAll = eventService.mypageEventList(id);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<List<Event>>(myEventSelectAll, HttpStatus.OK);
    }
}

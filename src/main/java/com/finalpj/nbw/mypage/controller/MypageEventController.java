package com.finalpj.nbw.mypage.controller;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.domain.EventMember;
import com.finalpj.nbw.event.service.EventService;
import com.finalpj.nbw.member.domain.Member;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String mypageEventList(Model m, HttpSession session) throws Exception {
        Member member = (Member) session.getAttribute("member");
        List<Event> myEventSelectAll = null;
//        List<EventMember> adminMemberEvent = null;

        if(member != null) { // 회원일 경우
            String id = member.getMem_id();
            myEventSelectAll = eventService.mypageEventList(id);
//            adminMemberEvent = eventService.adminMemberEvent(id);
        }
        log.info("qna 컨트롤러 호출 성공");
        log.info("mypageEventList 마이페이지 컨트롤러 호출 성공 ");
        log.info("myEventSelectAll은 : "+myEventSelectAll);
//        log.info("adminMemberEvent은"+adminMemberEvent);
        m.addAttribute("myEventSelectAll",myEventSelectAll);
//        m.addAttribute("adminMemberEvent",adminMemberEvent);
        return "mypage/event/event";
    }

}

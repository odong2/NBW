package com.finalpj.nbw.event.controller;

import com.finalpj.nbw.event.domain.EventMember;
import com.finalpj.nbw.event.service.EventService;
import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.member.domain.Member;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Log4j
@RequestMapping("/event/*")
@Controller
public class EventController {

    EventService eventService;

    public EventController(EventService eventService){
        this.eventService = eventService;
    }

    /******************************* [[이벤트 리스트 페이지]] *****************************/
    @GetMapping("list")
    public String eventList(Model m) throws Exception {
        log.info("컨트롤러 이벤트 리스트 호출 성공");
        m.addAttribute("eventSelectAll", eventService.eventList());
        log.info("이벤트 호출 성공"+eventService.eventList().toString());
        return "/event/eventList";
    }
    /***************************** [[이벤트 디테일 페이지]] *******************************/
    @GetMapping("/detail")
    public String eventRead(Integer ev_no, Model m) throws Exception {
        int result = 0;
        try {
            Event event = eventService.eventRead(ev_no);
            if(event.getEv_file() != null) {
                String saveFileName = event.getEv_file();
                int idx = saveFileName.indexOf("_");
                String originalFileName = saveFileName.substring(idx+1);
                event.setEv_filename(originalFileName);
            }
            m.addAttribute("eventSelect",event);
            log.info(event);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/event/eventDetail";
    }

    /***************************** [[이벤트 신청 ]] *******************************/
    @GetMapping("/add")
    public String eventAdd(Model m) {
        return "/event/add";
    }
    @PostMapping("/add")
    public String eventAdd(EventMember eventMember, Integer ev_no, RedirectAttributes rattr, Model m, HttpSession session) {
        log.info("이벤트 신청 controller 호출 성공");
        Member member = (Member)session.getAttribute("member");
        String mem_id = member.getMem_id();
        eventMember.setMem_id(mem_id);
        log.info("mem_id 가져오기 성공"+mem_id);
        try{
            eventService.eventAdd(eventMember, ev_no);
            eventService.updatePersonY(eventMember); // 신청자수 +1
            eventService.updateStatusY(ev_no);
            return "redirect:/event/list";
        }catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(eventMember);
            return "/event/add";
        }

    }

    /**************************************** 이벤트 캘린더 *****************************************/

}

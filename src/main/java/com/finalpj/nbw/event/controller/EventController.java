package com.finalpj.nbw.event.controller;

import com.finalpj.nbw.event.domain.EventMember;
import com.finalpj.nbw.event.service.EventService;
import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.member.domain.Member;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

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

        try {
            List<Event> eventList = eventService.eventList();

            for(Event event : eventList){
                String saveImgName =event.getEv_img();
                int idx = saveImgName.indexOf("_");
                String originalImgName = saveImgName.substring(idx+1);
                event.setEv_img(originalImgName);
            }

            m.addAttribute("eventSelectAll", eventList);

        } catch (Exception e) {
            e.printStackTrace();
        }

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

    @GetMapping("list/all")
    @ResponseBody
    public ResponseEntity<List<Event>> getAllEvent() throws Exception {
        List<Event> eventList = null;
        try {
            eventList = eventService.eventList();
            log.info(eventList);

            for(Event event : eventList){
                String saveImgName = event.getEv_img();
                int idx = saveImgName.indexOf("_");
                String originalImgName = saveImgName.substring(idx+1);
                event.setEv_img(originalImgName);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<List<Event>>(eventList, HttpStatus.OK);
    }

    /**************************************** 이벤트 캘린더 *****************************************/

}

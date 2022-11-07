package com.finalpj.nbw.admin.controller;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.service.EventService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@Log4j
@RequestMapping("/admin/event/")
public class AdminEventController {

    EventService eventService;


    public AdminEventController (EventService eventService) {
        this.eventService = eventService;
    }

    /***************** [[관리자 이벤트 조회페이지]] *********************/
    @GetMapping("/list")
    public String adminEventList(Model m) throws Exception {
    log.info("admin 이벤트 컨트롤러 리스트 호출 성공");
    m.addAttribute("eventSelectAll", eventService.adminEventList());
        return "admin/event/event";
    }
    /*************************** [[ 관리자 이벤트 디테일 페이지 ]] **********************/
    @GetMapping("/detail")
    public String adminEventRead(Integer ev_no, Model m){
        log.info(ev_no);
        try {
            Event event = (Event) eventService.adminEventRead(ev_no);
            m.addAttribute("eventSelect",event);
            log.info(event);
        } catch (Exception e) {
        }
        return "admin/event/eventDetail";
    }
    /***************** [[관리자 이벤트 신청자 조회페이지]] ***************/
    @GetMapping("applicant")
    public String adminEventApplicant() {
        return "admin/event/eventApplicant";
    }

    /***************** [[관리자 이벤트 등록페이지]] ***************/
    @GetMapping("write")
    public String adminEventWrite(Model m) {
    log.info(" GetMapping controller 호출 성공");

        return "admin/event/eventRegister";
    }
    @PostMapping("/write")
    public String adminEventWrite(Event event, RedirectAttributes rattr, Model m) throws Exception {
    log.info(" PostMapping controller 호출 성공");
        try {
            if (eventService.adminEventWrite(event) != 1)
                throw new Exception("Write failed.");

            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/admin/event/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(event);
            m.addAttribute("mode", "new");
            m.addAttribute("msg", "WRT_ERR");
            return "/admin/event/write";
        }
    }


    /************************************ [[이벤트 삭제 페이지]] *********************************/
    @GetMapping("/delete/{ev_no}")
    public String adminEventDelete (@PathVariable Integer ev_no, RedirectAttributes rattr, HttpSession session) {
        log.info("adminEventDelete 컨트롤러 호출");
        try {
            log.info("eventRemove 컨트롤러 호출");
            int result = eventService.adminEventDelete(ev_no);
            log.info(result);
            rattr.addFlashAttribute("msg", "DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DEL_ERR");
        }
        return "redirect:/admin/event/list";
    }

}

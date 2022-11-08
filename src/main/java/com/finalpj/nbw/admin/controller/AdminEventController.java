package com.finalpj.nbw.admin.controller;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.domain.EventMember;
import com.finalpj.nbw.event.service.EventService;
import lombok.extern.log4j.Log4j;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

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
    public String adminEventApplicant(Integer ev_no, Model m) {
        log.info(ev_no);
        try {
            EventMember eventMember = (EventMember) eventService.adminEventApplicant(ev_no);
            m.addAttribute("adminEventPerson", eventMember);
            log.info(eventMember);
        } catch (Exception e) {

        }
        return "admin/event/eventApplicant";
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


    /***************** [[관리자 이벤트 등록페이지]] ***************/
    @GetMapping("/write")
    public String adminEventWrite(Model m) {
    log.info(" GetMapping controller 호출 성공");

        return "admin/event/eventRegister";
    }
    @PostMapping("/write")
    public String adminEventWrite(Event event, MultipartFile file, RedirectAttributes rattr, Model m) throws Exception {
    log.info("file = " + file.getOriginalFilename());
    String originalFileName = file.getOriginalFilename();
    if(originalFileName!= null && originalFileName != "") {
        String saveFileName = "";
        String uploadPath = "C:\\eventupload\\file";
        UUID uuid = UUID.randomUUID();
        saveFileName = uuid.toString() + "_" + originalFileName;
        File folder = new File(uploadPath, saveFileName);
        if (!folder.isDirectory()) {
            folder.mkdirs();
        }
        event.setEv_file(saveFileName);
        try {
            eventService.adminEventWrite(event);
            file.transferTo(folder);
            rattr.addFlashAttribute("msg","WRT_OK");
        }catch(Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "WRT_ERR");
        }
    }
    else {
        try {
            eventService.adminEventWrite(event);
            rattr.addFlashAttribute("msg", "WRT_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "WRT_ERR");
          }
        }
        return "redirect:/admin/event/list";
    }

    /****************************** 첨부파일 다운로드 ******************************/
    @GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(String fileName){
        final String fileFolder = "C:\\eventupload\\file\\";
        log.info("download file : " + fileName);
        Resource resource = new FileSystemResource(fileFolder + fileName);

        log.info("resource : " + resource);

        String resourceName = resource.getFilename();
        HttpHeaders headers = new HttpHeaders();

        int idx = fileName.indexOf("_");
        /* uuid 제거하여 roginalFilName 구함 */
        String originalFileName = fileName.substring(idx+1);

        try {
            headers.add("Content-Disposition", "attachment; filename="+ new String(originalFileName.getBytes("UTF-8"),
                    "ISO-8859-1"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);

    }



}

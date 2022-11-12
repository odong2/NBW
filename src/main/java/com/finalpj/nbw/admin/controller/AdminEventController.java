package com.finalpj.nbw.admin.controller;

import com.finalpj.common.FileUploader;
import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.domain.EventMember;
import com.finalpj.nbw.event.service.EventService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Controller
@Log4j
@RequestMapping("/admin/event/")
public class AdminEventController {

    EventService eventService;

    ResourceLoader resourceLoader;
    FileUploader fileUploader;

    public AdminEventController (EventService eventService, ResourceLoader resourceLoader, FileUploader fileUploader) {
        this.eventService = eventService;
        this.resourceLoader = resourceLoader;
        this.fileUploader = fileUploader;
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
        try {
            Event event = eventService.adminEventRead(ev_no);
            if(event.getEv_file() != null) {
                String saveFileName = event.getEv_file();
                int idx = saveFileName.indexOf("_");
                String originalFileName = saveFileName.substring(idx+1);
                event.setEv_filename(originalFileName);
            }
            m.addAttribute("eventSelect",event);
            log.info(event);
        } catch (Exception e) {
        }
        return "admin/event/eventDetail";
    }
    /***************** [[관리자 이벤트 신청자 조회페이지]] ***************/
    @GetMapping("/applicant")
    public String adminEventApplicant(Integer ev_no, Model m) {
        log.info(ev_no);
        try {
            Event event = (Event) eventService.adminEventRead(ev_no);
            List<EventMember> eventMember = eventService.adminEventApplicant(ev_no);
            m.addAttribute("eventSelect", event);
            m.addAttribute("adminEventPerson", eventMember);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin/event/eventApplicant";
    }
    /***************** [[관리자 이벤트 신청자 거절] ***************/
    @PostMapping("/personn")
    public String adminEventPersonN (EventMember eventMember, Model m, RedirectAttributes rattr) {
        log.info("adminEventPersonN 컨트롤러 호출");
    try {
        eventService.adminEventPersonN(eventMember);// mem_status N로 변경
    } catch (Exception e) {
        e.printStackTrace();
    }
    return "redirect:/admin/event/applicant?ev_no="+ eventMember.getEv_no();
    }
    /***************** [[관리자 이벤트 신청자 승인] ***************/
    @PostMapping("/persony")
    public String adminEventPersonY (EventMember eventMember, RedirectAttributes rattr) {
        log.info("adminEventPersonY 컨트롤러 호출");
        try {
            eventService.adminEventPersonY(eventMember); // mem_status Y로 변경
            int result2 = eventService.updatePersonY(eventMember); // 신청자수 +1
            log.info(result2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/event/applicant?ev_no="+eventMember.getEv_no();
    }

    //


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
    /******************************************** [[관리자 이벤트 수정]] **************************************/
    @GetMapping("/modify")
    public String getAdminModify(@ModelAttribute Event event, RedirectAttributes rattr) {
        log.info("admin event Modify 호출");
        return "/admin/event/eventRead";
    }

    @PostMapping("/modify")
    public String adminModify(@ModelAttribute Event event, MultipartFile file, RedirectAttributes rattr) {
        log.info("수정하는 이벤트글 정보 = " + event);
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
                eventService.adminModify(event);
                file.transferTo(folder);
                rattr.addFlashAttribute("msg","WRT_OK");
            }catch(Exception e) {
                e.printStackTrace();
                rattr.addFlashAttribute("msg", "WRT_ERR");
            }
        }
        else {
            try {
                eventService.adminModify(event);
                rattr.addFlashAttribute("msg", "WRT_OK");
            } catch (Exception e) {
                e.printStackTrace();
                rattr.addFlashAttribute("msg", "WRT_ERR");
            }
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
    public String adminEventWrite(Event event, MultipartFile file, MultipartFile img,  RedirectAttributes rattr, Model m) throws Exception {
        String ev_file = fileUploader.fileUpload(file, "event/file");
        event.setEv_file(ev_file);
        String ev_img = fileUploader.fileUpload(img, "event/img");
        event.setEv_img(ev_img);
        eventService.adminEventWrite(event);
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
    /******************************* [[이벤트 이미지]] **********************************/
    // 썸네일 코드
    @GetMapping("/display/{fileName:.+}")
    @ResponseBody
    public ResponseEntity<byte[]> getFile (@PathVariable String fileName){
        log.info("fileName : " + fileName);
        final String uploadRoot = System.getProperty("user.home");
        final String fileFolder = uploadRoot+"/Desktop/upload/event/img";
        File file = new File(fileFolder + fileName);

        log.info("file: " + file);

        ResponseEntity<byte[]> result = null;

        try{
            HttpHeaders header = new HttpHeaders();

            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result= new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }



}

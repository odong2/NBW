package com.finalpj.nbw.admin.controller;
import com.finalpj.nbw.notice.domain.Notice;
import com.finalpj.nbw.notice.domain.PageHandler;
import com.finalpj.nbw.notice.domain.SearchCondition;
import com.finalpj.nbw.notice.service.NoticeService;
import lombok.extern.log4j.Log4j;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

@Log4j
@Controller
@RequestMapping("admin/notice")
public class AdminNoticeController {

    NoticeService noticeService;
    ResourceLoader resourceLoader;


    public AdminNoticeController(NoticeService noticeService, ResourceLoader resourceLoader){
        this.noticeService = noticeService;
        this.resourceLoader = resourceLoader;
    }

    @GetMapping("/list")
    public String getNoticeList(SearchCondition sc,  Model m){
        try {
            // 전체 게시물 개수 조회
            int totalCnt = noticeService.getSearchResultCnt(sc);
            PageHandler pageHandler = new PageHandler(totalCnt, sc);
//         PageHandler pageHandler = new PageHandler(totalCnt, page);
            log.info("총 게시물 개수는 " + totalCnt + "개");
            log.info("pageHandler는 " + pageHandler);

            m.addAttribute("ph", pageHandler);

            List<Notice> noticeList= noticeService.getSearchResultPage(sc);
            m.addAttribute("noticeList", noticeList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/admin/notice/notice";
    }
    @GetMapping("/read")
    public String getNoticeRead(Integer nt_no,SearchCondition sc, Model m){
        try {
            Notice noticeDto = noticeService.getNotice(nt_no);
            log.info("noticeDto = " + noticeDto);
            // 첨부파일이 존재하면 기존 파일 이름을 세팅하여 모델에 dto에 저장
            if(noticeDto.getNt_file() != null){
               String saveFileName = noticeDto.getNt_file();
               int idx = saveFileName.indexOf("_");
               // uuid를 제거하여 저장
               String originalFileName = saveFileName.substring(idx+1);
               noticeDto.setNt_filename(originalFileName);
            }
            m.addAttribute("noticeDto", noticeDto);
            m.addAttribute("SearchCondition", sc);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/admin/notice/noticeRead";
    }

    @GetMapping("/write")
    public String getWritePage(){
        return "/admin/notice/noticeWrite";
    }
    @PostMapping("/write")
    public String writeNotice(Notice notice, MultipartFile file, RedirectAttributes rattr){
        log.info("file = " + file.getOriginalFilename());
        String originalFileName = file.getOriginalFilename();
        // 첨부파일이 있을 경우
        if(originalFileName!= null && originalFileName != "") {
            String saveFileName = "";
            String uploadPath = "C:\\upload\\file";
            UUID uuid = UUID.randomUUID();
            // 파일이름 중복을 위해 uuid를 덧붙여 파일이름 저장
            saveFileName = uuid.toString() + "_" + originalFileName;
            File folder = new File(uploadPath, saveFileName);
            // 폴더가 없다면 생성
            if (!folder.isDirectory()) {
                folder.mkdirs();
            }
            notice.setNt_file(saveFileName);
            try{
                noticeService.writeNotice(notice);
                file.transferTo(folder);
                rattr.addFlashAttribute("msg","WRT_OK");
            }catch (Exception e){
                e.printStackTrace();
                rattr.addFlashAttribute("msg","WRT_ERR");
            }
        }
        else{
            try{
                noticeService.writeNotice(notice);
                rattr.addFlashAttribute("msg","WRT_OK");
            }catch (Exception e){
                e.printStackTrace();
                rattr.addFlashAttribute("msg","WRT_ERR");
            }
        }

        return "redirect:/admin/notice/list";
    }
    /********************************* 공지글 삭제 *********************************/
    @GetMapping("/delete/{nt_no}")
    public String deleteNotice(@PathVariable Integer nt_no, RedirectAttributes rattr){
        log.info("AdminNotice Delete 호출");
        try {
            int result = noticeService.removeNotice(nt_no);
            log.info("삭제 결과는 " + result + "입니다");
            rattr.addFlashAttribute("msg","DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","DEL_ERR");
        }
        return "redirect:/admin/notice/list";
    }

    /********************************* 공지글 삭제 *********************************/
    @GetMapping("/modify")
    public String modtifyNotice(@ModelAttribute Notice noticeDto, RedirectAttributes rattr){
        log.info("AdminNotice Modify 페이지 호출");
        log.info("수정하는 공지글 정보 = " + noticeDto);
        return "/admin/notice/noticeModify";
    }


    /****************************** 첨부파일 다운로드 ******************************/
    @GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(String fileName){
        final String fileFolder = "C:\\upload\\file\\";
        log.info("download file : " + fileName);
        Resource resource = new FileSystemResource(fileFolder + fileName);

        log.info("resource : " + resource);

        String resourceName = resource.getFilename();
        HttpHeaders headers = new HttpHeaders();

        int idx = fileName.indexOf("_");
        // uuid를 제거하여 저장
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

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
@RequestMapping("/admin/notice")
public class AdminNoticeController {

    NoticeService noticeService;
    ResourceLoader resourceLoader;


    public AdminNoticeController(NoticeService noticeService, ResourceLoader resourceLoader){
        this.noticeService = noticeService;
        this.resourceLoader = resourceLoader;
    }
    /************************************ 전체 공지글 조회 ***********************************/
    @GetMapping("/list")
    public String getNoticeList(SearchCondition sc,  Model m){
        try {
            /* (1) 전체 게시물 개수 조회 */
            int totalCnt = noticeService.getSearchResultCnt(sc);
            /* (2) 페이징 처리를 위해 총 게시물 개수 및 sc를 통해 pageHandler 생성 */
            PageHandler pageHandler = new PageHandler(totalCnt, sc);
//         PageHandler pageHandler = new PageHandler(totalCnt, page);
            log.info("총 게시물 개수는 " + totalCnt + "개");
            log.info("pageHandler는 " + pageHandler);

            m.addAttribute("ph", pageHandler);
            /* (3) 전체 게시물 조회하여 noticeList에 담아 view로 내보내기 */
            List<Notice> noticeList = noticeService.getSearchResultPage(sc);
            m.addAttribute("noticeList", noticeList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/admin/notice/notice";
    }
    /************************************ 공지글 상세페이지 조회 ***********************************/
    @GetMapping("/read")
    public String getNoticeRead(Integer nt_no,SearchCondition sc, Model m){
        try {
            /* (1) 공지글 번호(nt_no)로 해당 공지글 내용 조회 */
            Notice noticeDto = noticeService.getNotice(nt_no);
            log.info("noticeDto = " + noticeDto);
            /* (2) 해당 공지글에 첨부파일이 있을 경우 분기*/
            if(noticeDto.getNt_file() != null){
               /* (3) dsaveFilename은 uuid를 포함한 첨부파일의 고유이름이다. */
               String saveFileName = noticeDto.getNt_file();
               int idx = saveFileName.indexOf("_");
               /* (4) '_' 기준으로 idx를 구하여 uuid를 제거하여 originalFileName을 구한다. */
               String originalFileName = saveFileName.substring(idx+1);
               /* (5) uuid를 제거한 파일이름 저장 */
               noticeDto.setNt_filename(originalFileName);
            }
            m.addAttribute("noticeDto", noticeDto);
            m.addAttribute("SearchCondition", sc);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/admin/notice/noticeRead";
    }
    /************************************ 공지글 등록 페이지(GET) ************************************/
    @GetMapping("/write")
    public String getWritePage(){
        return "/admin/notice/noticeWrite";
    }

    /************************************ 공지글 등록(POST) ************************************/
    @PostMapping("/write")
    public String writeNotice(Notice noticeDto, MultipartFile file, RedirectAttributes rattr){
        log.info("file = " + file.getOriginalFilename());
        /* (1) file 객체에서 originalFileName을 얻는다. */
        String originalFileName = file.getOriginalFilename();
        /* (2) file 존재 유무 분기. 공지글 작성시 첨부파일이 없을 경우 originalFileName은 ""(공백) 이다. */
        // 첨부파일 존재할 경우
        if(originalFileName!= null && originalFileName != "") {
            String saveFileName = "";
            String uploadPath = "C:\\upload\\file";
            UUID uuid = UUID.randomUUID();
            /* (3) 첨부파일 이름의 중복 방지를 위해 uuid를 덧붙이고, 
            이후 originalFileName을 substring으로 잘러서 쓰기 위해 '_'를 구분자를 추가하여 저장 */
            saveFileName = uuid.toString() + "_" + originalFileName;
            File folder = new File(uploadPath, saveFileName);
            /* (4) uploadPath로 지정한 경로가 없다면 폴더 생성 */
            if (!folder.isDirectory()) {
                folder.mkdirs();
            }
            /* (5) dto에 uuid를 포함한 파일 이름을 저장 */
            noticeDto.setNt_file(saveFileName);
            try{
                /* (6) db에 insert */
                noticeService.writeNotice(noticeDto);
                /* (7) 지정한 폴더에 uuid를 포함한 파일 이름으로 파일 쓰기(저장) */
                file.transferTo(folder);
                // 성공 메시지 전달
                rattr.addFlashAttribute("msg","WRT_OK");
            }catch (Exception e){
                e.printStackTrace();
                // 실패 메시지 전달
                rattr.addFlashAttribute("msg","WRT_ERR");
            }
        }
        // 첨부파일이 없는 경우
        else{
            try{
                noticeService.writeNotice(noticeDto);
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

    /********************************* 공지글 수정  페이지 *********************************/
    @GetMapping("/modify")
    public String getModifyPage(@ModelAttribute Notice noticeDto, RedirectAttributes rattr){
        log.info("AdminNotice Modify 페이지 호출");
        return "/admin/notice/noticeModify";
    }
    /****
     * ******************************** 공지글 수정  ************************************/
    @PostMapping("/modify")
    public String modtifyNotice(@ModelAttribute Notice noticeDto, RedirectAttributes rattr){
        log.info("수정하는 공지글 정보 = " + noticeDto);
        try{
            noticeService.modifyNotice(noticeDto);
            rattr.addFlashAttribute("msg", "MOD_OK");
        }catch (Exception e){
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "MOD_ERR");
        }
        return "redirect:/admin/notice/list";
    }



    /****************************** 첨부파일 다운로드 ******************************/
    @GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(String fileName){
        final String fileFolder = "C:\\upload\\file\\";
        Resource resource = new FileSystemResource(fileFolder + fileName);

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

package com.finalpj.nbw.mypage.controller;

import com.finalpj.common.FileUploader;
import com.finalpj.nbw.login.service.LoginService;
import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.mypage.service.MypageService;
import lombok.extern.log4j.Log4j;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;


@Log4j
@RequestMapping("/mypage/")
@Controller
public class MypageController {


    @Autowired
    private MypageService mypageService;

    @Autowired
    private LoginService loginService;

    @Autowired
    FileUploader fileUploader;

    @GetMapping("mypageTest")
    public String mypageTest(Member member, Model model) {
        log.info("member: " + member.getMem_id());
        return "/mypage/mypage";
    }

    /***************** [[마이페이지 참여중인 이벤트 조회페이지]] ***************/

    /* ========= 회원 정보 수정 페이지 GET ========= */
    @GetMapping("info")
    public String getMypageInfo(HttpSession session, HttpServletResponse response, Model model) throws Exception {
        Member member = (Member) session.getAttribute("member");
        String myId = member.getMem_id();
        Member myInfo = new Member();
        myInfo = mypageService.getMyInfo(myId);


        log.info("[[ 정보 수정 페이지 ]] member ====> "+ myInfo);

        String url = "";
        /* 로그인 된 사용자가 없으면 마이페이지로 이동 불가 =============> 후에 인터셉터 처리 */
        if (session.getAttribute("member") == null) {
            response.sendError(403, "로그인 후에 이용해 주세요. ");
        } else {
            url = "/mypage/info/mypageInfo";
        }
        return url;
        /* ==================================================> 후에 인터셉터 처리 */
    }

    /* ========= 회원 정보 수정 POST ========= */
    @PostMapping("modify")
    public String postMypageInfo(@ModelAttribute Member member, HttpServletRequest request) throws Exception {
        log.info("Controller 수정 요청 .......");
        log.info("수정할 멤버 ====> "+ member);
        log.info("====================== 내 정보 수정 처리 POST ======================= 수정할 아이디 ==> " + member.getMem_id());
        try{
            mypageService.postMyInfo(member);
            request.getSession().invalidate();
        } catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:/home";
    }


    /* ========= 회원 탈퇴 페이지 GET > 로그인 된 상태에서만 접근 가능 ========= */
    @GetMapping("remove")
    public String getRemovePage(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

        String userId = ((Member)(request.getSession().getAttribute("member"))).getMem_id();

        Member member = mypageService.getMyInfo(userId);
        model.addAttribute("member", member);

        String url = "";
        /* 로그인 된 사용자가 없으면 탈퇴 페이지로 이동 불가 ============ */
        if (request.getSession().getAttribute("member") == null) {
            response.sendError(403, "로그인 후에 이용해 주세요. ");
        } else {
            url = "/mypage/info/mypageDelete";
        }
        return url;
    }

    /* ========= 회원 탈퇴 POST =========
     * 로그인한 멤버 객체 불러옴
     * 사용자가 입력한 비밀번호, 기존 비밀번호 일치 여부 확인 > 변수에 담기
     * 일치할 경우에만 삭제 진행 */
    @PostMapping("remove")
    public String postRemove(Member vo, HttpServletRequest request ,HttpServletResponse response, RedirectAttributes rttr) throws Exception {
        log.info("회원탈퇴 POST 요청 .......................... ");
        String userId = ((Member)(request.getSession().getAttribute("member"))).getMem_id();

        Member member = mypageService.getMyInfo(userId); // 현재 세션에 있는 사용자 가져옴
        log.info("삭제할 member =====> "+ member);

        String sessionPw = member.getMem_pw(); // 세션 사용자의 비밀번호 가져옴
        String inputPw = request.getParameter("mem_pw"); // 사용자가 입력한 비밀번호 가져옴

        log.info("세션 비밀번호 ===> " +sessionPw);
        log.info("사용자가 입력한 비밀번호 ===> " +inputPw);

        boolean isEqualPw = loginService.passwordCheck(inputPw, sessionPw); // (1) 첫번째 = 입력한 값, 두 번째 = db값
        log.info("비밀번호 일치 여부 ===> " + isEqualPw);

        /* 일치하지 않을 경우에 false 반환 */
        if (!isEqualPw) {
            rttr.addFlashAttribute("msg", false);
            return "redirect:/mypage/remove";
        }

        /* 일치하면 탈퇴 */
        int intI = mypageService.delMem(member);
        log.info("회원 탈퇴 여부 =====> "+ intI);
        // 회원 정보 삭제 후 세션에 담긴 객체 정보 삭제
        request.getSession().removeAttribute("member");
        // 로그아웃
        request.getSession().invalidate();

        // 쿠키가 있다면 모두 삭제
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies){
            if(cookie.getName().equals(member.getMem_id())) {
                cookie.setMaxAge(0);
                cookie.setPath("/home");
                response.addCookie(cookie);
            }
        }
        return "redirect:/home";
    }


    /* ========= 회원 히스토리 GET ========= */
    @GetMapping("history")
    public String getHistory() {
    	return "/mypage/history";
    }
    
    @GetMapping("coupon")
    public String getCouponPage() throws IOException {
        return "/mypage/coupon";
    }

    /* 회원사진 등록 */
    @PostMapping("/photo")
    public String postImg(MultipartFile uploadFile, Model model, HttpSession session) throws Exception {

        Member member = (Member) session.getAttribute("member"); // 세션의 member 가져옴

//        Member myInfo = mypageService.getMyInfo(member.getMem_id());
        log.info(" [[MypageController]] 회원 사진 등록 요청!!! ===> 등록할 회원 정보 : "+ member);

        String path = "/myphoto";
        String original = uploadFile.getOriginalFilename();
        String saveFileName = "";
        log.info("Upload File Name : "+ original);

        /* fileUploader 객체를 통해 {uuid 가 포함된} DB 에 저장할 파일 이름을 반환받는다.
         * fileUploader 의 fileUpload 메서드에서 사진 저장 완료 > 경로 저장 확인 완료 */
        saveFileName= fileUploader.fileUpload(uploadFile, path);

        if(saveFileName != null){
            log.info("디비에 저장할 파일 이름 : "+ "/mypage/profile/"+saveFileName);

            /* member 객체에 이미지 설정해준다. */
            member.setMem_img(saveFileName);

            /* DB 에 저장한다. */
            try {
                /* 확인용  mem_id, mem_img */
                log.info(" 수정할 MEM_ID ==> " + member.getMem_id());
                log.info(" 수정할 MEM_IMG ==> " + member.getMem_img());

                int intI = mypageService.insMyImg(member);
                log.info("이미지 등록 여부 ===> " + intI);

                /* 정보가 변경 되었으니 세션에도 변경된 정보 추가 */
                session.setAttribute("member", member);

                model.addAttribute("success", "사진이 등록되었습니다. ");

            }catch (Exception e){
                e.printStackTrace();
            }

        }else{
            model.addAttribute("fail", "등록에 실패하였습니다. ");
            return "redirect:mypage/info";
        }
//        return "redirect:/mypage/info"; >> 수정 안들고 감
        return "/mypage/info/mypageInfo";
    }

    /* ********************************  사진 출력 (마이페이지) ******************************** */
    @GetMapping(value = "{mem_img:.+}")
    @ResponseBody
    public ResponseEntity<byte[]> getMemImg(@PathVariable String mem_img, HttpServletRequest request) throws Exception {

        log.info("/mypage/profile/"+ mem_img + "===> Get 요청!! ");
        Member member = (Member) request.getSession().getAttribute("member"); // 현재 로그인한 사용자
        log.info("현재 띄워줄 프로필 사진 ====> "+ member.getMem_img());

        log.info("mem_img ===> "+ mem_img);
        final String uploadRoot = System.getProperty("user.home");
        final String fileFolder = uploadRoot+"/Desktop/upload/myphoto/";

        File file = new File(fileFolder + mem_img);
        if(!file.exists())
            return  new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);

        ResponseEntity<byte[]> result = null;

        try {
            // 파일을 뷰로 전송하기 위해 전송정보를 담을 헤더 설정
            HttpHeaders headers = new HttpHeaders();

            String Type =  Files.probeContentType(file.toPath());
            headers.add("Type", Type);
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
        }catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

}

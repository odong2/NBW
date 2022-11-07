package com.finalpj.nbw.mypage.controller;

import com.finalpj.nbw.login.service.LoginService;
import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.mypage.service.MypageService;
import com.finalpj.nbw.qna.domain.Qna;
import com.finalpj.nbw.qna.service.QnaService;
import lombok.extern.log4j.Log4j;

//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;

@Log4j
@RequestMapping("/mypage/")
@Controller
public class MypageController {



        @Autowired
        private MypageService mypageService;

        @Autowired
        private LoginService loginService;

        @GetMapping("mypageTest")
        public String mypageTest(Member member, Model model){
            log.info("member: "+ member.getMem_id());
            return "/mypage/mypage";
        }

    /***************** [[마이페이지 참여중인 이벤트 조회페이지]] ***************/

        /* ========= 회원 정보 수정 페이지 GET ========= */
        @GetMapping("info")
        public String getMypageInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
            String url="";
            /* 로그인 된 사용자가 없으면 마이페이지로 이동 불가 =============> 후에 인터셉터 처리 */
                if (request.getSession().getAttribute("member") == null) {
                    response.sendError(403, "로그인 후에 이용해 주세요. ");
                }
                else{
                    url = "/mypage/mypageInfo";
                }
                return url;
            /* ==================================================> 후에 인터셉터 처리 */
        }

        /* ========= 회원 정보 수정 POST ========= */
        @PostMapping("info")
        public String postMypageInfo(HttpServletRequest request) throws Exception{
            Member member = (Member)request.getSession().getAttribute("member");
            log.info("====================== 내 정보 수정 처리 POST ======================= 수정할 아이디 ==> "+ member.getMem_id());
            int intI = mypageService.postMyInfo(member);
            return "redirect:info";
        }

        /* ========= 회원 탈퇴 페이지 GET > 로그인 된 상태에서만 접근 가능 ========= */
        @GetMapping("remove")
        public String getRemovePage(HttpServletRequest request, HttpServletResponse response) throws IOException {

            String url="";
            /* 로그인 된 사용자가 없으면 탈퇴 페이지로 이동 불가 =============> 후에 인터셉터 처리*/
                if (request.getSession().getAttribute("member") == null) {
                    response.sendError(403, "로그인 후에 이용해 주세요. ");
                }
                else{
                    url = "/mypage/mypageDelete";
                }
                return url;
            /* ==================================================> 후에 인터셉터 처리 */
        }


        /* ========= 회원 탈퇴 POST ========= */
        @PostMapping("remove")
        public String postRemove(HttpServletRequest request, RedirectAttributes rttr) throws Exception {
            Member member = (Member)request.getSession().getAttribute("member");
            String strPw = request.getParameter("mem_pw");
            log.info("사용자가 입력한 비밀번호 ===> "+ strPw);
            String voPw = member.getMem_pw();
            log.info("vo 비밀번호 ===> "+ voPw);
            boolean isEqualPw = loginService.passwordCheck(strPw, voPw);
            log.info("비밀번호 일치 여부 ===> "+ isEqualPw);

            /* 일치하지 않을 경우에 false 반환 */
            if(!isEqualPw){
                rttr.addFlashAttribute("msg", false);
                return "redirect:/mypage/remove";
            }

            /* 일치하면 탈퇴 */
            int intI = mypageService.delMem(member);
            // 회원 정보 삭제 후 세션에 담긴 객체 정보 삭제
            request.getSession().removeAttribute("member");
            // 로그아웃
            request.getSession().invalidate();
            return "redirect:/home";
        }



}

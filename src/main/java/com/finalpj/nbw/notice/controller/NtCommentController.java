package com.finalpj.nbw.notice.controller;

import com.finalpj.nbw.notice.domain.NtComment;
import com.finalpj.nbw.notice.service.NtCommentService;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
@Log4j
@RestController
@RequestMapping("/notice/*")
public class NtCommentController {

    NtCommentService ntCommentService;

    public NtCommentController(NtCommentService ntCommentService){
        this.ntCommentService = ntCommentService;
    }

    /*
    Postman 테스트
    {"ntc_pcno" : 0,"ntc_comment" : "test"}
    */
    /************************************** 댓글 등록 **************************************/
    @PostMapping("/comments")// noitce/comments?nt_no?1
    public ResponseEntity<String> writeComment(@RequestBody NtComment commentDto, Integer nt_no, HttpSession session){
        // String commenter = (String)session.getAttribute("mem_id"); --> 이후 세션에서 사용자의 아이디 받아와서 처리하도록 변경할 것
        String commenter = "admin";
        commentDto.setNtc_commenter(commenter);
        commentDto.setNt_no(nt_no);
        commentDto.setNtc_no(19); // 임시로 준 것. 이후 시퀀스로 변경
        log.info("commentDto = " + commentDto);
        try {
            if (ntCommentService.writeComment(commentDto) != 1) {
                throw new Exception("Write comment fail");
            }
            return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
        } catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }

    }

/*
{"ntc_pcno" : 0,"ntc_comment" : "hihihi","ntc_commenter" : "admin"}
*/
    /************************************** 댓글 삭제 **************************************/
    @DeleteMapping("/comments/{ntc_no}") // /comments/19?nt_no=1 (포스트맨에서 요청하여 확인)
    public ResponseEntity<String> removeComment(@PathVariable Integer ntc_no, Integer nt_no, HttpSession session){
        // String commenter = (String)session.getAttribute("mem_id"); --> 이후 세션에서 사용자의 아이디 받아와서 처리하도록 변경할 것
        String commenter = "admin";
        try{
            int rowCnt = ntCommentService.removeComment(ntc_no, nt_no, commenter);
            if (rowCnt != 1){
                throw new Exception("Delete comment fail");
            }
            return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
        } catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    /************************************** 댓글 수정 **************************************/
    @PatchMapping("/comments/{ntc_no}")// noitce/comments?nt_no?1
    public ResponseEntity<String> modifyComment(@PathVariable Integer ntc_no,@RequestBody NtComment commentDto, HttpSession session){
        // String commenter = (String)session.getAttribute("mem_id"); --> 이후 세션에서 사용자의 아이디 받아와서 처리하도록 변경할 것
        commentDto.setNtc_no(ntc_no);
        log.info(commentDto);
        try {
            if (ntCommentService.modifyComment(commentDto) != 1) {
                throw new Exception("Write comment fail");
            }
            return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
        } catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }

    }


}

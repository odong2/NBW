package com.finalpj.nbw.notice.controller;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.notice.domain.NtComment;
import com.finalpj.nbw.notice.service.NtCommentService;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j
@RestController
@RequestMapping("/notice/*")
public class NtCommentController {

    NtCommentService ntCommentService;

    public NtCommentController(NtCommentService ntCommentService){
        this.ntCommentService = ntCommentService;
    }

    /****************************** 특정 공지글의 모든 댓글 가져오는 메서드 *****************************/
    @GetMapping("/comments")
    public ResponseEntity<List<NtComment>> getCommentList(Integer nt_no){
        List<NtComment> list = null;
        try {
            list = ntCommentService.getCommentList(nt_no);
            return new ResponseEntity<List<NtComment>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<NtComment>>(list, HttpStatus.BAD_REQUEST);
        }
    }
    
    /************************************** 댓글 등록 **************************************/
    @PostMapping("/comments")// noitce/comments?nt_no=1
    public ResponseEntity<String> writeComment(@RequestBody NtComment commentDto, Integer nt_no, HttpSession session){
        Member member = (Member)session.getAttribute("member");
        String commenter = member.getMem_id();
        commentDto.setNtc_commenter(commenter);
        commentDto.setNt_no(nt_no);
        log.info("commentDto = " + commentDto);
        try {
            int writeResult = ntCommentService.writeComment(commentDto);
            // 댓글 등록 실패 시 Exception 발생
            if (writeResult != 1) {
                throw new Exception("Write comment fail");
            }
            return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
        } catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }

    }

    /************************************** 댓글 삭제 **************************************/
    @DeleteMapping("/comments/{ntc_no}") // /comments/19?nt_no=1 (포스트맨에서 요청하여 확인)
    public ResponseEntity<String> removeComment(@PathVariable Integer ntc_no, Integer nt_no, HttpSession session){
        Member member = (Member)session.getAttribute("member");
        String commenter = member.getMem_id();
        try{
            int rowCnt = ntCommentService.removeComment(ntc_no, nt_no, commenter);
            // 삭제 실패 시 Exception 발생
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
        Member member = (Member)session.getAttribute("member");
        String commenter = member.getMem_id();
        commentDto.setNtc_commenter(commenter);
        commentDto.setNtc_no(ntc_no);
        log.info(commentDto);
        try {
            int updateResult = ntCommentService.modifyComment(commentDto);
            // 댓글 수정에 실패하면 Exception 발생
            if (updateResult != 1) {
                throw new Exception("Write comment fail");
            }
            return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
        } catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }

    }
}

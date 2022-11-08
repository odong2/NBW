package com.finalpj.nbw.event.controller;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.event.domain.EventComment;
import com.finalpj.nbw.event.service.EventCommentService;
import com.finalpj.nbw.notice.domain.NtComment;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j
@RestController
@RequestMapping("/event/*")
public class EventCommentController {

    EventCommentService eventCommentService;

    public EventCommentController(EventCommentService eventCommentService){
        this.eventCommentService = eventCommentService;
    }

    /************************* [[디테일 페이지에서 댓글 조회]] *******************/
    @GetMapping("/comments")
    public ResponseEntity<List<EventComment>> getCommentList(Integer ev_no) {
        List<EventComment> list = null;
        try{
            list = eventCommentService.getCommentList(ev_no);
            return new ResponseEntity<List<EventComment>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<EventComment>>(list, HttpStatus.BAD_REQUEST);
        }
    }
    /************************* [[댓글 등록]] *******************/
    @PostMapping("/comments")// event/comments?nt_no=1
    public ResponseEntity<String> writeComment(@RequestBody EventComment eventComment, Integer ev_no, HttpSession session){
        Member member = (Member)session.getAttribute("member");
        String commenter = member.getMem_id();
        eventComment.setEvc_commenter(commenter);
        eventComment.setEvc_no(ev_no);
        log.info("eventComment = " + eventComment);
        try {
            int writeResult = eventCommentService.writeComment(eventComment);
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
    /*********************************** [[댓글 삭제]] ****************************/
    @DeleteMapping("/comments/{evc_no}") // /comments/19?nt_no=1 (포스트맨에서 요청하여 확인)
    public ResponseEntity<String> removeComment(@PathVariable Integer evc_no, Integer ev_no, HttpSession session){
        Member member = (Member)session.getAttribute("member");
        String commenter = member.getMem_id();
        try{
            int rowCnt = eventCommentService.removeComment(evc_no, ev_no, commenter);
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

    /*********************************************** [[댓글 수정]] *****************************************/
    @PatchMapping("/comments/{evc_no}")// noitce/comments?nt_no?1
    public ResponseEntity<String> modifyComment(@PathVariable Integer evc_no, @RequestBody EventComment eventComment, HttpSession session){
        Member member = (Member)session.getAttribute("member");
        String commenter = member.getMem_id();
        eventComment.setEvc_commenter(commenter);
        eventComment.setEvc_no(evc_no);
        log.info(eventComment);
        try {
            int updateResult = eventCommentService.modifyComment(eventComment);
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

package com.finalpj.nbw.event.controller;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.event.domain.EventComment;
import com.finalpj.nbw.event.service.EventCommentService;
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

    /****************************** [[댓글 등록]] *****************************************/
    @PostMapping("/comments")
    public ResponseEntity<String> evcWrite(@RequestBody EventComment eventCommentDto, Integer ev_no, HttpSession session){
        Member member = (Member) session.getAttribute("member");
        String evc_commenter = member.getMem_id();

        eventCommentDto.setEvc_commenter(evc_commenter);
        eventCommentDto.setEv_no(ev_no);
        log.info("eventCommentDto = " + eventCommentDto);
        try {
            if (eventCommentService.write(eventCommentDto) != 1) {
                throw new Exception("Write comment fail");
            }
            return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
        } catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }

    }

    // 댓글 삭제
    @DeleteMapping("/comments/{evc_no}")
    public ResponseEntity<String> evcremove(@PathVariable Integer evc_no, Integer ev_no, HttpSession session){
        Member member = (Member)session.getAttribute("member");
        String evc_commenter = member.getMem_id();
        //        String commenter = (String)session.getAttribute("id");
        try{
            int rowCnt = eventCommentService.remove(evc_no, ev_no, evc_commenter);

            if (rowCnt != 1){
                throw new Exception("Delete comment fail");
            }
            return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
        } catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //  댓글 수정
    @PatchMapping("/comments/{evc_no}")
    public ResponseEntity<String> modify(@PathVariable Integer evc_no,@RequestBody EventComment eventCommentDto, HttpSession session){
        Member member = (Member)session.getAttribute("member");
        String evc_commenter = member.getMem_id();
        eventCommentDto.setEvc_commenter(evc_commenter);
        eventCommentDto.setEvc_no(evc_no);
        try {
            if (eventCommentService.modify(eventCommentDto) != 1) {
                throw new Exception("Write comment fail");
            }
            return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
        } catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }

    }

}

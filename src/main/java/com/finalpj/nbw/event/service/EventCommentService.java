package com.finalpj.nbw.event.service;

import com.finalpj.nbw.event.dao.EventCommentDao;
import com.finalpj.nbw.event.dao.EventDao;
import com.finalpj.nbw.event.domain.EventComment;
import com.finalpj.nbw.notice.domain.NtComment;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
public class EventCommentService {
    EventDao eventDao;
    EventCommentDao eventCommentDao;

    public EventCommentService(EventCommentDao eventCommentDao, EventDao eventDao){
        this.eventCommentDao = eventCommentDao;
        this.eventDao = eventDao;
    }

    /************************* [[디테일 페이지에서 댓글 조회]] *******************/
    public List<EventComment> getCommentList(Integer ev_no) throws Exception {
        return eventCommentDao.selectCommentList(ev_no);
    }

    /************************* [[디테일 페이지에서 댓글 한건 조회]] *******************/
    public EventComment readComment(Integer evc_no) throws Exception {
        return eventCommentDao.selectComment(evc_no);
    }

    /************************* [[디테일 페이지에서 댓글 작성]] *******************/
    @Transactional(rollbackFor = Exception.class)
    public int writeComment(EventComment eventComment) throws Exception {

        eventDao.updateCommentCnt(eventComment.getEv_no(), 1); // 댓글수 1증가
        //throw new Exception("testException");                     // 실패하면 롤백
        return eventCommentDao.insertComment(eventComment);
    }
    /************************* [[디테일 페이지에서 댓글 삭제]] *******************/
    @Transactional(rollbackFor = Exception.class)
    public int removeComment(Integer evc_no, Integer ev_no, String evc_commenter) throws Exception {
        int rowCnt = eventDao.updateCommentCnt(ev_no, -1); // 댓글수 1 감소
        log.info("updateCommentCnt - rowCnt = " + rowCnt);
        rowCnt = eventCommentDao.deleteComment(evc_no, evc_commenter); // 댓글 삭제
        // 댓글 삭제가 성공하면 답글 삭제
        if(rowCnt > 0){
            eventCommentDao.deleteRepComment(evc_no);
        }
        return rowCnt;
    }

    /************************* [[디테일 페이지에서 댓글 수정]] *******************/
    public int modifyComment(EventComment eventComment) throws Exception {
        return eventCommentDao.updateComment(eventComment);
    }


}

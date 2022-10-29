package com.finalpj.nbw.event.service;

import com.finalpj.nbw.event.dao.EventCommentDao;
import com.finalpj.nbw.event.dao.EventCommentDaoTest;
import com.finalpj.nbw.event.dao.EventDao;
import com.finalpj.nbw.event.domain.EventComment;
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

    // 댓글 작성
    @Transactional(rollbackFor = Exception.class)
    public int write(EventComment eventCommentDto) throws Exception {
        eventDao.updateCommentCnt(eventCommentDto.getEv_no(), 1); // 댓글수 1증가
        //throw new Exception("testException");                     // 실패하면 롤백
        return eventCommentDao.insert(eventCommentDto);
    }
    // 댓글 삭제
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer evc_no, Integer ev_no, String evc_commenter) throws Exception {
        int rowCnt = eventDao.updateCommentCnt(ev_no, -1); // 댓글수 1 감소
        log.info("updateCommentCnt - rowCnt = " + rowCnt);
        rowCnt = eventCommentDao.delete(evc_no, evc_commenter); // 댓글 삭제
        log.info("rowCnt = " + rowCnt);
        return rowCnt;
    }
    // 특정 공지글의 댓글 모두 조회
    public List<EventComment> getList(Integer ev_no) throws Exception {
        return eventCommentDao.selectAll(ev_no);
    }
    // 댓글 한 건 조회
    public EventComment read(Integer evc_no) throws Exception {
        return eventCommentDao.select(evc_no);
    }
    // 댓글 수정
    public int modify(EventComment eventCommentDto) throws Exception {
        return eventCommentDao.update(eventCommentDto);
    }


}

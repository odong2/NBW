package com.finalpj.nbw.event.service;


import com.finalpj.nbw.event.dao.EventCommentDao;
import com.finalpj.nbw.event.dao.EventDao;
import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.domain.EventMember;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Log4j
@Service
public class EventService {
    private final EventDao eventDao;
    private final EventCommentDao eventCommentDao;


    public EventService(EventDao eventDao, EventCommentDao eventCommentDao){

        this.eventDao = eventDao;
        this.eventCommentDao = eventCommentDao;
    }

    /******************************** [[ 마이페이지 이벤트 조회 ]] ********************************/
    @Transactional(readOnly = true)
    public List<Event> mypageEventList(String id) throws Exception {
        log.info("EventService : mypageEventList 호출성공");
        List<Event> mypageEventList = null;
        mypageEventList = eventDao.mypageEventList(id);
        log.info("EventService : mypageEventList 호출성공");
        return mypageEventList;
    }

    /******************************** [[ 관리자 이벤트 조회 ]] ********************************/
    @Transactional(readOnly = true)
    public List<Event> adminEventList() throws Exception {
        log.info("EventService : adminEventList 호출성공");
        List<Event> adminEventList = null;
        adminEventList = eventDao.adminEventList();
        log.info("EventService : adminEventList 호출성공");
        return adminEventList;
    }
    /******************************* [[ 관리자 이벤트 한건 조회 ]] *******************************/
    @Transactional(readOnly = true)
    public Event adminEventRead(Integer ev_no) throws Exception {
        log.info("어드민 이벤트 서비스 호출");
        return eventDao.adminEventRead(ev_no);
    }
    /******************************* [[ 관리자 이벤트 신청자 조회 ]] *******************************/
    @Transactional(readOnly = true)
    public EventMember adminEventApplicant(Integer ev_no) throws Exception {
        log.info("어드민 이벤트 신청자 서비스 호출");
        return eventDao.adminEventApplicant(ev_no);
    }

    /********************************* [[이벤트 전체 조회]] **************************************/
    @Transactional(readOnly = true)
    public List<Event> eventList() throws Exception {
        log.info("EventService : 111111eventList 호출성공");
        List<Event> eventList = null;
        log.info("EventService : 22222eventList 호출성공");
        eventList = eventDao.eventList();
        log.info("EventService : 33333eventList 호출성공");
        return eventList;
    }

    /********************************* [[이벤트 한 건 조회]] **************************************/
    @Transactional(readOnly = true)
    public Event eventRead(Integer ev_no) throws Exception {
        log.info("이벤트 서비스 호출");
        return eventDao.eventRead(ev_no);
    }

    /********************************* [[이벤트 작성]] **************************************/
    @Transactional(rollbackFor = Exception.class)
    public int adminEventWrite(Event event) throws Exception{
        log.info("서비스 event 작성 호출 성공");
        return eventDao.adminEventWrite(event);
    }
    /********************************* [[회원 이벤트 신청]] **************************************/
    @Transactional(rollbackFor = Exception.class)
    public int eventAdd(EventMember eventMember) throws Exception{
        log.info("서비스 event 작성 호출 성공");
        int result = 0;
        int result2 = 0;
        result = eventDao.eventAdd(eventMember);
        if(result == 1){
            result2 = eventDao.updateEvPeople(eventMember);
        }
        return result2;
    }

    /********************************* [[관리자 이벤트 삭제]] **************************************/
    @Transactional(rollbackFor = Exception.class)
    public int adminEventDelete (Integer ev_no) throws Exception{
        log.info("서비스 Event 한건 삭제 호출");
        return eventDao.adminEventDelete(ev_no);
    }
//    public List<Event> getSearchResultPage(SearchCondition sc) throws Exception{
//        return eventDao.selectSearchPage(sc);
//    }
//    // 조건 검색 총 개수
//    public int getSearchResultCnt(SearchCondition sc) throws Exception{
//        return eventDao.selectSearchCnt(sc);
//    }


}

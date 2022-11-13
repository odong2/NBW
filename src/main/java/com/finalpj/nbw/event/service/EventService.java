package com.finalpj.nbw.event.service;


import com.finalpj.common.FileUploader;
import com.finalpj.nbw.event.dao.EventCommentDao;
import com.finalpj.nbw.event.dao.EventDao;
import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.domain.EventMember;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Log4j
@Service
public class EventService {
    private final EventDao eventDao;
    private final EventCommentDao eventCommentDao;

    private FileUploader fileUploader;


    @Autowired
    public EventService(EventDao eventDao, EventCommentDao eventCommentDao, FileUploader fileUploader){

        this.eventDao = eventDao;
        this.eventCommentDao = eventCommentDao;
        this.fileUploader =fileUploader;
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

    @Transactional(readOnly = true)
    public List<EventMember> adminMemberEvent(String id) throws Exception {
        log.info("EventService : adminMemberEvent 호출성공");
        List<EventMember> adminMemberEvent = null;
        adminMemberEvent = eventDao.adminMemberEvent(id);
        log.info("EventService : mypageEventList 호출성공");
        return adminMemberEvent;
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
        log.info("어드민 이벤트 서비스 호출"+ev_no);
        return eventDao.adminEventRead(ev_no);
    }

    /********************************* [[이벤트 한 건 조회]] **************************************/
    @Transactional(readOnly = true)
    public Event eventRead(Integer ev_no) throws Exception {
        log.info("이벤트 서비스 호출");
        return eventDao.eventRead(ev_no);
    }


    /********************************* [[관리자 이벤트 작성]] **************************************/
    @Transactional(rollbackFor = Exception.class)
    public int adminEventWrite(Event event) throws Exception{
//        if(event.getFiles() != null) {
//            System.out.println("파일존재함!");
//            String fileNames =  fileUploader.fileUpload(event.getFiles(),"event");
//            event.setFileNames(fileNames);
//        }
        log.info("서비스 event 작성 호출 성공"+event);
        return eventDao.adminEventWrite(event);
    }

    /******************************* [[ 관리자 이벤트 신청자 조회 ]] *******************************/
    @Transactional(readOnly = true)
    public List<EventMember> adminEventApplicant(Integer ev_no) throws Exception {
        log.info("admin 이벤트 신청자 서비스 호출 ");
        return eventDao.adminEventApplicant(ev_no);
    }
    /******************************* [[ 관리자 이벤트 신청자 거절 ]] *******************************/
    @Transactional(rollbackFor = Exception.class)
    public void adminEventPersonN (EventMember eventMember) throws Exception{
        log.info("서비스 Event 신청자 거절 호출");
        eventDao.adminEventPersonN(eventMember);
    }

    @Transactional(rollbackFor = Exception.class)
    public int updateStatusN (Integer ev_no) throws Exception{
        log.info("이벤트 상태 모집중으로 변경");
        return eventDao.updateStatusN(ev_no);
    }

    /******************************* [[ 관리자 이벤트 신청자 승인 ]] *******************************/
    @Transactional(rollbackFor = Exception.class)
    public void adminEventPersonY (EventMember eventMember) throws Exception{
        log.info("서비스 Event 신청자 승인 호출");
        eventDao.adminEventPersonY(eventMember);
    }

    @Transactional(rollbackFor = Exception.class)
    public int updatePersonY (EventMember eventMember) throws Exception{
        log.info("신청자 수 1증가");
        return eventDao.updatePersonY(eventMember);
    }

    @Transactional(rollbackFor = Exception.class)
    public int updateStatusY (Integer ev_no) throws Exception{
        log.info("이벤트 상태 마감으로 변경");
        return eventDao.updateStatusY(ev_no);
    }

    /********************************* [[관리자 이벤트 삭제]] **************************************/
    @Transactional(rollbackFor = Exception.class)
    public int adminEventDelete (Integer ev_no) throws Exception{
        log.info("서비스 Event 한건 삭제 호출");
        return eventDao.adminEventDelete(ev_no);
    }

    /********************************* [[이벤트 전체 조회]] **************************************/
    @Transactional(readOnly = true)
    public List<Event> eventList() throws Exception {
        List<Event> eventList = null;
        eventList = eventDao.eventList();
        return eventList;
    }


    /********************************* [[회원 이벤트 신청]] **************************************/
    @Transactional(rollbackFor = Exception.class)
    public int eventAdd(EventMember eventMember, Integer ev_no) throws Exception{
        log.info("서비스 event 작성 호출 성공");
        int result = 0; // 이벤트 신청
        result = eventDao.eventAdd(eventMember);
        return result;
    }



    /********************************* [[관리자 이벤트 수정]] **************************************/
    @Transactional(rollbackFor = Exception.class)
    public int adminModify (Event event) throws Exception{
        log.info("서비스 Event 한건 삭제 호출");
        return eventDao.adminModify(event);
    }


}

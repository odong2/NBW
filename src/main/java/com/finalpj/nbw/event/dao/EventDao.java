package com.finalpj.nbw.event.dao;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.domain.EventMember;

import java.util.List;

public interface EventDao {
    /****************************** 마이 페이지 이벤트 전체 조회 ***************************/
    List<Event> mypageEventList(String id) throws Exception;
    /****************************** 이벤트 전체 조회 ***************************/
    List<Event> eventList() throws Exception;
    /****************************** 이벤트 한건 조회 ***************************/
    Event eventRead(Integer ev_no) throws Exception;
    /****************************** 관리자 이벤트 조회 *************************/
    List<Event> adminEventList() throws Exception;
    /****************************** 관리자 이벤트 한건 조회 *********************/
    Event adminEventRead(Integer ev_no) throws Exception;
    /****************************** 관리자 이벤트 신청자 조회 *********************/
    EventMember adminEventApplicant(Integer ev_no) throws Exception;
    /****************************** 관리자 이벤트 삭제 ******************************/
    int adminEventDelete(Integer ev_no) throws Exception;

    /****************************** 이벤트 작성 ******************************/
    int adminEventWrite(Event event) throws Exception;
    /***************************** 이벤트 댓글 수 업데이트 ******************/
    int updateCommentCnt(Integer ev_no, int cnt) throws Exception;
    /***************************** 이벤트 신청 ***************************/
    int eventAdd(EventMember eventMember) throws Exception;

}

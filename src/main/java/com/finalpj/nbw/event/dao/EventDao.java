package com.finalpj.nbw.event.dao;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.notice.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface EventDao {
    /* 이벤트글 등록 */
    int insertEvent(Event event) throws Exception;
    /* 이번트글 수정 */
    int updateEvent(Event event) throws  Exception;
    /* 이벤트글 한건 삭제*/
    int deleteEvent(Integer ev_no) throws Exception;
    /* 이번트글 전체 삭제 */
    int deleteEventList() throws Exception;
    /* 이벤트글 한건 조회 */
    Event selectEvent(Integer ev_no) throws Exception;
    /* 이벤트글 전체 조회 */
    List<Event> selectEventList() throws  Exception;
    /* 조회수 증가 */
    int updateViewCnt(Integer ev_no) throws Exception;
    /* 전체 이벤트글 개수 */
    int selectEventCnt() throws Exception;
    /* 이벤트글 페이지 조회 */
    List<Event> selectEventPage(Map map) throws Exception;
    /* 조건검색 페이징 처리하여 조회 */
    List<Event> selectSearchPage(SearchCondition sc) throws Exception;
    /* 조건검색 결과 게시물 개수 */
    public int selectSearchCnt(SearchCondition sc) throws Exception;
}

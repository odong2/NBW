package com.finalpj.nbw.event.dao;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.notice.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface EventDao {
    int insert(Event eventDto) throws Exception; // 이벤트글 등록

    int update(Event eventDto) throws Exception; // 공지글 수정

    int delete(Integer ev_no) throws Exception; // 공지글 한 건 삭제

    int deleteAll() throws Exception; // 공지글 전체 삭제

    Event select(Integer ev_no) throws Exception; // 공지글 한건 조회


//    Event selectList(Integer ev_no) throws Exception;

    Event selectList(Integer ev_no) throws Exception;

    //공지글 전체 조회
    List<Event> eventList() throws Exception;

    int updateViewCnt(Integer ev_no) throws Exception; // 조회수 증가

    int selectCnt() throws Exception; // 전체 게시글 개수

    List<Event> selectPage(Map map) throws Exception; // 공지글 페이지 조회



//    List<Event> selectSearchPage(SearchCondition sc) throws Exception; // 조건 검색 페이징 처리하여 조회

//    int selectSearchCnt(SearchCondition sc) throws Exception; // 조건검색 결과 게시물 개수

    int updateCommentCnt(Integer ev_no, int ev_cocnt) throws Exception; // 댓글수 업데이트

}

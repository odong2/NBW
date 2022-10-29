package com.finalpj.nbw.event.dao;

import com.finalpj.nbw.event.domain.EventComment;

import java.util.List;

public interface EventCommentDao {
    int deleteAll(Integer ev_no) throws Exception;       // 특정 공지글 모든 댓글 삭제

    // 특정 댓글 삭제
    int deleteEventComment(Integer evc_no, String evc_commenter) throws Exception;

    // 특정 이벤트 모든 댓글 삭제
    int deletAll(Integer ev_no) throws Exception;

    int count(Integer ev_no) throws Exception;           // 특정 공지글 댓글 개수 조회
    int delete(Integer evc_no, String evc_commenter) throws Exception; // 특정 댓글 삭제
    int insert(EventComment EventCommentDto) throws Exception; // 댓글 등록
    List<EventComment> selectAll(Integer evc_no) throws Exception;
    EventComment select(Integer evc_no) throws Exception;   // 댓글 한 건 조회
    int update(EventComment eventCommentDto) throws Exception; // 댓글 수정
}

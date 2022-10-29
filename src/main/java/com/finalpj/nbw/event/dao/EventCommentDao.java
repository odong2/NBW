package com.finalpj.nbw.event.dao;

import com.finalpj.nbw.event.domain.EventComment;

import java.util.List;

public interface EventCommentDao {
    int count(Integer ev_no) throws Exception // T selectOne(String statement)
    ;
    int deleteAll(Integer ev_no) // int delete(String statement)
    ;
    int delete(Integer evc_no, String evc_commenter) throws Exception // int delete(String statement, Object parameter)
    ;
    int insert(EventComment eventCommentdto) throws Exception // int insert(String statement, Object parameter)
    ;
    List<EventComment> selectAll(Integer ev_no) throws Exception // List<E> selectList(String statement)
    ;
    EventComment select(Integer evc_no) throws Exception // T selectOne(String statement, Object parameter)
    ;
    int update(EventComment eventCommentDto) throws Exception // int update(String statement, Object parameter)
    ;
}

package com.finalpj.nbw.event.dao;

import com.finalpj.nbw.event.domain.EventComment;
import com.finalpj.nbw.notice.domain.NtComment;

import java.util.List;

public interface EventCommentDao {

    /**************************** [[댓글 모두 조회]] **************************/
    List<EventComment> selectCommentList(Integer evc_no) throws Exception;

    /**************************** [[댓글 한 건 조회]] **************************/
    EventComment selectComment(Integer evc_no) throws Exception;

    /**************************** [[특정 댓글 등록]] **************************/
    int insertComment(EventComment eventComment) throws Exception;

    /*********************** [[특정 공지글 모든 댓글 삭제]] ********************/
    int deleteCommentList(Integer ev_no) throws Exception;

    /*********************** [[특정 공지글 댓글 개수 조회]] ********************/
    int selectCommentCnt(Integer ev_no) throws Exception;

    /**************************** [[특정 댓글 삭제]] **************************/
    int deleteComment(Integer evc_no, String commenter) throws Exception;

    /**************************** [[특정 대댓글 삭제]] **************************/
    int deleteRepComment(Integer evc_no) throws Exception;

    /**************************** [[댓글 수정]] **************************/
    int updateComment(EventComment eventComment) throws Exception;
}

package com.finalpj.nbw.notice.dao;

import com.finalpj.nbw.notice.domain.Notice;
import com.finalpj.nbw.notice.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface NoticeDao {
    int insertNotice(Notice noticeDto) throws Exception; // 공지글 등록

    int updateNotice(Notice noticeDto) throws Exception; // 공지글 수정

    int deleteNotice(Integer nt_no) throws Exception; // 공지글 한 건 삭제

    int deleteNoticeAll() throws Exception; // 공지글 전체 삭제

    Notice selectNotice(Integer nt_no) throws Exception; // 공지글 한건 조회

    List<Notice> selectNoticeList() throws Exception; // 공지글 전체 조회

    int updateViewCnt(Integer nt_no) throws Exception; // 조회수 증가

    int selectNoticeCnt() throws Exception; // 전체 게시글 개수

    List<Notice> selectNoticePage(Map map) throws Exception; // 공지글 페이지 조회


    List<Notice> selectSearchPage(SearchCondition sc) throws Exception; // 조건 검색 페이징 처리하여 조회

    int selectSearchCnt(SearchCondition sc) throws Exception; // 조건검색 결과 게시물 개수

    int updateCommentCnt(Integer nt_no, int cnt) throws Exception; // 댓글수 업데이트

}

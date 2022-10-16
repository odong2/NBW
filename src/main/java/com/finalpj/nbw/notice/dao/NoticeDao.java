package com.finalpj.nbw.notice.dao;

import com.finalpj.nbw.notice.domain.Notice;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface NoticeDao {
    int insertNotice(Notice noticeDto) throws Exception; // 공지글 등록

    int updateNotice(Notice noticeDto) throws Exception; // 공지글 수정

    int deleteNotice(Integer nt_no) throws Exception; // 공지글 한 건 삭제

    int deleteNoticeList() throws Exception; // 공지글 전체 삭제

    Notice selectNotice(Integer nt_no) throws Exception; // 공지글 한건 조회

    List<Notice> selectNoticeList() throws Exception; // 공지글 전체 조회
    
    int updateViewCnt(Integer nt_no) throws Exception; // 조회수 증가

    int selectNoticeCnt() throws Exception; // 전체 게시글 개수

    List<Notice> selectNoticePage(Map map) throws Exception; // 공지글 페이지 조회

}

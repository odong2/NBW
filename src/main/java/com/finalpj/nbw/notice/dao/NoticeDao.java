package com.finalpj.nbw.notice.dao;

import com.finalpj.nbw.notice.domain.Notice;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;

public interface NoticeDao {
    int insertNotice(Notice noticeDto) throws Exception; // 공지글 등록

    int updateNotice(Notice noticeDto) throws Exception; // 공지글 수정

    int deleteNotice(Integer nt_no) throws Exception; // 공지글 한 건 삭제

    int deleteNoticeList() throws Exception; // 공지글 전체 삭제

    Notice selectNotice(Integer nt_no) throws Exception; // 공지글 한건 조회

    List<Notice> selectNoticeList() throws Exception; // 공지글 전체 조회


}

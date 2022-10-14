package com.finalpj.nbw.notice.dao;

import com.finalpj.nbw.notice.domain.Notice;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;

public interface NoticeDao {
    int insertNotice(Notice noticeDto) throws Exception; // 공지사항 등록

    int updateNotice(Notice noticeDto) throws Exception; // 공지사항 수정

    int deleteNotice(Notice noticeDto) throws Exception; // 공지사항 한 건 삭제

    int deleteAllNotice() throws Exception; // 공지사항 전체 삭제

    Notice selectNoticeOne(); // Notice 한건 조회

    ArrayList<Notice> selectNoticeList(); // Notice 전체 조회


}

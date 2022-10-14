package com.finalpj.nbw.notice.repository;

import com.finalpj.nbw.notice.dao.NoticeDao;
import com.finalpj.nbw.notice.domain.Notice;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
@Log4j
@Repository
public class NoticeDaoImpl implements NoticeDao {

    @Autowired
    private SqlSession sqlSession;


    @Override
    public int insertNotice(Notice noticeDto) throws Exception {
        return sqlSession.insert("insert", noticeDto);
    }

    @Override
    public int updateNotice(Notice noticeDto) throws Exception {
        return 0;
    }

    @Override
    public int deleteNotice(Notice noticeDto) throws Exception {
        return 0;
    }

    @Override
    public int deleteAllNotice() throws Exception {
        return 0;
    }

    @Override
    public Notice selectNoticeOne() {
        return null;
    }

    @Override
    public ArrayList<Notice> selectNoticeList() {
        return null;
    }
}

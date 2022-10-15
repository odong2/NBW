package com.finalpj.nbw.notice.repository;

import com.finalpj.nbw.notice.dao.NoticeDao;
import com.finalpj.nbw.notice.domain.Notice;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Log4j
@Repository
public class NoticeDaoImpl implements NoticeDao {

    @Autowired
    private SqlSession sqlSession;

    /* ========================== 공지글 등록 ============================*/
    @Override
    public int insertNotice(Notice noticeDto) throws Exception {
        return sqlSession.insert("insertNotice", noticeDto);
    }
    /* ========================== 공지글 수정 ============================*/
    @Override
    public int updateNotice(Notice noticeDto) throws Exception {
        return sqlSession.update("updateNotice", noticeDto);
    }
    /* ========================== 공지글 한 건 삭제 ============================*/
    @Override
    public int deleteNotice(Integer nt_no) throws Exception {
        return sqlSession.delete("deleteNotice", nt_no);
    }
    /* ========================== 공지글 전체 삭제 ============================*/
    @Override
    public int deleteNoticeList() throws Exception {
        return sqlSession.delete("deleteNoticeList");
    }

    @Override
    public Notice selectNotice(Integer nt_no) throws Exception{
        return sqlSession.selectOne("selectNotice", nt_no);
    }
    @Override
    public List<Notice> selectNoticeList() throws Exception{
        return sqlSession.selectList("selectNoticeList");
    }
}

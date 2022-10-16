package com.finalpj.nbw.notice.repository;

import com.finalpj.nbw.notice.dao.NoticeDao;
import com.finalpj.nbw.notice.domain.Notice;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Log4j
@Repository
public class NoticeDaoImpl implements NoticeDao {

    private SqlSession sqlSession;

    public NoticeDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

    /****************************** 공지글 등록 ********************************/
    @Override
    public int insertNotice(Notice noticeDto) throws Exception {
        return sqlSession.insert("insertNotice", noticeDto);
    }

    /***************************** 공지글 수정 ********************************/
    @Override
    public int updateNotice(Notice noticeDto) throws Exception {
        return sqlSession.update("updateNotice", noticeDto);
    }

    /*************************** 공지글 한 건 삭제 ******************************/
    @Override
    public int deleteNotice(Integer nt_no) throws Exception {
        return sqlSession.delete("deleteNotice", nt_no);
    }

    /*************************** 공지글 전체 삭제 ******************************/
    @Override
    public int deleteNoticeList() throws Exception {
        return sqlSession.delete("deleteNoticeList");
    }

    /*************************** 공지글 한 건 조회 ******************************/
    @Override
    public Notice selectNotice(Integer nt_no) throws Exception{
        return sqlSession.selectOne("selectNotice", nt_no);
    }

    /*************************** 공지글 전체 조회 ******************************/
    @Override
    public List<Notice> selectNoticeList() throws Exception{
        return sqlSession.selectList("selectNoticeList");
    }

    /*************************** 공지글 조회수 증가 ******************************/
    @Override
    public int updateViewCnt(Integer nt_no) throws Exception{
        return sqlSession.update("updateViewCnt",nt_no);
    }

    /**************************** 공지글 전체 개수 *******************************/
    @Override
    public int selectNoticeCnt() throws Exception{
        return sqlSession.selectOne("selectNoticeCnt");
    }
    /*************************** 페이지 게시물 조회 *****************************/
    @Override
    public List<Notice> selectNoticePage(Map map) throws Exception{
        return sqlSession.selectList("selectNoticePage", map);
    }
}

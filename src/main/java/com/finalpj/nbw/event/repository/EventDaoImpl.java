package com.finalpj.nbw.event.repository;

import com.finalpj.nbw.event.dao.EventDao;
import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.domain.SearchCondition;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Repository
public class EventDaoImpl implements EventDao {

    private SqlSession sqlSession;

    public EventDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

    /****************************** 공지글 등록 ********************************/
    @Override
    public int insert(Event eventDto) throws Exception {
        return sqlSession.insert("insertEvent", eventDto);
    }

    /***************************** 공지글 수정 ********************************/
    @Override
    public int update(Event eventDto) throws Exception {
        return sqlSession.update("updateEvent", eventDto);
    }

    // 공지글 한 건 삭제
    @Override
    public int delete(Integer ev_no) throws Exception {
        return sqlSession.delete("deleteEvent", ev_no);
    }

    // 공지글 전체 삭제
    @Override
    public int deleteAll() throws Exception {
        return sqlSession.delete("deleteEventAll");
    }

    // 공지글 한 건 조회
    @Override
    public Event select(Integer ev_no) throws Exception{
        return sqlSession.selectOne("selectEvent", ev_no);
    }

    // 공지글 전체 조회
    @Override
    public List<Event> selectList() throws Exception{
        return sqlSession.selectList("selectEventList");
    }

    // 공지글 조회수 증가
    @Override
    public int updateViewCnt(Integer ev_no) throws Exception{
        return sqlSession.update("updateViewCnt",ev_no);
    }

    // 공지글 전체 개수
    @Override
    public int selectCnt() throws Exception{
        return sqlSession.selectOne("selectEventCnt");
    }
    // 페이지 게시물 조회
    @Override
    public List<Event> selectPage(Map map) throws Exception{
        return sqlSession.selectList("selectEventPage", map);
    }

    // 조건검색 페이징 처리하여 조회
    @Override
    public List<Event> selectSearchPage(SearchCondition sc) throws Exception{
        return sqlSession.selectList("selectSearchPage", sc);
    }

    // 조건검색 결과 게시물 개수
    @Override
    public int selectSearchCnt(SearchCondition sc) throws Exception{
        return sqlSession.selectOne("selectSearchCnt", sc);
    }
    // 조건검색 결과 게시물 개수
    @Override
    public int updateCommentCnt (Integer ev_no, int ev_cocnt) throws Exception{
        Map map = new HashMap();
        map.put("ev_no",ev_no);
        map.put("ev_cocnt", ev_cocnt);
        return sqlSession.update("updateCommentCnt", map);
    }
}

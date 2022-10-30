package com.finalpj.nbw.event.repository;

import com.finalpj.nbw.event.dao.EventDao;
import com.finalpj.nbw.event.domain.Event;
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
    /****************************** [[이벤트 전체조회]] **********************************/
    public List<Event> eventList() {
        List<Event> eventList = null;
        eventList = sqlSession.selectList("eventListAll");
        return eventList;
    }
    /****************************** [[이벤트 전체조회]] **********************************/
    /****************************** [[이벤트 한건 조회]] **********************************/
    /****************************** [[이벤트 한건 조회]] **********************************/

    /****************************** [[공지글 등록]] ***************************/
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
    // 조건검색 결과 게시물 개수
    @Override
    public int updateCommentCnt (Integer ev_no, int ev_cocnt) throws Exception{
        Map map = new HashMap();
        map.put("ev_no",ev_no);
        map.put("ev_cocnt", ev_cocnt);
        return sqlSession.update("updateCommentCnt", map);
    }
}

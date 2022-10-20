package com.finalpj.nbw.event.repository;

import com.finalpj.nbw.event.dao.EventDao;
import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.notice.domain.Notice;
import com.finalpj.nbw.notice.domain.SearchCondition;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Log4j
@Repository
public class EventDaoImpl implements EventDao {

    private SqlSession sqlSession;

    public EventDaoImpl(SqlSession sqlSession){this.sqlSession = sqlSession;}

    /* 이벤트 등록 */
    @Override
    public int insertEvent(Event eventDto) throws Exception {
        return sqlSession.insert("insertEvent", eventDto);
    }

    /* 이벤트 수정 */
    @Override
    public int updateEvent(Event eventDto) throws Exception {
        return sqlSession.update("updateEvent", eventDto);
    }

    /* 이벤트글 한건 삭제 */
    @Override
    public int deleteEvent(Integer ev_no) throws Exception {
        return  sqlSession.delete("deleteEvent", ev_no);
    }

    /* 이벤트글 전체 삭제 */
    @Override
    public int deleteEventList() throws Exception {
        return sqlSession.delete("deleteEventList");
    }

    /* 이벤트글 한 건 조회 */
    @Override
    public Event selectEvent(Integer ev_no) throws Exception{
        return sqlSession.selectOne("selectEvent", ev_no);
    }

    /* 이벤트글 전체 조회 */
    @Override
    public List<Event> selectEventList() throws Exception{
        return sqlSession.selectList("selectEventList");
    }

    /* 이벤트글 조회수 증가 */
    @Override
    public int updateViewCnt(Integer ev_no) throws Exception{
        return sqlSession.update("updateViewCnt",ev_no);
    }

    /* 공지글 전체 개수 */
    @Override
    public int selectEventCnt() throws Exception{
        return sqlSession.selectOne("selectEventCnt");
    }

    /* 페이지 게시물 조회 */
    @Override
    public List<Event> selectEventPage(Map map) throws Exception{
        return sqlSession.selectList("selectEventPage", map);
    }

    /* 조건검색 페이징 처리하여 조회 */
    @Override
    public List<Event> selectSearchPage(SearchCondition sc) throws Exception{
        return sqlSession.selectList("selectSearchPage", sc);
    }

    /* 조건검색 결과 게시물 개수 */
    @Override
    public int selectSearchCnt(SearchCondition sc) throws Exception{
        return sqlSession.selectOne("selectSearchCnt", sc);
    }

}

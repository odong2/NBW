package com.finalpj.nbw.event.repository;

import com.finalpj.nbw.event.dao.EventDao;
import com.finalpj.nbw.event.domain.Event;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Repository
public class EventDaoImpl implements EventDao {

    private SqlSession sqlSession;

    private final String namespace = "com.finalpj.nbw.event.dao.EventMapper.";

    public EventDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    /****************************** [[마이페이지 이벤트 전체조회]] **********************************/
    @Override
    public List<Event> mypageEventList(String id) throws Exception {
        log.info("EventDao : 11111111mypageEventList 호출 성공");
        List<Event> mypageEventList = null;
        log.info("EventDao : 22222222mypageEventList 호출 성공");
        mypageEventList = sqlSession.selectList(namespace+"myEventSelectAll", id);
        log.info("EventDao : 33333333mypageEventList 호출 성공" + mypageEventList);
        return mypageEventList;
    }

    /****************************** [[이벤트 전체조회]] **********************************/
    @Override
    public List<Event> eventList() throws Exception {
        log.info("EventDao : 11111111eventList 호출 성공");
        List<Event> eventList = null;
        log.info("EventDao : 22222222eventList 호출 성공");
        eventList = sqlSession.selectList(namespace+"eventSelectAll");
        log.info("EventDao : 33333333eventList 호출 성공" + eventList);
        return eventList;
    }
    /****************************** [[이벤트 한건 조회]] **********************************/
    @Override
    public Event eventRead(Integer ev_no) throws Exception {
        return sqlSession.selectOne(namespace+"eventSelect", ev_no);
    }
    /****************************** [[ 관리자 이벤트 조회]] ****************************/
    @Override
    public List<Event> adminEventList() throws Exception {
        List<Event> adminEventList = null;
        adminEventList = sqlSession.selectList(namespace+"eventSelectAll");
        log.info("EventDao : adminEventList 호출 성공" + adminEventList );
        return adminEventList;
    }
    /******************************* [[ 관리자 이벤트 한건 조회 ]] ************************/
    @Override
    public Event adminEventRead(Integer ev_no) throws Exception {
        return sqlSession.selectOne(namespace+"eventSelect", ev_no);
    }
    /****************************** [[ 관리자 이벤트 삭제]] ***************************/
    @Override
    public int  adminEventDelete(Integer ev_no) throws Exception {
        log.info("다오인폴 event 한건 삭제");
        return sqlSession.delete(namespace+"adminEventDelete", ev_no);
    }

    /****************************** [[이벤트 등록]] ***************************/
    @Override
    public int adminEventWrite(Event event) throws Exception {
        log.info("event 다오인플 호출 성공");
        return sqlSession.insert(namespace+"eventInsert", event);
    }

    /************************** [[조건검색 결과 게시물 개수]] ****************************/
    @Override
    public int updateCommentCnt (Integer ev_no, int cnt) throws Exception{
        Map map = new HashMap();
        map.put("ev_no",ev_no);
        map.put("cnt", cnt);
        return sqlSession.update(namespace+"updateCommentCnt", map);
    }
}

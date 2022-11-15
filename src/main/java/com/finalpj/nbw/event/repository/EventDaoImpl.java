package com.finalpj.nbw.event.repository;

import com.finalpj.nbw.event.dao.EventDao;
import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.event.domain.EventMember;
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
        mypageEventList = sqlSession.selectList(namespace+"myEventSelectAll",id);
        log.info("EventDao : 33333333mypageEventList 호출 성공" + mypageEventList);
        return mypageEventList;
    }

    @Override
    public List<EventMember> adminMemberEvent(String id) throws Exception {
        List<EventMember> adminMemberEvent = null;
        adminMemberEvent = sqlSession.selectList(namespace+"adminMemberEvent",id);
        return adminMemberEvent;
    }

    /****************************** [[이벤트 전체조회]] **********************************/
    @Override
    public List<Event> eventList() throws Exception {
        List<Event> eventList = null;
        eventList = sqlSession.selectList(namespace+"eventSelectAll");
        log.info("EventDao : 33333333eventList 호출 성공" + eventList);
        return eventList;
    }
    /****************************** [[이벤트 한건 조회]] **********************************/
    @Override
    public Event eventRead(Integer ev_no) throws Exception {
        return sqlSession.selectOne(namespace+"eventSelect", ev_no);
    }

    @Override
    public Event selectCheckMem(Integer ev_no) throws Exception {
        return sqlSession.selectOne(namespace+"selectCheckMem", ev_no);
    }

    @Override
    public Event selectEvent(Integer ev_no) throws Exception {
        return sqlSession.selectOne(namespace+"selectEvent", ev_no);
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
        log.info("이벤트 한건 다오 인플 호출 성공"+ev_no);
        return sqlSession.selectOne(namespace+"eventSelect", ev_no);
    }
    /******************************* [[ 관리자 이벤트 신청자 조회 ]] ************************/
    @Override
    public List<EventMember> adminEventApplicant(Integer ev_no) throws Exception {
        log.info("이벤트 신청자 다오 인플 호출 성공"+ev_no);
        return sqlSession.selectList(namespace+"adminPerson", ev_no);
    }

    /* 테스트 */
    @Override
    public List<EventMember> memberEventStatus(EventMember eventMember) throws Exception {
        log.info("다오인폴 event 승인"+eventMember);
        return sqlSession.selectList(namespace+"memberEventStatus", eventMember);
    }


    /****************************** [[ 관리자 이벤트 수정]] ***************************/
    @Override
    public int adminModify(Event event) throws Exception {
        log.info("관리자 event 수정 다오인플 호출 성공");
        return sqlSession.update(namespace+"adminModify", event);
    }
    /******************************* [[ 관리자 이벤트 신청자 거절 ]] ************************/
    @Override
    public void adminEventPersonN(EventMember eventMember) throws Exception {
        log.info("다오인폴 event 거절"+eventMember);
        sqlSession.update(namespace+"adminEventPersonN", eventMember);
    }
    /******************************* [[ 관리자 이벤트 신청자 승인 ]] ************************/
    @Override
    public void adminEventPersonY(EventMember eventMember) throws Exception {
        log.info("다오인폴 event 승인"+eventMember);
        sqlSession.update(namespace+"adminEventPersonY", eventMember);
    }

    @Override
    public int updatePersonY(EventMember eventMember) throws Exception {
        log.info("다오인플 신청수 +1");
        return sqlSession.update(namespace+"updatePersonY", eventMember.getEv_no());
    }

    /****************************** [[ 관리자 이벤트 삭제]] ***************************/
    @Override
    public int  adminEventDelete(Integer ev_no) throws Exception {
        log.info("다오인폴 event 한건 삭제");
        return sqlSession.delete(namespace+"adminEventDelete", ev_no);
    }

    @Override
    public int  memberEventDelete (Integer ev_no) throws Exception {
        log.info("다오인폴 이벤트 신청 정보 삭제");
        return sqlSession.delete(namespace+"memberEventDelete", ev_no);
    }


    /******************************* [[ 이벤트 신청 ]] *******************************/
    @Override
    public int eventAdd(EventMember eventMember) throws Exception {
        log.info("event 다오인플 신청 호출 성공");
        return sqlSession.insert(namespace+"eventAdd", eventMember);
    }
    @Override
    public int memberEventCnt(EventMember eventMember) throws Exception {
        return sqlSession.selectOne(namespace+"memberEventCnt");
    }

    /****************************** [[이벤트 등록]] ***************************/
    @Override
    public int adminEventWrite(Event event) throws Exception {
        log.info("event 다오인플 호출 성공"+event);
        return sqlSession.insert(namespace+"eventInsert", event);
    }

    /****************************** [[이벤트 상태 변경]] *******************************/
    // EV_STATUS = Y : 이벤트 상태 = 마감
    @Override
    public int updateStatusY(Integer ev_no) throws Exception {
        return sqlSession.update(namespace+"updateStatusY", ev_no);
    }
    // EV_STATUS = N : 이벤트 상태 = 모집중
    @Override
    public int updateStatusN(Integer ev_no) throws Exception {
        return sqlSession.update(namespace+"updateStatusN", ev_no);
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

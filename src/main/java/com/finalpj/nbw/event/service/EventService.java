package com.finalpj.nbw.event.service;


import com.finalpj.nbw.event.dao.EventCommentDao;
import com.finalpj.nbw.event.dao.EventDao;
import com.finalpj.nbw.event.domain.Event;
import lombok.extern.log4j.Log4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Log4j
@Service
public class EventService {
    private final EventDao eventDao;
    private final EventCommentDao eventCommentDao;

    Logger logger = LoggerFactory.getLogger(EventService.class);

    public EventService(EventDao eventDao, EventCommentDao eventCommentDao){
        this.eventDao = eventDao;
        this.eventCommentDao = eventCommentDao;
    }
    /********************************* [[이벤트 전체 조회]] **************************************/
    @Transactional(readOnly = true)
    public List<Event> eventList() throws Exception{
        List<Event> eventList = null;
        logger.info("EventService : eventList 호출성공"+eventList);
        return eventList;
    }
    /********************************* [[이벤트 전체 조회]]  **************************************/
    /********************************* [[이벤트 한 건 조회]] **************************************/
    /********************************* [[이벤트 한 건 조회]] **************************************/



    // 공지글 작성
    @Transactional(rollbackFor = Exception.class)
    public int write(Event eventDto) throws Exception{
        return eventDao.insert(eventDto);
    }
    // 공지글 수정
    @Transactional(rollbackFor = Exception.class)
    public int modify(Event eventDto) throws Exception{
        return eventDao.update(eventDto);
    }
    // 공지글 한 건 삭제
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer ev_no) throws Exception{
        return eventDao.delete(ev_no);
    }
    // 공지글 전체 삭제
    @Transactional(rollbackFor = Exception.class)
    public int removeAll() throws Exception{
        return eventDao.deleteAll();
    }

    // 공지글 조회수 증가
    @Transactional(rollbackFor = Exception.class)
    public int increaseViewCnt(Integer ev_no) throws Exception{
        return eventDao.updateViewCnt(ev_no);
    }
    // 공지글 총 개수 조회 ****************************/
    public int getTotalCnt() throws Exception{
        return eventDao.selectCnt();
    }

    // 조건 검색 페이지
    public List<Event> getPageList(Map map) throws Exception{
        return eventDao.selectPage(map);
    }


//    public List<Event> getSearchResultPage(SearchCondition sc) throws Exception{
//        return eventDao.selectSearchPage(sc);
//    }
//    // 조건 검색 총 개수
//    public int getSearchResultCnt(SearchCondition sc) throws Exception{
//        return eventDao.selectSearchCnt(sc);
//    }


}

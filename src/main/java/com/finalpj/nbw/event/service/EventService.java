package com.finalpj.nbw.event.service;

import com.finalpj.nbw.event.dao.EventDao;
import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.notice.domain.Notice;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Log4j
@Service
public class EventService {

    private final EventDao eventDao;

    public EventService(EventDao eventDao) { this.eventDao=eventDao;}

    /* 공지글 입력 */
    @Transactional(rollbackFor = Exception.class)
    public int registEvent(Event eventDto) throws Exception{
        return eventDao.insertEvent(eventDto);
    }
    /* 공지글 수정 */
    @Transactional(rollbackFor = Exception.class)
    public int modifyEvent(Event EventDto) throws Exception{
        return eventDao.updateEvent(eventDto);
    }
    /* 공지글 한 건 삭제 */
    @Transactional(rollbackFor = Exception.class)
    public int removeNotice(Integer ev_no) throws Exception{
        return EventDao.deleteEvent(ev_no);
    }
    /* 공지글 전체 삭제 */
    @Transactional(rollbackFor = Exception.class)
    public int removeAllEvent() throws Exception{
        return EventDao.deleteEventList();
    }
    /* 공지글 한 건 조회  + 조회수 증가 */
    @Transactional(readOnly = true)
    public Event getEvent(Integer ev_no) throws Exception{
        Event EventDto = EventDao.selectEvent(ev_no);
        EventDao.updateViewCnt(nt_no);

        return noticeDto;
    }
    /* 공지글 전체 조회 */
    @Transactional(readOnly = true)
    public List<Notice> getAllEvent() throws Exception{
        return EventDao.selectEventList();
    }

    /* 공지글 조회수 증가 */
    @Transactional(rollbackFor = Exception.class)
    public int increaseViewCnt(Integer ev_no) throws Exception{
        return EventDao.updateViewCnt(ev_no);
    }
    public int getEventTotalCnt() throws Exception{
        return EventDao.selectEventCnt();
    }

    /* 페이지 게시물 조회 */
    public List<Notice> getPageEventList(Map map) throws Exception{
        return EventDao.selectEventPage(map);
    }
}

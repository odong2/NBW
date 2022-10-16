package com.finalpj.nbw.dao;

import com.finalpj.nbw.notice.dao.NoticeDao;
import com.finalpj.nbw.notice.domain.Notice;
import com.finalpj.nbw.notice.domain.SearchCondition;
import com.finalpj.nbw.notice.service.NoticeService;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;

import java.util.List;

import static org.junit.Assert.*;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeDaoTest {

    @Autowired
    DataSource ds;

    @Autowired
    NoticeDao noticeDao;
    @Test
    /* ========================= 공지글 등록 테스트 ============================*/
    public void noticeInsertTest() throws Exception{
        Notice noticeDto = new Notice();
        noticeDto.setNt_no(1); // -- 테스트 중이므로 이후 시퀀스로 변경
        noticeDto.setNt_title("공지글 제목 테스트");
        noticeDto.setNt_content("공지글 내용 테스트");
        assertTrue(noticeDao.insertNotice(noticeDto) == 1);
    }
    
    @Test
    /* ========================= 공지글 수정 테스트 ============================*/
    public void noticeUpdateTest() throws Exception{
        Notice noticeDto = new Notice();
        noticeDto.setNt_title("공지글 제목 수정 테스트");
        noticeDto.setNt_content("공지글 내요 수정 테스트");
        noticeDto.setNt_no(47);
        assertTrue(noticeDao.updateNotice(noticeDto) == 1);
    }

    @Test
    /* ====================== 공지글 한건 삭제 테스트 =========================*/
    public void removeNoticeTest() throws Exception{
        int nt_no = 47;
        assertTrue(noticeDao.deleteNotice(nt_no) == 1);
    }

    @Test
    /* ====================== 공지글 전체 삭제 테스트 =========================*/
    public void removeAllNoticeTest() throws Exception{
        assertTrue(noticeDao.deleteNoticeList() > 0);
    }
    @Test
    /* ====================== 공지글 한 건 조회 테스트 =========================*/
    public void getNoticeTest() throws Exception{
        Notice noticeDto = new Notice();
        int nt_no = 47;
        noticeDto = noticeDao.selectNotice(nt_no);
        log.info("47번 공지글 조회 결과 : " + noticeDto);
        assertNotEquals(noticeDto, null);
    }
    @Test
    /* ====================== 공지글 전체 조회 테스트 =========================*/
    public void getAllNoticeTest() throws Exception{
        List<Notice> noticeList = null;
        noticeList= noticeDao.selectNoticeList();
        log.info("공지글 전체 조회 결과 : " + noticeList);
        assertNotEquals(noticeList, null);
    }

    @Test
    /* ====================== 공지글 조회수 증가 =========================*/
    public void updateViewCntTest() throws Exception{
        int result = noticeDao.updateViewCnt(47);
        assertNotEquals(result, 0);
    }

    @Test
    /* ====================== 공지글 전체 개수 =========================*/
    public void selectNoticeCntTest() throws Exception{
        int totallCnt = noticeDao.selectNoticeCnt();
        log.info("공지글의 총 게시글 개수는 : " + totallCnt + "개 입니다");
    }

    /* ====================== 조건 검색 테스트 =========================*/
    @Test
    public void selectSearchPageTest() throws Exception{
        noticeDao.deleteNoticeList();
        for(int i =1; i<=20; i++){
            Notice noticeDto = new Notice(i, "공지사항 제목"+i, "테스트");
            noticeDao.insertNotice(noticeDto);
        }
        SearchCondition sc = new SearchCondition(1, 10, "공지사항 제목2", "T");
        List<Notice> list = noticeDao.selectSearchPage(sc);
        log.info("조회된 리스트 : " + list);
        assertTrue(list.size() == 2);
    }

    @Test
    public void selectSearchCnt() throws Exception{
        SearchCondition sc = new SearchCondition(1, 10, "공지사항 제목2", "T");
        int resultCnt = noticeDao.selectSearchCnt(sc);
        assertTrue(resultCnt == 2); // ex) 공지사항 제목2, 공지사항 제목20
    }


}
package com.finalpj.nbw.service;

import com.finalpj.nbw.notice.domain.Notice;
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
@Transactional
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeServiceTest {

    @Autowired
    DataSource ds;

    @Autowired
    NoticeService noticeService;
    @Test
    /* ========================= 공지글 등록 테스트 ============================*/
    public void noticeInsertTest() throws Exception{
        Notice noticeDto = new Notice();
        noticeDto.setNt_title("공지글 제목 테스트");
        noticeDto.setNt_content("공지글 내용 테스트");
        assertTrue(noticeService.registNotice(noticeDto) == 1);
    }
    
    @Test
    /* ========================= 공지글 수정 테스트 ============================*/
    public void noticeUpdateTest() throws Exception{
        Notice noticeDto = new Notice();
        noticeDto.setNt_title("공지글 제목 수정 테스트");
        noticeDto.setNt_content("공지글 내요 수정 테스트");
        noticeDto.setNt_no(47);
        assertTrue(noticeService.modifyNotice(noticeDto) == 1);
    }

    @Test
    /* ====================== 공지글 한건 삭제 테스트 =========================*/
    public void removeNoticeTest() throws Exception{
        int nt_no = 47;
        assertTrue(noticeService.removeNotice(nt_no) == 1);
    }

    @Test
    /* ====================== 공지글 전체 삭제 테스트 =========================*/
    public void removeAllNoticeTest() throws Exception{
        assertTrue(noticeService.removeAllNotice() > 0);
    }
    @Test
    /* ====================== 공지글 한 건 조회 테스트 =========================*/
    public void getNoticeTest() throws Exception{
        Notice noticeDto = new Notice();
        int nt_no = 47;
        noticeDto = noticeService.getNotice(nt_no);
        log.info("47번 공지글 조회 결과 : " + noticeDto);
        assertNotEquals(noticeDto, null);
    }
    @Test
    /* ====================== 공지글 전체 조회 테스트 =========================*/
    public void getAllNotice() throws Exception{
        List<Notice> noticeList = null;
        noticeList= noticeService.getAllNotice();
        log.info("공지글 전체 조회 결과 : " + noticeList);
        assertNotEquals(noticeList, null);
    }


}
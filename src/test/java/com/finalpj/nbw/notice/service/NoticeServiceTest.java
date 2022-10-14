package com.finalpj.nbw.notice.service;

import com.finalpj.nbw.notice.domain.Notice;
import lombok.extern.log4j.Log4j;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;

import static org.junit.Assert.*;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeServiceTest {

    @Autowired
    DataSource ds;

    @Autowired
    NoticeService noticeService;

    public void noticeInsertTest(){
        Notice noticeDto = new Notice();
    }


}
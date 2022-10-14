package com.finalpj.nbw.notice.service;

import com.finalpj.nbw.notice.dao.NoticeDao;
import com.finalpj.nbw.notice.domain.Notice;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Log4j
@Service
public class NoticeService {

    @Autowired
    private NoticeDao noticeDao;

    @Transactional(rollbackFor = Exception.class)
    public int registNotice(Notice noticeDto) throws Exception{
        return noticeDao.insertNotice(noticeDto);
    }
}

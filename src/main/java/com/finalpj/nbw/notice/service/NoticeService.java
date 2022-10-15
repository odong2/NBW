package com.finalpj.nbw.notice.service;

import com.finalpj.nbw.notice.dao.NoticeDao;
import com.finalpj.nbw.notice.domain.Notice;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
public class NoticeService {

    @Autowired
    private NoticeDao noticeDao;
    /********************* 공지글 입력 *********************/
    @Transactional(rollbackFor = Exception.class)
    public int registNotice(Notice noticeDto) throws Exception{
        return noticeDao.insertNotice(noticeDto);
    }
    /********************* 공지글 수정 *********************/
    @Transactional(rollbackFor = Exception.class)
    public int modifyNotice(Notice noticeDto) throws Exception{
        return noticeDao.updateNotice(noticeDto);
    }
    /********************* 공지글 한 건 삭제 *********************/
    @Transactional(rollbackFor = Exception.class)
    public int removeNotice(Integer nt_no) throws Exception{
        return noticeDao.deleteNotice(nt_no);
    }
    /********************* 공지글 전체 삭제 *********************/
    @Transactional(rollbackFor = Exception.class)
    public int removeAllNotice() throws Exception{
        return noticeDao.deleteNoticeList();
    }
    /********************* 공지글 한 건 조회 *************************/
    @Transactional(readOnly = true)
    public Notice getNotice(Integer nt_no) throws Exception{
        return noticeDao.selectNotice(nt_no);
    }
    /********************* 공지글 전체 조회 *************************/
    @Transactional(readOnly = true)
    public List<Notice> getAllNotice() throws Exception{
        return noticeDao.selectNoticeList();
    }
}

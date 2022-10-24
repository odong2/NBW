package com.finalpj.nbw.notice.service;

import com.finalpj.nbw.notice.dao.NoticeDao;
import com.finalpj.nbw.notice.domain.Notice;
import com.finalpj.nbw.notice.domain.SearchCondition;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Log4j
@Service
public class NoticeService {


    private final NoticeDao noticeDao;

    public NoticeService(NoticeDao noticeDao){
        this.noticeDao = noticeDao;
    }

    /***************************** 공지글 작성 ****************************/
    @Transactional(rollbackFor = Exception.class)
    public int writeNotice(Notice noticeDto) throws Exception{
        return noticeDao.insertNotice(noticeDto);
    }
    /**************************** 공지글 수정 ****************************/
    @Transactional(rollbackFor = Exception.class)
    public int modifyNotice(Notice noticeDto) throws Exception{
        return noticeDao.updateNotice(noticeDto);
    }
    /************************** 공지글 한 건 삭제 **************************/
    @Transactional(rollbackFor = Exception.class)
    public int removeNotice(Integer nt_no) throws Exception{
        return noticeDao.deleteNotice(nt_no);
    }
    /************************** 공지글 전체 삭제 ***************************/
    @Transactional(rollbackFor = Exception.class)
    public int removeAllNotice() throws Exception{
        return noticeDao.deleteNoticeAll();
    }
    /******************** 공지글 한 건 조회  + 조회수 증가 *********************/
    @Transactional(readOnly = true)
    public Notice getNotice(Integer nt_no) throws Exception{
        Notice noticeDto = noticeDao.selectNotice(nt_no);
        noticeDao.updateViewCnt(nt_no);

        return noticeDto;
    }
    /************************ 공지글 전체 조회 ****************************/
    @Transactional(readOnly = true)
    public List<Notice> getAllNotice() throws Exception{
        return noticeDao.selectNoticeList();
    }

    /************************ 공지글 조회수 증가 ****************************/
    @Transactional(rollbackFor = Exception.class)
    public int increaseViewCnt(Integer nt_no) throws Exception{
        return noticeDao.updateViewCnt(nt_no);
    }
    /************************ 공지글 총 개수 조회 ****************************/
    public int getNoticeTotalCnt() throws Exception{
        return noticeDao.selectNoticeCnt();
    }

    /************************ 페이지 게시물 조회 ****************************/
    public List<Notice> getPageNotiseList(Map map) throws Exception{
        return noticeDao.selectNoticePage(map);
    }

    public List<Notice> getSearchResultPage(SearchCondition sc) throws Exception{
        return noticeDao.selectSearchPage(sc);
    }
    public int getSearchResultCnt(SearchCondition sc) throws Exception{
        return noticeDao.selectSearchCnt(sc);
    }

}

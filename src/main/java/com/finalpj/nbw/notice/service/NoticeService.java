package com.finalpj.nbw.notice.service;

import com.finalpj.nbw.notice.dao.NoticeDao;
import com.finalpj.nbw.notice.dao.NtCommentDao;
import com.finalpj.nbw.notice.domain.Notice;
import com.finalpj.nbw.notice.domain.NtComment;
import com.finalpj.nbw.notice.domain.SearchCondition;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Service
public class NoticeService {


    private final NoticeDao noticeDao;
    private final NtCommentDao commentDao;

    public NoticeService(NoticeDao noticeDao, NtCommentDao commentDao){
        this.noticeDao = noticeDao;
        this.commentDao = commentDao;
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
    /******************** 공지글 한 건 조회  + 조회수 증가 + 댓글 조회 *********************/
    @Transactional(readOnly = true)
    public Map<String, Object> getNotice(Integer nt_no) throws Exception{
        Notice noticeDto = noticeDao.selectNotice(nt_no);
        noticeDao.updateViewCnt(nt_no); // 조회수 증가
        HashMap map = new HashMap();
        map.put("noticeDto", noticeDto);
        List<NtComment> commentList = null;
        commentList = commentDao.selectAll(nt_no);
        map.put("commentList", commentList);
        return map;
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

    /************************  조건 검색 페이지 ****************************/
    public List<Notice> getPageNotiseList(Map map) throws Exception{
        return noticeDao.selectNoticePage(map);
    }

    public List<Notice> getSearchResultPage(SearchCondition sc) throws Exception{
        return noticeDao.selectSearchPage(sc);
    }
    /************************ 조건 검색 총 개수 ****************************/
    public int getSearchResultCnt(SearchCondition sc) throws Exception{
        return noticeDao.selectSearchCnt(sc);
    }



}

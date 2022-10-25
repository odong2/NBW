package com.finalpj.nbw.notice.service;

import com.finalpj.nbw.notice.dao.NoticeDao;
import com.finalpj.nbw.notice.dao.NtCommentDao;
import com.finalpj.nbw.notice.domain.NtComment;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
public class NtCommentService {

    NoticeDao noticeDao;
    NtCommentDao commentDao;

    public NtCommentService(NtCommentDao commentDao, NoticeDao noticeDao){
        this.commentDao = commentDao;
        this.noticeDao = noticeDao;
    }

    /******************************* 댓글 작성(writeComment) *******************************/
    @Transactional(rollbackFor = Exception.class)
    public int writeComment(NtComment ntCommentDto) throws Exception {

        noticeDao.updateCommentCnt(ntCommentDto.getNt_no(), 1); // 댓글수 1증가
        //throw new Exception("testException");                     // 실패하면 롤백
        return commentDao.insert(ntCommentDto);
    }
    /******************************** 댓글 삭제(removeComment) ********************************/
    @Transactional(rollbackFor = Exception.class)
    public int removeComment(Integer nt_cno, Integer nt_no, String ntc_commenter) throws Exception {
        int rowCnt = noticeDao.updateCommentCnt(nt_no, -1); // 댓글수 1 감소
        log.info("updateCommentCnt - rowCnt = " + rowCnt);
        rowCnt = commentDao.delete(nt_cno, ntc_commenter); // 댓글 삭제
        log.info("rowCnt = " + rowCnt);
        return rowCnt;
    }
    /*********************** 특정 공지글의 댓글 모두 조회(getCommentList) ************************/
    public List<NtComment> getCommentList(Integer nt_no) throws Exception {
        return commentDao.selectAll(nt_no);
    }
    /*************************** 댓글 한 건 조회(readComment) *****************************/
    public NtComment readComment(Integer ntc_no) throws Exception {
        return commentDao.select(ntc_no);
    }
    /***************************** 댓글 수정(modifyComment) *******************************/
    public int modifyComment(NtComment ntCommentDto) throws Exception {
        return commentDao.update(ntCommentDto);
    }

}

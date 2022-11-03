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

    private final NoticeDao noticeDao;
    private final NtCommentDao commentDao;

    public NtCommentService(NtCommentDao commentDao, NoticeDao noticeDao){
        this.commentDao = commentDao;
        this.noticeDao = noticeDao;
    }

    /******************************* 댓글 작성(writeComment) *******************************/
    @Transactional(rollbackFor = Exception.class)
    public int writeComment(NtComment ntCommentDto) throws Exception {

        noticeDao.updateCommentCnt(ntCommentDto.getNt_no(), 1); // 댓글수 1증가
        //throw new Exception("testException");                     // 실패하면 롤백
        return commentDao.insertComment(ntCommentDto);
    }
    /******************************** 댓글 삭제(removeComment) ********************************/
    @Transactional(rollbackFor = Exception.class)
    public int removeComment(Integer ntc_no, Integer nt_no, String ntc_commenter) throws Exception {
        int rowCnt = noticeDao.updateCommentCnt(nt_no, -1); // 댓글수 1 감소
        log.info("updateCommentCnt - rowCnt = " + rowCnt);
        rowCnt = commentDao.deleteComment(ntc_no, ntc_commenter); // 댓글 삭제
        // 댓글 삭제가 성공하면 답글 삭제
        if(rowCnt > 0){
            commentDao.deleteRepComment(ntc_no);
        }
        return rowCnt;
    }
    /*********************** 특정 공지글의 댓글 모두 조회(getCommentList) ************************/
    public List<NtComment> getCommentList(Integer nt_no) throws Exception {
        return commentDao.selectCommentList(nt_no);
    }
    /*************************** 댓글 한 건 조회(readComment) *****************************/
    public NtComment readComment(Integer ntc_no) throws Exception {
        return commentDao.selectComment(ntc_no);
    }
    /***************************** 댓글 수정(modifyComment) *******************************/
    public int modifyComment(NtComment ntCommentDto) throws Exception {
        return commentDao.updateComment(ntCommentDto);
    }

}

package com.finalpj.nbw.notice.dao;

import com.finalpj.nbw.notice.domain.NtComment;

import java.util.List;

public interface NtCommentDao {
    int deleteCommentList(Integer nt_no) throws Exception;       // 특정 공지글 모든 댓글 삭제
    int selectCommentCnt(Integer nt_no) throws Exception;           // 특정 공지글 댓글 개수 조회
    int deleteComment(Integer ntc_no, String commenter) throws Exception; // 특정 댓글 삭제
    int deleteRepComment(Integer ntc_no) throws Exception; // 답글 삭제
    int insertComment(NtComment NtCommentDto) throws Exception; // 댓글 등록
    List<NtComment> selectCommentList(Integer ntc_no) throws Exception;
    NtComment selectComment(Integer ntc_no) throws Exception;   // 댓글 한 건 조회
    int updateComment(NtComment ntCommentDto) throws Exception; // 댓글 수정
}

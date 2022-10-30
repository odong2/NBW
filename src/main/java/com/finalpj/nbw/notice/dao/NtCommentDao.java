package com.finalpj.nbw.notice.dao;

import com.finalpj.nbw.notice.domain.NtComment;

import java.util.List;

public interface NtCommentDao {
    int deleteAll(Integer nt_no) throws Exception;       // 특정 공지글 모든 댓글 삭제
    int count(Integer nt_no) throws Exception;           // 특정 공지글 댓글 개수 조회
    int delete(Integer ntc_no, String commenter) throws Exception; // 특정 댓글 삭제
    int insert(NtComment NtCommentDto) throws Exception; // 댓글 등록
    List<NtComment> selectAll(Integer ntc_no) throws Exception;
    NtComment select(Integer ntc_no) throws Exception;   // 댓글 한 건 조회
    int update(NtComment ntCommentDto) throws Exception; // 댓글 수정
}

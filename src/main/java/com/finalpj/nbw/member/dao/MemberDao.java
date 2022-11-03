package com.finalpj.nbw.member.dao;

import java.util.Map;

import com.finalpj.nbw.member.domain.Member;

public interface MemberDao {
	/* ========================= 회원 가입 ======================== */
    int insertMember(Member member) throws Exception;
    
    Member selectMember(String id);

    /* ===================== 아이디 중복 체크 ======================== */
    String selectIdCheck(String strCheckId) throws Exception;

    /* ===================== 회원 정보 수정 ======================== */
    int updateMyInfo(Member member) throws Exception;

    /* ===================== 좋아요한 상품이 있는지 확인 ======================== */
	boolean existLike(Map<String, Object> map);

	void insertLike(Map<String, Object> map);

	void deleteLike(Map<String, Object> map);
}

package com.finalpj.nbw.member.dao;

import java.util.Map;

import com.finalpj.nbw.member.domain.Member;

import java.util.Map;

public interface MemberDao {
    /* ========================= 회원 가입 ======================== */
    int insertMember(Member member) throws Exception;

    Member selectMember(String id);

    /* ===================== 아이디 중복 체크 ======================== */
    String selectIdCheck(String strCheckId) throws Exception;

    /* ===================== 닉네임 중복 체크 ======================== */
    String selectNicknameCheck(String strCheckNickname) throws Exception;

    /* ===================== 회원 정보 수정 ======================== */
    int updateMyInfo(Member member) throws Exception;

    /* ===================== 좋아요한 상품이 있는지 확인 ======================== */
	boolean existLike(Map<String, Object> map);

	void insertLike(Map<String, Object> map);

	void deleteLike(Map<String, Object> map);
    /* ========================= 회원 탈퇴 ======================== */
    int deleteMember(Member member) throws Exception;

    /* ==================== 회원 포인트 업데이트(결제 시) ===================*/
    int updateMemPoint(Map pMap) throws Exception;

}


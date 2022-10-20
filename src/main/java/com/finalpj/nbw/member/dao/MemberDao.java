package com.finalpj.nbw.member.dao;

import com.finalpj.nbw.member.domain.Member;

public interface MemberDao {

	/* ===================== 회원 가입 ======================== */
    int insertMember(Member member) throws Exception;

    /* ===================== 아이디 중복 체크 ======================== */
    int selectIdCheck(String strCheckId) throws Exception;
}

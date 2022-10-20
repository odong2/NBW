package com.finalpj.nbw.member.dao;

import com.finalpj.nbw.member.domain.Member;

public interface MemberDao {
	/* 일반 회원 가입(소셜 회원가입 X) */
    int insertMember(Member member) throws Exception;
    
    Member selectMember(String id);

    /* ===================== 아이디 중복 체크 ======================== */
    int selectIdCheck(String strCheckId) throws Exception;

}

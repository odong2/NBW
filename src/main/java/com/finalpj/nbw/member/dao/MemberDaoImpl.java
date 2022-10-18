package com.finalpj.nbw.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalpj.nbw.member.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
    private SqlSession sqlSession;

    /* ***************** *일반회원 가입(등록) 소셜 회원가입 X * **************** */
    @Override
    public int insertMember(Member member) throws Exception {
        return sqlSession.insert("insertMember", member);
    }
}

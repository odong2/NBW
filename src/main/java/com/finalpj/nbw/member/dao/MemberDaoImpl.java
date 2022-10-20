package com.finalpj.nbw.member.dao;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalpj.nbw.member.domain.Member;

@Repository
@Slf4j
public class MemberDaoImpl implements MemberDao{
	@Autowired
    private SqlSession sqlSession;

    /* ***************** *일반회원 가입(등록) 소셜 회원가입 X * **************** */
    @Override
    public int insertMember(Member member) throws Exception {
        log.info("MemberDaoImpl *insertMember* ===============> 회원가입 처리 ");
        return sqlSession.insert("insertMember", member);
    }

    @Override
    public String selectIdCheck(String strCheckId) throws Exception {
//        log.info("MemberDaoImpl *selectIdCheck* ===============> 아이디 중복 체크 처리 ");
        return sqlSession.selectOne("selectIdCheck", strCheckId);
    }

	@Override
	public Member selectMember(String id){
		return sqlSession.selectOne("selectMemeber",id);
	}
}

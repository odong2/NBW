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

    /* ============================== 회원가입 ==================================== */
    @Override
    public int insertMember(Member member) throws Exception {
        log.info("MemberDaoImpl *insertMember* ===============> 회원가입 처리 ");
        return sqlSession.insert("insertMember", member);
    }

    /* ============================== 아이디 중복 체크 ==================================== */
    @Override
    public String selectIdCheck(String strCheckId) throws Exception {
//        log.info("MemberDaoImpl *selectIdCheck* ===============> 아이디 중복 체크 처리 ");
        return sqlSession.selectOne("selectIdCheck", strCheckId);
    }

    /* ============================== 내 정보 조회(한 건) ==================================== */
	@Override
	public Member selectMember(String id){
		return sqlSession.selectOne("selectMemeber",id);
	}

    /* ============================== 내 정보 수정 ==================================== */
    @Override
    public int updateMyInfo(Member member) throws Exception {
        log.info("dao ===> 수정할 아이디 "+member.getUsername());
        int result = sqlSession.update("updateMyInfo", member);
        log.info("dao ===> 수정 여부 "+ result);
        return result;
    }

}

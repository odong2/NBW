package com.finalpj.nbw.member.repository;

import lombok.extern.slf4j.Slf4j;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalpj.nbw.member.dao.MemberDao;
import com.finalpj.nbw.member.domain.Member;

import java.util.Map;

@Repository
@Slf4j
public class MemberDaoImpl implements MemberDao{

	@Autowired
    private SqlSession sqlSession;

    private final String namespace = "com.finalpj.nbw.member.dao.MemberMapper.";

    /* ======================================= 회원가입 ============================================= */
    @Override
    public int insertMember(Member member) throws Exception {
        log.info("MemberDaoImpl *insertMember* ===============> 회원가입 처리 ");
        return sqlSession.insert(namespace+"insertMember", member);
    }

    /* ======================================= 회원탈퇴 ============================================= */
    @Override
    public int deleteMember(Member member) throws Exception {
        log.info("dao ===> 삭제할 멤버"+ member);
        int result = sqlSession.delete(namespace+"deleteMember", member);
        log.info("dao ===> 삭제 여부 "+ result);
        return result;
    }

    /* ===================================== 아이디 중복 체크 ========================================== */
    @Override
    public String selectIdCheck(String strCheckId) throws Exception {
        return sqlSession.selectOne(namespace+"selectIdCheck", strCheckId);
    }

    @Override
    public String selectNicknameCheck(String strCheckNickname) throws Exception {
        return sqlSession.selectOne(namespace+"selectNicknameCheck", strCheckNickname);
    }

    /* ====================================== 내 정보 조회 ============================================ */
	@Override
	public Member selectMember(String id){
		return sqlSession.selectOne(namespace+"selectMemeber",id);
	}

    /* ====================================== 내 정보 수정 ============================================ */
    @Override
    public int updateMyInfo(Member member) throws Exception {
        log.info("dao ===> 수정할 아이디 "+member.getMem_id());
        int result = sqlSession.update(namespace+"updateMyInfo", member);
        log.info("dao ===> 수정 여부 "+ result);
        return result;
    }

	@Override
	public boolean existLike(Map<String, Object> map) {
		return sqlSession.selectOne("existLike",map);
	}

	@Override
	public void insertLike(Map<String, Object> map) {
		sqlSession.insert("insertLike",map);
	}

	@Override
	public void deleteLike(Map<String, Object> map) {
		sqlSession.delete("deleteLike", map);
	}
    @Override
    public int updateMemPoint(Map pMap) throws Exception {
        return sqlSession.update(namespace + "updateMemPoint", pMap);
    }

    /* ====================================== 내 사진 추가 ============================================ */
    @Override
    public int updateMyImg(Member member) throws Exception {
        return sqlSession.update(namespace + "updateMyImg", member);
    }

}

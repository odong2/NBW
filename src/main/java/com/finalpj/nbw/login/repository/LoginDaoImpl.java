package com.finalpj.nbw.login.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.finalpj.nbw.login.dao.LoginDao;
import com.finalpj.nbw.login.dto.FindDto;
import com.finalpj.nbw.member.domain.Member;

@Repository
public class LoginDaoImpl implements LoginDao{

    private SqlSession sqlSession;

    public LoginDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
	
	@Override
	public String selectUserPassword(String userId) {
		return sqlSession.selectOne("selectUserPassword", userId);
	}

	@Override
	public Member seleteUser(String userId) {
		return sqlSession.selectOne("selectUser", userId);
	}

	@Override
	public boolean selectUserId(String userId) {
		return sqlSession.selectOne("selectUserId", userId);
	}

	@Override
	public FindDto findId(FindDto dto) {
		return sqlSession.selectOne("findId", dto);
	}

	@Override
	public boolean selectUserEmail(FindDto dto) {
		return sqlSession.selectOne("selectUserEmail", dto);
	}

	@Override
	public int updateUserPassword(FindDto dto) {
		return sqlSession.update("updateUserPassword", dto);
	}

}

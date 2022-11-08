package com.finalpj.nbw.login.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.finalpj.nbw.login.dao.LoginDao;
import com.finalpj.nbw.login.domain.Find;
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
	public List<Find> findId(Find dto) {
		return sqlSession.selectList("findId", dto);
	}

	@Override
	public boolean selectUserEmail(Find dto) {
		return sqlSession.selectOne("selectUserEmail", dto);
	}

	@Override
	public int updateUserPassword(Find dto) {
		return sqlSession.update("updateUserPassword", dto);
	}

}

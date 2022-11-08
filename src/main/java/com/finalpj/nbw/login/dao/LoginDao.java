package com.finalpj.nbw.login.dao;

import java.util.List;

import com.finalpj.nbw.login.domain.Find;
import com.finalpj.nbw.member.domain.Member;

public interface LoginDao {
	public String selectUserPassword(String userId);

	public boolean selectUserId(String userId);
	
	public Member seleteUser(String userId);

	public List<Find> findId(Find dto);

	public boolean selectUserEmail(Find dto);

	public int updateUserPassword(Find dto);
}

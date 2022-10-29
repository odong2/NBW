package com.finalpj.nbw.login.dao;

import com.finalpj.nbw.member.domain.Member;

public interface LoginDao {
	public String selectUserPassword(String userId);

	public boolean selectUserId(String userId);
	
	public Member seleteUser(String userId);
}

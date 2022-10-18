package com.finalpj.nbw.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.finalpj.nbw.member.dao.MemberDao;
import com.finalpj.nbw.member.domain.Member;

public class MemberService implements UserDetailsService{

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("username : " + username );
		String password = bCryptPasswordEncoder.encode("1234");
		Member member = Member.builder().mem_id(username).mem_pw(password).g_grade("ROLE_USER").build();
		return member;
	}
	
	@Autowired
    private MemberDao memberDao;

    /* 일반 회원가입(회원 등록) */
    public int registMem(Member member) throws Exception {
        int intI = memberDao.insertMember(member);
        return intI;
    }
}

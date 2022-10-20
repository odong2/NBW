package com.finalpj.nbw.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.finalpj.nbw.member.dao.MemberDao;
import com.finalpj.nbw.member.domain.Member;

@Service
public class LoginService implements UserDetailsService{
	
	BCryptPasswordEncoder bCryptPasswordEncoder;
    private MemberDao memberDao;
    
    public LoginService() {}
    
    @Autowired
	public LoginService(BCryptPasswordEncoder bCryptPasswordEncoder, MemberDao memberDao) {
    	this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    	this.memberDao = memberDao;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("username : " + username );
		
		Member member = memberDao.selectMember(username);
	
		if (member == null) {
			throw new UsernameNotFoundException("해당 유저는 존재하지않습니다.");
		}

		return member;
	}
}

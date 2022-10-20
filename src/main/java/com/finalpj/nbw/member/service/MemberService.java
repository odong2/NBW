package com.finalpj.nbw.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.finalpj.nbw.member.dao.MemberDao;
import com.finalpj.nbw.member.domain.Member;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements UserDetailsService{

	BCryptPasswordEncoder bCryptPasswordEncoder;
    private MemberDao memberDao;
    
    public MemberService() {}
    
    @Autowired
	public MemberService(BCryptPasswordEncoder bCryptPasswordEncoder, MemberDao memberDao) {
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
	
    /* 일반 회원가입(회원 등록) */
    public int registMem(Member member) throws Exception {
        int intI = memberDao.insertMember(member);
        return intI;
    }
}

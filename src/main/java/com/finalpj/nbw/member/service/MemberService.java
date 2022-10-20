package com.finalpj.nbw.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.finalpj.nbw.member.dao.MemberDao;
import com.finalpj.nbw.member.domain.Member;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	BCryptPasswordEncoder bCryptPasswordEncoder;
    private MemberDao memberDao;
    
    public MemberService() {}
    
    @Autowired
	public MemberService(BCryptPasswordEncoder bCryptPasswordEncoder, MemberDao memberDao) {
    	this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    	this.memberDao = memberDao;
	}
	
    /* 일반 회원가입(회원 등록) */
    public int registMem(Member member) throws Exception {
        int intI = memberDao.insertMember(member);
        return intI;
    }
}

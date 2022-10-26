package com.finalpj.nbw.login.service;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.finalpj.nbw.login.dao.LoginDao;
import com.finalpj.nbw.login.dto.LoginDto;
import com.finalpj.nbw.login.exception.LoginException;
import com.finalpj.nbw.login.exception.WrongIdException;
import com.finalpj.nbw.login.exception.WrongPasswordException;
import com.finalpj.nbw.member.domain.Member;

@Service
public class LoginService 
//implements UserDetailsService
{
	
	BCryptPasswordEncoder bCryptPasswordEncoder;
    private LoginDao loginDao;
    
    public LoginService() {}
    
    @Autowired
	public LoginService(BCryptPasswordEncoder bCryptPasswordEncoder, LoginDao loginDao) {
    	this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    	this.loginDao = loginDao;
	}

    public Member loginCheck(LoginDto logindto) throws LoginException {
    	Member member;
    	
    	String userId = logindto.getUserId();
    	String userPassword = logindto.getUserPassword();
    	
    	String resultPassword = null;
    	
    	if(idCheck(userId)) {
    		resultPassword = loginDao.selectUserPassword(userId);
    	}else {
    		throw new WrongIdException("존재하지 않는 아이디 입니다.");
    	}
    	
    	if (passwordCheck(userPassword, resultPassword)) {
    		member = loginDao.seleteUser(userId);
    	} else {
    		throw new WrongPasswordException("아이디와 비밀번호를 확인해주세요.");
    	}
    	
    	return member;
    }
    
    public boolean passwordCheck(String userPassword, String resultPassword) {    
    	return bCryptPasswordEncoder.matches(userPassword, resultPassword);
    }
    
    public boolean idCheck(String userId) {    	
    	return loginDao.selectUserId(userId);
    }
    
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		System.out.println("username : " + username );
//		
//		Member member = memberDao.selectMember(username);
//	
//		if (member == null) {
//			throw new UsernameNotFoundException("해당 유저는 존재하지않습니다.");
//		}
//
//		return member;
//	}
}

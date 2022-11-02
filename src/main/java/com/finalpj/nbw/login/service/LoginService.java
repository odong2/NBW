package com.finalpj.nbw.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.finalpj.nbw.login.dao.LoginDao;
import com.finalpj.nbw.login.dto.FindDto;
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
    
    public Member loginCheck(String OAuth2UserId) throws LoginException {
    	return loginDao.seleteUser(OAuth2UserId);
    }
    
    public boolean passwordCheck(String userPassword, String resultPassword) {    
    	return bCryptPasswordEncoder.matches(userPassword, resultPassword);
    }
    
    public boolean idCheck(String userId) {    	
    	return loginDao.selectUserId(userId);
    }
    
    public boolean emailCheck(FindDto dto) {    	
    	return loginDao.selectUserEmail(dto);
    }

	public Map<String,Object> findId(FindDto dto) {
		HashMap<String,Object> responseMap = new HashMap<>();
		List<FindDto> ResponseDto = loginDao.findId(dto);
		
		if(ResponseDto != null) {
			responseMap.put("success", true);
			responseMap.put("dto", ResponseDto);
		} else {
			responseMap.put("success", false);
			responseMap.put("msg", "해당 아이디는 존재하지 않는 아이디입니다.");
		}
		return responseMap;
	}

	public Map<String, Object> changePw(FindDto dto) {
		HashMap<String,Object> responseMap = new HashMap<>();
		
		String newPw = bCryptPasswordEncoder.encode(dto.getMem_pw());
		dto.setMem_pw(newPw);
		
		int result = loginDao.updateUserPassword(dto);
		System.out.println(result);
		responseMap.put("success", true);
		return responseMap;
	}
}

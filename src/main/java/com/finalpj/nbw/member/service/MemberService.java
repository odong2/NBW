package com.finalpj.nbw.member.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.finalpj.nbw.member.dao.MemberDao;
import com.finalpj.nbw.member.domain.Member;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class MemberService {

	BCryptPasswordEncoder bCryptPasswordEncoder;
    private MemberDao memberDao;
    
    public MemberService() {}
    
    @Autowired
	public MemberService(BCryptPasswordEncoder bCryptPasswordEncoder, MemberDao memberDao) {
    	this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    	this.memberDao = memberDao;
	}

    /* 아이디 중복 체크 */
    public int idCheck(String strCheckId) throws Exception{
        log.info("SERVICE ===================> 아이디 중복체크 처리");
        /* count == 0 ? 가입 가능
         *  count != 0 ? 가입 불가 */
        int count = memberDao.selectIdCheck(strCheckId);
        return count;
    }

    /* 회원가입 처리 */
    public int postMem(Member member) throws Exception{
        log.info("SERVICE ===================> 회원가입 처리");
        /* 비밀번호 인코딩 START */
        String rowPw = member.getMem_pw();
        log.info("인코딩 전 비밀번호 =======> "+rowPw);
        String encodePw = bCryptPasswordEncoder.encode(rowPw);
        log.info("인코딩 후 비밀번호 =======> "+encodePw);
        member.setMem_pw(encodePw);
        /* 비밀번호 인코딩 END */
        return memberDao.insertMember(member);
    }
}
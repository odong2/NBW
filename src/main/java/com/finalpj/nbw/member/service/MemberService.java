package com.finalpj.nbw.member.service;

import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.finalpj.nbw.member.dao.MemberDao;
import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.product.dao.ProductDao;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
public class MemberService {

    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private MemberDao memberDao;

    @Autowired
    private ProductDao productDao;
    
    public MemberService() {}

    @Autowired
    public MemberService(BCryptPasswordEncoder bCryptPasswordEncoder, MemberDao memberDao) {
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
        this.memberDao = memberDao;
    }

    /* 아이디 중복 체크 */
    public String idCheck(String strCheckId) throws Exception{
        log.info("SERVICE ===================> 아이디 중복체크 service");
        System.out.println(memberDao.selectIdCheck(strCheckId));
        return memberDao.selectIdCheck(strCheckId);
    }

    /* 닉네임 중복 체크 */
    public String nicknameCheck(String strCheckNickname) throws Exception{
        log.info("SERVICE ===================> 닉네임 중복체크 service");
        System.out.println(memberDao.selectNicknameCheck(strCheckNickname));
        return memberDao.selectIdCheck(strCheckNickname);
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
    
    @Transactional
	public Map<String,Object> addLkie(Map<String, Object> map) {
		Map<String,Object> rMap = new HashMap<>();
		
		// 이미 좋아요한 상품인지 검사
		if(existLike(map)) {	
			//이미 좋아요한 상품이면 -> 좋아요 삭제
			map.put("value", -1);
			memberDao.deleteLike(map);
			productDao.updateLike(map);
			rMap.put("success",false);
			rMap.put("msg","좋아요 목록에 삭제되었습니다.");
		}else {
			//좋아요한 상품이 아니면 -> 좋아요 추가
			map.put("value", 1);
			memberDao.insertLike(map);
			productDao.updateLike(map);
			
			rMap.put("success",true);
			rMap.put("msg","좋아요 목록에 추가되었습니다.");
		}
		return rMap;
	}
    
    public boolean existLike(Map<String, Object> map) {
    	return memberDao.existLike(map);
    }
}
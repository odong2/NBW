package com.finalpj.nbw.mypage.service;

import com.finalpj.nbw.member.dao.MemberDao;
import com.finalpj.nbw.member.domain.Member;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
public class MypageService {

    @Autowired
    private MemberDao memberDao;

    public Member getMyInfo(String id) throws Exception{
        return memberDao.selectMember(id);
    }

    @Transactional(rollbackFor = Exception.class)
    public int postMyInfo(Member member) throws Exception{
        log.info("SERVICE ====================> 회원정보 수정 : "+ member);
        return memberDao.updateMyInfo(member);
    }


    /* 회원탈퇴 처리 */
    @Transactional(rollbackFor = Exception.class)
    public int delMem(Member member) throws Exception{
        log.info("SERVICE ==================> 회원탈퇴 처리");
        return memberDao.deleteMember(member);
    }

    /* 내 사진 추가 */
    public int insMyImg(Member member) throws Exception{
        log.info("SERVICE ==================> 내 사진 추가");
        return memberDao.updateMyImg(member);
    }
}

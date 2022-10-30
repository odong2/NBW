package com.finalpj.nbw.service;

import com.finalpj.nbw.notice.dao.NoticeDao;
import com.finalpj.nbw.notice.dao.NtCommentDao;
import com.finalpj.nbw.notice.domain.Notice;
import com.finalpj.nbw.notice.domain.NtComment;
import com.finalpj.nbw.notice.service.NtCommentService;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.Assert.*;
@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
//@Transactional
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NtCommentServiceTest {
    @Autowired
    NtCommentService ntCommentService;
    @Autowired
    NtCommentDao ntCommentDao;
    @Autowired
    NoticeDao noticeDao;

    // 댓글 여러개 생성
    @Test
    public void writeComments() throws Exception{
        Integer nt_no = 1;
        ntCommentDao.deleteAll(nt_no);
        for(int i=1; i<=20;i++){
            NtComment comment = new NtComment(i,nt_no,0,"commentTest","mj");
            ntCommentService.writeComment(comment);
        }
        List<NtComment> list = ntCommentService.getCommentList(nt_no);
        log.info("리스트의 사이즈는 " + list.size());
        assertTrue(list.size() == 20);
    }

    @Test
    public void writeComment() throws Exception{
        Notice noticeDto = new Notice(1, "test", "test");

        assertTrue(noticeDao.insertNotice(noticeDto) == 1);
        Integer nt_no = noticeDao.selectNoticeList().get(0).getNt_no();

        ntCommentDao.deleteAll(nt_no);
        NtComment commentDto = new NtComment(1,nt_no,0, "test","admin");

        assertTrue(noticeDao.selectNotice(nt_no).getNt_cocnt() == 0);
        assertTrue(ntCommentService.writeComment(commentDto) == 1);
    }

    @Test
    public void removeComment() throws Exception {
        ntCommentDao.deleteAll(1);
        noticeDao.deleteNoticeAll();
        Notice noticeDto = new Notice(1, "test", "test");
        assertTrue(noticeDao.insertNotice(noticeDto)==1);
        Integer nt_no = noticeDao.selectNoticeList().get(0).getNt_no();
        log.info("nt_no = " + nt_no);

        ntCommentDao.deleteAll(nt_no); // 기존댓글 삭제
        NtComment commentDto = new NtComment(1,nt_no,0,"test","admin");

        assertTrue(noticeDao.selectNotice(nt_no).getNt_cocnt() == 0); // 기존댓글 삭제 성공 유무
        assertTrue(ntCommentService.writeComment(commentDto) == 1);   // 댓글 작성 성공 유무
        assertTrue(noticeDao.selectNotice(nt_no).getNt_cocnt() == 1); // 작성한 댓글 카운트 조회
        Integer ntc_no = ntCommentDao.selectAll(nt_no).get(0).getNtc_no();

        // 예외 발생시켜 트랜잭션이 걸리는지 확인 해야함

//        int rowCnt = ntCommentService.removeComment(ntc_no, nt_no, commentDto.getNtc_commenter()); // 댓글 삭제
//        assertTrue(rowCnt == 1); // 댓글 삭제 성공유무
//        assertTrue(noticeDao.selectNotice(nt_no).getNt_cocnt() == 0);
    }

    @Test
    public void getCommentList() throws Exception{
    }

    @Test
    public void readComment() throws Exception {
    }

    @Test
    public void modifyComment() throws Exception {
    }
}
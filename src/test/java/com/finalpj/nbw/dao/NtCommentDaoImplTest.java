package com.finalpj.nbw.dao;

import com.finalpj.nbw.notice.dao.NtCommentDao;
import com.finalpj.nbw.notice.domain.NtComment;
import com.finalpj.nbw.notice.repository.NtCommentDaoImpl;
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
@Transactional
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
                            , "file:src/main/webapp/WEB-INF/spring/oauth2api-context.xml"
                            , "file:src/main/webapp/WEB-INF/spring/mail-context.xml"})
public class NtCommentDaoImplTest {

    @Autowired
    NtCommentDao ntCommentDao;

    @Test
    /* ============================== 공지글 댓글 모두 삭제 ===================================*/
    public void delete() throws Exception {
        ntCommentDao.deleteCommentList(1);
        NtComment ntCommentDto = new NtComment(1,1, 0, "comment", "asdf");
        assertTrue(ntCommentDao.insertComment(ntCommentDto)==1);
        assertTrue(ntCommentDao.selectCommentCnt(1)==1);
    }

    @Test
    /* ============================== 댓글 개수 조회 ===================================*/
    public void count() throws Exception {
        ntCommentDao.deleteCommentList(1);
        assertTrue(ntCommentDao.selectCommentCnt(1)==0);
    }

    @Test
    /* ============================== 댓글 등록 ===================================*/
    public void insert() throws Exception {
        ntCommentDao.deleteCommentList(1);
        NtComment ntCommentDto = new NtComment(1,1, 0, "comment", "asdf");
        assertTrue(ntCommentDao.insertComment(ntCommentDto)==1);
        assertTrue(ntCommentDao.selectCommentCnt(1)==1);
        ntCommentDto = new NtComment(1,1, 0, "comment", "asdf");
        assertTrue(ntCommentDao.insertComment(ntCommentDto)==1);
        assertTrue(ntCommentDao.selectCommentCnt(1)==2);
    }

    @Test
    /* ============================== 대댓글 조회 ===================================*/
    public void selectAll() throws Exception {
        ntCommentDao.deleteCommentList(1);
        NtComment ntCommentDto = new NtComment(1,1, 0, "comment", "asdf");
        assertTrue(ntCommentDao.insertComment(ntCommentDto)==1);
        assertTrue(ntCommentDao.selectCommentCnt(1)==1);

        List<NtComment> list = ntCommentDao.selectCommentList(1);
        assertTrue(list.size()==1);

        ntCommentDto = new NtComment(2,1, 0, "comment", "asdf");
        assertTrue(ntCommentDao.insertComment(ntCommentDto)==1);
        assertTrue(ntCommentDao.selectCommentCnt(1)==2);

        list = ntCommentDao.selectCommentList(1);
        assertTrue(list.size()==2);
    }

    @Test
    /* ============================== 댓글 한 건 조회 ===================================*/
    public void select() throws Exception {
        ntCommentDao.deleteCommentList(1);
        NtComment ntCommentDto = new NtComment(1,1, 0, "comment", "asdf");
        assertTrue(ntCommentDao.insertComment(ntCommentDto)==1);
        assertTrue(ntCommentDao.selectCommentCnt(1)==1);

        List<NtComment> list = ntCommentDao.selectCommentList(1);
        String comment = list.get(0).getNtc_comment();
        String commenter = list.get(0).getNtc_commenter();
        assertTrue(comment.equals(ntCommentDto.getNtc_comment()));
        assertTrue(commenter.equals(ntCommentDto.getNtc_commenter()));
    }

    @Test
    /* ============================== 댓글 수정 ===================================*/
    public void update() throws Exception {
        ntCommentDao.deleteCommentList(1);
        NtComment commentDto = new NtComment(1,1, 0, "comment", "asdf");
        assertTrue(ntCommentDao.insertComment(commentDto)==1);
        assertTrue(ntCommentDao.selectCommentCnt(1)==1);

        List<NtComment> list = ntCommentDao.selectCommentList(1);
        commentDto.setNtc_no(list.get(0).getNtc_no());
        commentDto.setNtc_comment("comment1");
        assertTrue(ntCommentDao.updateComment(commentDto)==1);

        list = ntCommentDao.selectCommentList(1);
        String comment = list.get(0).getNtc_comment();
        String commenter = list.get(0).getNtc_commenter();
        assertTrue(comment.equals(commentDto.getNtc_comment()));
        assertTrue(commenter.equals(commentDto.getNtc_commenter()));
    }

}
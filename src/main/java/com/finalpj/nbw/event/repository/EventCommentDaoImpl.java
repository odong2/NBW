package com.finalpj.nbw.event.repository;


import com.finalpj.nbw.event.dao.EventCommentDao;
import com.finalpj.nbw.event.domain.EventComment;
import com.finalpj.nbw.notice.domain.NtComment;
import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import java.util.*;

@Repository
public class EventCommentDaoImpl implements EventCommentDao {

    private SqlSession sqlSession;

    private final String namespace = "com.finalpj.nbw.event.dao.EventCommentMapper.";

    public EventCommentDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

    /************************* [[디테일 페이지에서 댓글 조회]] *******************/
    @Override
    public List<EventComment> selectCommentList(Integer evc_no) throws Exception{
        return sqlSession.selectList(namespace+"selectCommentList", evc_no);
    }

    /************************* [[디테일 페이지에서 댓글 조회]] *******************/
    @Override
    public EventComment selectComment(Integer evc_no) throws Exception{
        return sqlSession.selectOne(namespace+"selectComment",evc_no);

    }

    /************************* [[디테일 페이지에서 댓글 등록]] *******************/
    @Override
    public int insertComment(EventComment eventComment) throws Exception{
        return sqlSession.insert(namespace+"insertComment", eventComment);
    }
    /************************* [[디테일 페이지에서 댓글 모두 삭제]] *******************/
    @Override
    public int deleteCommentList(Integer ev_no) throws Exception{
        return sqlSession.delete(namespace+"deleteCommentList",ev_no);
    }
    /************************* [[디테일 페이지에서 댓글 갯수 조회]] *******************/
    @Override
    public int selectCommentCnt(Integer ev_no) throws Exception{
        return sqlSession.selectOne(namespace+"selectCommentCnt", ev_no);
    }
    /************************* [[디테일 페이지에서 댓글 한 건 삭제]] *******************/
    @Override
    public int deleteComment(Integer evc_no, String evc_commenter) throws Exception{
        HashMap map = new HashMap();
        map.put("evc_no", evc_no);
        map.put("evc_commenter", evc_commenter);
        return sqlSession.delete(namespace+"deleteComment", map);
    }
    /************************* [[디테일 페이지에서 대댓글 있을 경우 삭제]] *******************/
    @Override
    public int deleteRepComment(Integer evc_no) throws Exception{
        HashMap map = new HashMap();
        return sqlSession.delete(namespace+"deleteRepComment", evc_no);
    }
    /************************* [[디테일 페이지에서 댓글 수정]] *******************/
    @Override
    public int updateComment(EventComment eventComment) throws Exception{
        return sqlSession.update(namespace+"updateComment",eventComment);
    }

}
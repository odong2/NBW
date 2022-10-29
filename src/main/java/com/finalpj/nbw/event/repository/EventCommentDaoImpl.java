package com.finalpj.nbw.event.repository;


import com.fastcampus.ch4.domain.*;

import com.finalpj.nbw.event.dao.EventCommentDaoTest;
import com.finalpj.nbw.event.domain.EventComment;
import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import java.util.*;

@Repository
public class EventCommentDao{
    @Autowired
    private SqlSession session;
    private static String namespace = "eventCommentDto";

    @Override
    public int count(Integer ev_no) throws Exception {
        return session.selectOne(namespace+"count", ev_no);
    } // T selectOne(String statement)

    @Override
    public int deleteAll(Integer ev_no) {
        return session.delete(namespace+"deleteAll", ev_no);
    } // int delete(String statement)

    @Override
    public int delete(Integer evc_no, String evc_commenter) throws Exception {
        Map map = new HashMap();
        map.put("evc_no", evc_no);
        map.put("evc_commenter", evc_commenter);
        return session.delete(namespace+"delete", map);
    } // int delete(String statement, Object parameter)

    @Override
    public int insert(EventComment eventCommentdto) throws Exception {
        return session.insert(namespace+"insert", eventCommentdto);
    } // int insert(String statement, Object parameter)

    @Override
    public List<EventComment> selectAll(Integer ev_no) throws Exception {
        return session.selectList(namespace+"selectAll", ev_no);
    } // List<E> selectList(String statement)

    @Override
    public EventComment select(Integer evc_no) throws Exception {
        return session.selectOne(namespace + "select", evc_no);
    } // T selectOne(String statement, Object parameter)

    @Override
    public int update(EventComment eventCommentDto) throws Exception {
        return session.update(namespace+"update", eventCommentDto);
    } // int update(String statement, Object parameter)
}

//    @Override
//    public int delete(Integer evc_no, String evc_commenter) throws Exception {
//        return 0;
//    }

//    // 이벤트 모든댓글 조회
//    @Override
//    public List<EventComment> selectAll(Integer evc_no) throws Exception {
//        return sqlSession.selectList("selectAll", evc_no);
//    }
//    // 댓글 한 건 조회
//    @Override
//    public EventComment select(Integer evc_no) throws Exception{
//        return sqlSession.selectOne("select", evc_no);
//
//    }
//
//    // 댓글 작성
//    @Override
//    public int insert(EventComment eventCommentDto) throws Exception {
//        return sqlSession.insert("insert", eventCommentDto);
//    }
//
//    // 댓글 수정
//    @Override
//    public int update(EventComment eventCommentDto) throws Exception {
//        return sqlSession.update("update", eventCommentDto);
//    }
//
//    특정 댓글 삭제
//    @Override
//    public int deleteEventComment(Integer evc_no, String evc_commenter) throws Exception {
//    HashMap map = new HashMap();
//    map.put("evc_no", evc_no);
//    map.put("evc_commenter", evc_commenter);
//    return  sqlSession.delete("delete", map);
//}
//    // 특정 이벤트 모든 댓글 삭제
//    @Override
//    public  int deletAll(Integer ev_no) throws Exception {
//        return  sqlSession.delete("deleteAll", ev_no);
//    }
//    // 특정 공지글 댓글 개수 조회
//    @Override
//    public int count(Integer ev_no) throws Exception{
//        return sqlSession.selectOne("count", ev_no);
//    }
//}

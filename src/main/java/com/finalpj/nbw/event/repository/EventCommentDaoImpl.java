package com.finalpj.nbw.event.repository;


import com.finalpj.nbw.event.dao.EventCommentDao;
import com.finalpj.nbw.event.domain.EventComment;
import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import java.util.*;

@Repository
public class EventCommentDaoImpl implements EventCommentDao {

    private SqlSession sqlSession;

    public EventCommentDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

    @Override
    public int count(Integer ev_no) throws Exception {
        return sqlSession.selectOne("count", ev_no);
    } // T selectOne(String statement)

    @Override
    public int deleteAll(Integer ev_no) {
        return sqlSession.delete("deleteAll", ev_no);
    } // int delete(String statement)

    @Override
    public int delete(Integer evc_no, String evc_commenter) throws Exception {
        Map map = new HashMap();
        map.put("evc_no", evc_no);
        map.put("evc_commenter", evc_commenter);
        return sqlSession.delete("delete", map);
    } // int delete(String statement, Object parameter)

    @Override
    public int insert(EventComment eventCommentdto) throws Exception {
        return sqlSession.insert("insert", eventCommentdto);
    } // int insert(String statement, Object parameter)

    @Override
    public List<EventComment> selectAll(Integer ev_no) throws Exception {
        return sqlSession.selectList("selectAll", ev_no);
    } // List<E> selectList(String statement)

    @Override
    public EventComment select(Integer evc_no) throws Exception {
        return sqlSession.selectOne("select", evc_no);
    } // T selectOne(String statement, Object parameter)

    @Override
    public int update(EventComment eventCommentDto) throws Exception {
        return sqlSession.update("update", eventCommentDto);
    } // int update(String statement, Object parameter)
}
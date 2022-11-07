package com.finalpj.nbw.qna.repository;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.qna.dao.QnaDao;
import com.finalpj.nbw.qna.domain.Qna;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Repository
public class QnaDaoImpl implements QnaDao {
    private SqlSession sqlSession;

    public QnaDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    /****************************** [[이벤트 전체조회]] **********************************/
    @Override
    public List<Qna> qnaList(String id) throws Exception {
        List<Qna> qnaList = null;
        qnaList = sqlSession.selectList("qnaSelectAll", id);
        log.info("QnaDao : eventList 호출 성공" + qnaList);
        return qnaList;
    }
    /****************************** [[Qna 처리중 조회]] **********************************/
    @Override
    public List<Qna> qnaIngList(String id) throws Exception {
        List<Qna> qnaIngList = null;
        qnaIngList = sqlSession.selectList("qnaSelectIngAll", id);
        log.info("QnaDao : eventList 호출 성공" + qnaIngList);
        return qnaIngList;
    }
    /****************************** [[Qna 답변완료 조회]] **********************************/
    @Override
    public List<Qna> qnaFinishList(String id) throws Exception {
        List<Qna> qnaFinishList = null;
        qnaFinishList = sqlSession.selectList("qnaSelectFinishAll", id);
        log.info("QnaDao : eventList 호출 성공" + qnaFinishList);
        return qnaFinishList;
    }

    /****************************** [[Qna 한건 조회]] **********************************/
    @Override
    public Qna qnaRead(Integer qn_no) throws Exception {
        return sqlSession.selectOne("qnaSelect", qn_no);
    }
    /****************************** [[Qna 한건 삭제]] **********************************/
    @Override
    public int  qnaDelete(Integer qn_no) throws Exception {
        log.info("다오인폴 Qna 한건 삭제");
        return sqlSession.delete("qnaDelete", qn_no);
    }
    /***************************** [[ Qna 전체 삭제 ]]*****************************/
    @Override
    public int qnaRemoveAll() throws Exception {
         return sqlSession.delete("qnaDeleteAll");
    }
    /**************************** [[Qna 작성]] ********************************/
    @Override
    public int qnaInsert(Qna qna) throws Exception {
        log.info("qna 다오인폴 호출 성공");
        return sqlSession.insert("qnaInsert", qna);
    }
}

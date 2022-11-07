package com.finalpj.nbw.qna.repository;

import com.finalpj.nbw.notice.domain.SearchCondition;
import com.finalpj.nbw.qna.dao.QnaDao;
import com.finalpj.nbw.qna.domain.Answer;
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
    private final String q_namespace = "com.finalpj.nbw.qna.dao.QnaMapper.";
    private final String a_namespace = "com.finalpj.nbw.qna.dao.AnswerMapper.";

    public QnaDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    /****************************** [[이벤트 전체조회]] **********************************/
    @Override
    public List<Qna> qnaList() throws Exception {
        List<Qna> qnaList = null;
        qnaList = sqlSession.selectList(q_namespace+"qnaSelectAll");
        log.info("QnaDao : eventList 호출 성공" + qnaList);
        return qnaList;
    }
    /****************************** [[Qna 처리중 조회]] **********************************/
    @Override
    public List<Qna> qnaIngList() throws Exception {
        List<Qna> qnaIngList = null;
        qnaIngList = sqlSession.selectList(q_namespace+"qnaSelectIngAll");
        log.info("QnaDao : eventList 호출 성공" + qnaIngList);
        return qnaIngList;
    }
    /****************************** [[Qna 답변완료 조회]] **********************************/
    @Override
    public List<Qna> qnaFinishList() throws Exception {
        List<Qna> qnaFinishList = null;
        qnaFinishList = sqlSession.selectList(q_namespace+"qnaSelectFinishAll");
        log.info("QnaDao : eventList 호출 성공" + qnaFinishList);
        return qnaFinishList;
    }

    /****************************** [[Qna 한건 조회]] **********************************/
    @Override
    public Qna qnaRead(Integer qn_no) throws Exception {
        return sqlSession.selectOne(q_namespace+"qnaSelect", qn_no);
    }
    /****************************** [[Qna 한건 삭제]] **********************************/
    @Override
    public int  qnaDelete(Integer qn_no) throws Exception {
        log.info("다오인폴 Qna 한건 삭제");
        return sqlSession.delete(q_namespace+"qnaDelete", qn_no);
    }
    /***************************** [[ Qna 전체 삭제 ]]*****************************/
    @Override
    public int qnaRemoveAll() throws Exception {
         return sqlSession.delete(q_namespace+"qnaDeleteAll");
    }
    /**************************** [[Qna 작성]] ********************************/
    @Override
    public int qnaInsert(Qna qna) throws Exception {
        log.info("qna 다오인폴 호출 성공");
        return sqlSession.insert(q_namespace+"qnaInsert", qna);
    }

    /**************************** [[ 관리자 답변 등록 ]] ********************************/
	@Override
	public int insertAnswer(Answer answer) throws Exception {
		return sqlSession.insert(a_namespace+"insertAnswer", answer);
	}

	/**************************** [[ 답변상태 업데이트 ]] ********************************/
	@Override
	public int updateState(Integer qn_no) throws Exception {
		return sqlSession.update(a_namespace+"updateState", qn_no);
	}

	/**************************** [[ 관리자 답변 한 건 조회 ]] ********************************/
	@Override
	public Answer selectAnswer(Integer qn_no) throws Exception {
		return sqlSession.selectOne(a_namespace+"selectAnswer", qn_no);
	}

	/**************************** [[ 관리자 답변 삭제 ]] ********************************/
	@Override
	public int deleteAnswer(Integer qn_no) throws Exception {
		return sqlSession.delete(a_namespace+"deleteAnswer", qn_no);
	}
	@Override
	public int updateStateN(Integer qn_no) throws Exception {
		return sqlSession.update(a_namespace+"updateStateN", qn_no);
	}

	/**************************** [[ 관리자 답변 수정 ]] ********************************/
	@Override
	public int updateAnswer(Answer answer) throws Exception {
		return sqlSession.update(a_namespace+"updateAnswer", answer);
	}

	/**************************** [[ 문의사항 전체 갯수 조회 ]] ********************************/
	@Override
	public int selectQuestionCnt() throws Exception {
		return sqlSession.selectOne(a_namespace+"selectQuestionCnt");
	}

	/**************************** [[ 문의사항 페이징 조회 ]] ********************************/
	@Override
	public List<Qna> selectQuestionPage(Map map) throws Exception {
		return sqlSession.selectList(a_namespace+"selectQnaPage", map);
	}

	/**************************** [[ 조건검색 결과 문의 개수 ]] ********************************/
	@Override
	public int selectSearchQCnt(SearchCondition sc) throws Exception {
		return sqlSession.selectOne(a_namespace+"selectSearchQCnt");
	}

	/**************************** [[ 조건검색 페이징 처리하여 조회 ]] ********************************/
	@Override
	public List<Qna> selectSearchQPage(SearchCondition sc) throws Exception {
		return sqlSession.selectList(a_namespace+"selectSearchQPage", sc);
	}
}

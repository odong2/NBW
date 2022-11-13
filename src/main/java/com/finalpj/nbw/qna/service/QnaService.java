package com.finalpj.nbw.qna.service;

import com.finalpj.nbw.member.domain.Member;
import com.finalpj.nbw.notice.domain.SearchCondition;
import com.finalpj.nbw.qna.dao.QnaDao;
import com.finalpj.nbw.qna.domain.Answer;
import com.finalpj.nbw.qna.domain.Qna;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Log4j
@Service
public class QnaService {

    private final QnaDao qnaDao;

    public QnaService(QnaDao qnaDao){
        this.qnaDao = qnaDao;
    }

    /********************************* [[Qna 전체 조회]] **************************************/
    @Transactional(readOnly = true)
    public List<Qna> qnaList(String id) throws Exception {
        log.info("QnaService : qnaList 호출성공");
        List<Qna> qnaList = null;
        qnaList = qnaDao.qnaList(id);
        log.info("QnaService : qnaList 호출성공");
        return qnaList;
    }

    /********************************* [[Qna 처리중 조회]] **************************************/
    @Transactional(readOnly = true)
    public List<Qna> qnaIngList(HttpSession session) throws Exception {
        log.info("QnaService : qnaIngList 호출성공");
        Member member = (Member) session.getAttribute("member");
        String id = "";
        List<Qna> qnaIngList = null;
        if(member == null ){
           return qnaIngList = qnaDao.qnaIngList(id);
        }
         id = member.getMem_id();
        qnaIngList = qnaDao.qnaIngList(id);
        return qnaIngList;
    }

    /********************************* [[Qna 처리중 조회]] **************************************/
    @Transactional(readOnly = true)
    public List<Qna> qnaFinishList(String id) throws Exception {
        log.info("QnaService : qnaFinishList 호출성공");
        List<Qna> qnaFinishList = null;
        qnaFinishList = qnaDao.qnaFinishList(id);
        log.info("QnaService : qnaFinishList 호출성공");
        return qnaFinishList;
    }

    /********************************* [[Qna 한 건 조회]] **************************************/
    @Transactional(readOnly = true)
    public Qna qnaRead(Integer qn_no) throws Exception {
        log.info("Qna 한건 서비스 호출");
        return qnaDao.qnaRead(qn_no);
    }
    /********************************* [[Qna 한건 삭제]] **************************************/
    @Transactional(rollbackFor = Exception.class)
    public int qnaDelete (Integer qn_no) throws Exception{
        log.info("서비스 Qna 한건 삭제 호출");
        return qnaDao.qnaDelete(qn_no);
    }

    /******************************* [[Qna 전체 삭제]] ******************************/
//    @Transactional(rollbackFor = Exception.class)
//    public int qnaRemoveAll () throws Exception {
//        return qnaDao.qnaRemoveAll();
//    }
    /****************************** [[Qna 작성]] ****************************/
    @Transactional(rollbackFor = Exception.class)
    public int qnaWrite(Qna qna) throws Exception {
        log.info("서비스 qna 작성 호출 성공");
        return qnaDao.qnaInsert(qna);
    }
    
    /****************************** [[ 관리자 답변 등록 ]] ****************************/
    @Transactional(rollbackFor = Exception.class)
    public void writeAnswer(Answer answer, Integer qn_no) throws Exception {
    	log.info("서비스 관리자 답변등록 호출");
    	int result = 0;
    	result = qnaDao.insertAnswer(answer);
    	log.info(result);
    	if(result == 1) { // insert에 성공하면
    		qnaDao.updateState(qn_no); // 답변 상태 업데이트 해주기
    	}
    }
    
    /****************************** [[ 관리자 답변 한 건 조회 ]] ****************************/
	public Answer answerRead(Integer qn_no) {
		log.info("서비스 관리자 답변 조회 호출");
		Answer an = null;
		try {
			an = qnaDao.selectAnswer(qn_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return an;
	}

	/****************************** [[ 관리자 답변 수정 ]] ****************************/
	@Transactional(rollbackFor = Exception.class)
	public void modifyAnswer(Answer answer) throws Exception {
		log.info("서비스 관리자 답변 수정 호출");
		qnaDao.updateAnswer(answer); 
	}
	/****************************** [[ 관리자 답변 삭제 ]] ****************************/
	@Transactional(rollbackFor = Exception.class)
	public void deleteAnswer(Integer qn_no) throws Exception {
		log.info("서비스 관리자 답변 삭제 호출");
    	int result = 0;
    	result = qnaDao.deleteAnswer(qn_no);
    	log.info(result);
    	if(result == 1) { // insert에 성공하면
    		qnaDao.updateStateN(qn_no); // 답변 상태 업데이트 해주기
    	}
	}
	
	/****************************** [[ 문의사항 전체 갯수 조회 ]] ****************************/
	public int getQuestionTotalCnt() throws Exception {
		return qnaDao.selectQuestionCnt();
	}
	
	/****************************** [[ 문의사항 조건 검색 총 갯수 ]] ****************************/
	public int getSearchCnt(SearchCondition sc) throws Exception {
		return qnaDao.selectSearchQCnt(sc);
	}
	
	/****************************** [[ 조건 검색 페이지 ]] ****************************/
	public List<Qna> getPageQuestionList(Map map) throws Exception {
		return qnaDao.selectQuestionPage(map);
	}
	
	public List<Qna> getSearchPage(SearchCondition sc) throws Exception {
		return qnaDao.selectSearchQPage(sc);
	}
	
	/****************************** [[ 답변하지 않은 문의사항 갯수 가져오기 ]] ****************************/
	public int getQuestionIngCnt() throws Exception {
		return qnaDao.selectIngCnt();
	}
}

package com.finalpj.nbw.qna.dao;

import com.finalpj.nbw.notice.domain.SearchCondition;
import com.finalpj.nbw.qna.domain.Answer;
import com.finalpj.nbw.qna.domain.Qna;

import java.util.List;
import java.util.Map;

public interface QnaDao {

    /****************************** Qna 전체 조회 ***************************/
    List<Qna> qnaList(String id) throws Exception;
    /****************************** Qna 한건 조회 ***************************/
    Qna qnaRead(Integer qn_no) throws Exception;
    /****************************** Qna 처리중 조회 *****************************/
    List<Qna> qnaIngList(String id) throws Exception;
    /****************************** Qna 답변완료 조회 *****************************/
    List<Qna> qnaFinishList(String id) throws Exception;
    /****************************** Qna 한건 삭제 ************************************/
    int qnaDelete(Integer qn_no) throws Exception;
    /****************************** Qna 전체 삭제 ************************/
    int qnaRemoveAll() throws Exception;
    /****************************** Qna 등록 *****************************/
    int qnaInsert(Qna qna) throws Exception;
    
    /********************** [[ 관리자 답변 ]] **********************/
    int insertAnswer(Answer answer) throws Exception; // 관리자 답변 등록
    int updateState(Integer qn_no) throws Exception; // 답변 상태 업데이트
    Answer selectAnswer(Integer qn_no) throws Exception; // 문의에 대한 관리자 답변 한 건 조회
    int deleteAnswer(Integer qn_no) throws Exception; // 문의답변 삭제
    int updateAnswer(Answer answer) throws Exception; // 문의 내용 수정
    int updateStateN(Integer qn_no) throws Exception; // 답변 삭제 후 상태 업데이트
    
    int selectQuestionCnt() throws Exception; // 문의 전체 갯수
    List<Qna> selectQuestionPage(Map map) throws Exception; // 문의 페이지 조회
    int selectSearchQCnt(SearchCondition sc) throws Exception; // 조건검색 결과 문의 개수
    List<Qna> selectSearchQPage(SearchCondition sc) throws Exception; // 조건 검색 페이징 처리하여 조회
    int selectIngCnt() throws Exception; // 답변하지 않은 문의 갯수
}

package com.finalpj.nbw.qna.dao;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.qna.domain.Qna;

import java.util.List;

public interface QnaDao {

    /****************************** Qna 전체 조회 ***************************/
    List<Qna> qnaList() throws Exception;
    /****************************** Qna 한건 조회 ***************************/
    Qna qnaRead(Integer qn_no) throws Exception;
    /****************************** Qna 처리중 조회 *****************************/
    List<Qna> qnaIngList() throws Exception;
    /****************************** Qna 답변완료 조회 *****************************/
    List<Qna> qnaFinishList() throws Exception;
    /****************************** Qna 한건 삭제 ************************************/
    int qnaDelete(Integer qn_no) throws Exception;
    /****************************** Qna 전체 삭제 ************************/
    int qnaRemoveAll() throws Exception;
    /****************************** Qna 등록 *****************************/
    int qnaInsert(Qna qna) throws Exception;
}

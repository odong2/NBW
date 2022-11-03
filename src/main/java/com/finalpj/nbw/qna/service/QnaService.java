package com.finalpj.nbw.qna.service;

import com.finalpj.nbw.event.domain.Event;
import com.finalpj.nbw.qna.dao.QnaDao;
import com.finalpj.nbw.qna.domain.Qna;
import lombok.extern.log4j.Log4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
public class QnaService {

    private final QnaDao qnaDao;

    Logger logger = LoggerFactory.getLogger(QnaService.class);

    public QnaService(QnaDao qnaDao){
        this.qnaDao = qnaDao;
    }
    /********************************* [[Qna 전체 조회]] **************************************/
    @Transactional(readOnly = true)
    public List<Qna> qnaList() throws Exception {
        logger.info("QnaService : qnaList 호출성공");
        List<Qna> qnaList = null;
        qnaList = qnaDao.qnaList();
        logger.info("QnaService : qnaList 호출성공");
        return qnaList;
    }
    /********************************* [[Qna 처리중 조회]] **************************************/
    @Transactional(readOnly = true)
    public List<Qna> qnaIngList() throws Exception {
        logger.info("QnaService : qnaIngList 호출성공");
        List<Qna> qnaIngList = null;
        qnaIngList = qnaDao.qnaIngList();
        logger.info("QnaService : qnaIngList 호출성공");
        return qnaIngList;
    }
    /********************************* [[Qna 처리중 조회]] **************************************/
    @Transactional(readOnly = true)
    public List<Qna> qnaFinishList() throws Exception {
        logger.info("QnaService : qnaFinishList 호출성공");
        List<Qna> qnaFinishList = null;
        qnaFinishList = qnaDao.qnaFinishList();
        logger.info("QnaService : qnaFinishList 호출성공");
        return qnaFinishList;
    }

    /********************************* [[Qna 한 건 조회]] **************************************/
    @Transactional(readOnly = true)
    public Qna qnaRead(Integer qn_no) throws Exception {
        logger.info("Qna 한건 서비스 호출");
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

}

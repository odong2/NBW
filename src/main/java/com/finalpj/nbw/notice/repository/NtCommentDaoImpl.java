package com.finalpj.nbw.notice.repository;

import com.finalpj.nbw.notice.dao.NtCommentDao;
import com.finalpj.nbw.notice.domain.NtComment;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class NtCommentDaoImpl implements NtCommentDao {
    private final SqlSession sqlSession;
    private final String namespace="com.finalpj.nbw.notice.dao.NtCommentMapper.";
    public NtCommentDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    
    /*************************** 특정 공지글 댓글 모두 삭제 ************************/
    @Override
    public int deleteCommentList(Integer nt_no) throws Exception{
        return sqlSession.delete(namespace+"deleteCommentList",nt_no);
    }
    /*************************** 특정 공지글 댓글 개수 조회 ************************/
    @Override
    public int selectCommentCnt(Integer nt_no) throws Exception{
        return sqlSession.selectOne(namespace+"selectCommentCnt", nt_no);
    }
    /****************************** 댓글 삭제 *******************************/
    @Override
    public int deleteComment(Integer ntc_no, String ntc_commenter) throws Exception{
        HashMap map = new HashMap();
        map.put("ntc_no", ntc_no);
        map.put("ntc_commenter", ntc_commenter);
        return sqlSession.delete(namespace+"deleteComment", map);
    }

    /************************* 댓글 삭제 후 답글있을 경우 삭제 *****************************/
    @Override
    public int deleteRepComment(Integer ntc_no) throws Exception{
        HashMap map = new HashMap();
        return sqlSession.delete(namespace+"deleteRepComment", ntc_no);
    }
    /****************************** 댓글 등록 *******************************/
    @Override
    public int insertComment(NtComment ntCommentDto) throws Exception{
        return sqlSession.insert(namespace+"insertComment", ntCommentDto);
    }

    /************************ 특정 공지글 모든 댓글 조회 ***************************/
    @Override
    public List<NtComment> selectCommentList(Integer ntc_no) throws Exception{
        return sqlSession.selectList(namespace+"selectCommentList", ntc_no);
    }
    /****************************** 댓글 한건 조회 *******************************/
    @Override
    public NtComment selectComment(Integer ntc_no) throws Exception{
        return sqlSession.selectOne(namespace+"selectComment",ntc_no);

    }
    /****************************** 댓글 수정 *******************************/
    @Override
    public int updateComment(NtComment ntCommentDto) throws Exception{
        return sqlSession.update(namespace+"updateComment",ntCommentDto);
    }
}

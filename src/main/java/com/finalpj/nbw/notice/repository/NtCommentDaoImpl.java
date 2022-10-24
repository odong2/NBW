package com.finalpj.nbw.notice.repository;

import com.finalpj.nbw.notice.dao.NtCommentDao;
import com.finalpj.nbw.notice.domain.NtComment;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class NtCommentDaoImpl implements NtCommentDao {
    private SqlSession sqlSession;

    public NtCommentDaoImpl(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    // 특정 공지글 모든 댓글 삭제
    @Override
    public int deleteAll(Integer nt_no) throws Exception{
        return sqlSession.delete("deleteAll",nt_no);
    }
    // 특정 공지글 댓글 개수 조회
    @Override
    public int count(Integer nt_no) throws Exception{
        return sqlSession.selectOne("count", nt_no);
    }
    // 특정 댓글 삭제
    @Override
    public int delete(Integer ntc_no, String ntc_commenter) throws Exception{
        HashMap map = new HashMap();
        map.put("ntc_no", ntc_no);
        map.put("ntc_commenter", ntc_commenter);
        return sqlSession.delete("delete", map);
    }
    // 댓글 등록
    @Override
    public int insert(NtComment ntCommentDto) throws Exception{
        return sqlSession.insert("insert", ntCommentDto);
    }
    @Override
    public List<NtComment> selectAll(Integer ntc_no) throws Exception{
        return sqlSession.selectList("selectAll", ntc_no);
    }
    // 댓글 한 건 조회
    @Override
    public NtComment select(Integer ntc_no) throws Exception{
        return sqlSession.selectOne("select",ntc_no);

    }
    // 댓글 수정
    @Override
    public int update(NtComment ntCommentDto) throws Exception{
        return sqlSession.update("update",ntCommentDto);
    }
}

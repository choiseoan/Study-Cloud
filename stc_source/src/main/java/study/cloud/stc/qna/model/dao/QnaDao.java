package study.cloud.stc.qna.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import study.cloud.stc.qna.model.vo.QnaVo;
 

@Repository
public class QnaDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert(QnaVo vo) {
		return sqlSession.insert("product.insertQna", vo);
	}

	/* product/detail/qna 페이징 처리 화면 */
	public int selectQnaCount(int proNum) throws Exception{
		return sqlSession.selectOne("product.selectQnaCount", proNum);
	}
	public List<QnaVo> selectQnaList(int currentPage, int limit, int proNum) throws Exception{
		return sqlSession.selectList("product.selectQnaList", proNum, new RowBounds((currentPage-1)*limit, limit));
	}

	public int update(QnaVo vo) throws Exception{
		return sqlSession.update("product.updateQna", vo);
	}
	public int delete(int qnaNum) throws Exception{
		return sqlSession.delete("product.deleteQna", qnaNum);
	}
	public int updateReply(QnaVo vo) throws Exception{
		return sqlSession.update("product.updateReply", vo);
	}

	/* host/qna 페이징 List */
	public int selectHostQnaCount(int proNum) throws Exception{
		return sqlSession.selectOne("product.selectQnaCount", proNum);
	}
	
	public List<QnaVo> selectHostProductQnaList(int currentPage, int limit, int proNum) throws Exception{
		return sqlSession.selectList("product.selectHostProductQnaList", proNum, new RowBounds((currentPage-1)*limit, limit));
	}
	// host/qna 호스트 답변 삭제
	public int deleteReply(int qnaNum) throws Exception{
		return sqlSession.update("product.replyDeleteQna", qnaNum);
	}

	// user qna
	public int selectUserQnaCount(QnaVo vo) throws Exception{
		return sqlSession.selectOne("product.selectUserQnaCount", vo);
	}
	public List<QnaVo> selectUserQnaList(String name) throws Exception{
		return sqlSession.selectList("product.selectUserQnaList", name);
	}
	public List<QnaVo> selectUserQna(int currentPage, int limit, QnaVo vo) throws Exception{
		return sqlSession.selectList("product.selectUserQna", vo, new RowBounds((currentPage-1)*limit, limit));
	}

	

}

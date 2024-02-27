package study.cloud.stc.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import study.cloud.stc.notice.model.vo.NoticeVo;


@Repository
public class NoticeDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(NoticeVo vo) throws Exception{
		return sqlSession.insert("notice.insert", vo);
	}
	
	public int update(NoticeVo vo) throws Exception{
		return sqlSession.update("notice.update", vo);
	}
	
	public int delete(int notiNum) throws Exception{
		return sqlSession.delete("notice.delete", notiNum);
	}

	public int selectCount(String notiIdx) throws Exception{
		return sqlSession.selectOne("notice.selectOneCount", notiIdx);
	}

	public List<NoticeVo> selectList(int currentPage, int limit, String notiIdx) throws Exception {
		return sqlSession.selectList("notice.selectList", notiIdx, new RowBounds((currentPage-1)*limit, limit));
	}

	public List<NoticeVo> selectNotiIdx() {
		return sqlSession.selectList("notice.selectNotiIdx");
	}
}

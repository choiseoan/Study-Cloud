package study.cloud.stc.test.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import study.cloud.stc.member.model.vo.MemberVo;
import study.cloud.stc.test.model.vo.TestVo;

@Repository
public class TestDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert(TestVo vo) throws Exception {
		return sqlSession.insert("testMember.testinsert", vo);
	}
	public int update(TestVo vo) throws Exception {
		return sqlSession.update("testMember.testupdate", vo);
	}
	public int delete(String id) throws Exception {
		return sqlSession.delete("testMember.testdelete", id);
	}
	public TestVo selectOne(int boardNum) throws Exception {
		return sqlSession.selectOne("testMember.testselectOne", boardNum);
	}
	public List<TestVo> selectList() throws Exception {
		return sqlSession.selectList("testMember.testselectList");
	}
	
	public List<TestVo> selectList(int currentPage, int limit) throws Exception {
		
		int offset = (currentPage -1 )*limit;
		
		RowBounds rb = new RowBounds(offset, limit);
		
		return sqlSession.selectList("testMember.testselectList", null , rb);
	}
	
	
	public int selectCount() throws Exception {
		return sqlSession.selectOne("testMember.selectCount");
	}
	
	public int insertKakao(MemberVo vo) {
		int result ;
		
		result = sqlSession.insert("memberns.kakaoinsert", vo);
		
		return result;
	}
	
	public MemberVo kakaoselect(String memId) throws Exception {
		
		return sqlSession.selectOne("memberns.kakaoselect", memId);		
		
	}
	
	
	public MemberVo kakaoselectdivision(String memId) throws Exception {
		
		return sqlSession.selectOne("memberns.kakaoselectauth", memId);		
		
	}
	
	
	
}

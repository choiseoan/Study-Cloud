package study.cloud.stc;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import study.cloud.stc.member.model.vo.MemberVo;

@Repository
public class KakaoLoginDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int kakaoinsert(String memId,String memEmail,String memName) {
		int result = 0;
		
		result = sqlSession.insert("memberns.kakaoinsert",memId);
		
		return result;		
	}
	
}

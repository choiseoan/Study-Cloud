package study.cloud.stc.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import study.cloud.stc.member.model.vo.MemberVo;
import study.cloud.stc.test.model.vo.TestVo;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession session;
	
	
	// 회원가입
	public int idCheck(String memId) {
        return session.selectOne("memberns.idCheck", memId);
    }
	
	public int insertJoin(MemberVo vo) {
		return session.insert("memberns.insertJoin", vo);
	}

	
// -----------------------------------------------------------------------------------------------------------
	
	public List<MemberVo> selectList(MemberVo vo) throws Exception {
		return session.selectList("memberns.SelectListUser", vo);
	}

// -----------------------------------------------------------------------------------------------------------
	
	public int selectCount() throws Exception {
		return session.selectOne("memberns.selectCountUser");
	}

	
	public int selectUnblockCount() {
		return session.selectOne("memberns.selectUnblockCountUser");
	}
	
	public int selectBlockCount() {
		return session.selectOne("memberns.selectBlockCountUser");
	}
	
	public int selectSnsCount() {
		// TODO Auto-generated method stub
		return session.selectOne("memberns.selectSnsCount");
	}
	
// -----------------------------------------------------------------------------------------------------------


	
	public List<MemberVo> selectListTest(int currentPage, int limit, MemberVo vo) throws Exception {
			
		int offset = (currentPage -1 )*limit;
		
		RowBounds rb = new RowBounds(offset, limit);
		
		return session.selectList("memberns.SelectListUser", vo , rb);
	}

	public int memberblock(MemberVo vo) {
		// TODO Auto-generated method stub
		return session.update("memberblock", vo);
	}

	public int memberUnblock(MemberVo vo) {
		// TODO Auto-generated method stub
		return session.update("memberUnblock", vo);
	}

	public List<MemberVo> selectUnblockUsers(int currentPage, int limit, MemberVo vo) {
		int offset = (currentPage -1 )*limit;
		
		RowBounds rb = new RowBounds(offset, limit);
		
		return session.selectList("memberns.selectUnblockUser", vo , rb);
	}

	public List<MemberVo> selectBlockUsers(int currentPage, int limit, MemberVo vo) {
		int offset = (currentPage -1 )*limit;
		
		RowBounds rb = new RowBounds(offset, limit);
		
		return session.selectList("memberns.selectBlockUser", vo , rb);
	}

	public List<MemberVo> selectSnskUsers(int currentPage, int limit, MemberVo vo) {
		int offset = (currentPage -1 )*limit;
		
		RowBounds rb = new RowBounds(offset, limit);
		
		return session.selectList("memberns.selectSnsUser", vo , rb);
	}

	
	
	
	public List<MemberVo> selectListHost(int currentPage, int limit, MemberVo vo) {
		int offset = (currentPage -1 )*limit;
		
		RowBounds rb = new RowBounds(offset, limit);
		
		return session.selectList("memberns.selectListHost", vo , rb);
	}

	public List<MemberVo> selectUnblockHost(int currentPage, int limit, MemberVo vo) {
		int offset = (currentPage -1 )*limit;
		
		RowBounds rb = new RowBounds(offset, limit);
		
		return session.selectList("memberns.selectUnblockHost", vo , rb);
	}

	public List<MemberVo> selectBlockHost(int currentPage, int limit, MemberVo vo) {
		int offset = (currentPage -1 )*limit;
		
		RowBounds rb = new RowBounds(offset, limit);
		
		return session.selectList("memberns.selectBlockHost", vo , rb);
	}



// -----------------------------------------------------------------------------------------------------------

	public int selectCountHost() {
		return session.selectOne("memberns.selectCountHost");
	}

	public int selectUnblockCountHost() {
		return session.selectOne("memberns.selectUnblockCountHost");
	}

	public int selectBlockCountHost() {
		return session.selectOne("memberns.selectBlockCountHost");
	}

// -----------------------------------------------------------------------------------------------------------

	
	public MemberVo updatePasswd(MemberVo vo) {
		// TODO Auto-generated method stub
		return session.selectOne("memberns.updatePasswd", vo);
	}
	
	public MemberVo findAccount(MemberVo vo) {
		// TODO Auto-generated method stub
		return session.selectOne("memberns.findAccount", vo);
	}
// -----------------------------------------------------------------------------------------------------------

	public int mailPasswd(MemberVo renewal) {
		// TODO Auto-generated method stub
		return session.update("memberns.mailPasswd", renewal);
	}
	
	public MemberVo mailId(MemberVo vo) {
		// TODO Auto-generated method stub
		return session.selectOne("memberns.mailId", vo);
	}
// -----------------------------------------------------------------------------------------------------------
	
	public MemberVo takeInfo(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("memberns.getInfo", vo);
	}

	public int updateHostInfo(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("memberns.updateHostInfo", vo);
	}

	public MemberVo quitStdInfo(MemberVo stdVo)  throws Exception{
		// TODO Auto-generated method stub
		return session.selectOne("memberns.quitStdInfo", stdVo);
	}



	public MemberVo viweDetailInfo(String memId) {
		// TODO Auto-generated method stub
		return session.selectOne("memberns.viewDetailInfo", memId);
	}

	
	

	

	

	

	
	
}

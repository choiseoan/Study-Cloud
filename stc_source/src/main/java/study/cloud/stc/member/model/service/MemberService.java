package study.cloud.stc.member.model.service;

import java.util.List;

import study.cloud.stc.member.model.vo.MemberVo;
import study.cloud.stc.notice.model.vo.NoticeVo;

public interface MemberService {
	
	//회원가입
	public int idCheck(String memId) throws Exception;
	public int insertJoin(MemberVo vo) throws Exception;
	
// ------------------------------------------------------------------------------------------------------------	
	
	public List<MemberVo> selectList(MemberVo vo) throws Exception;
// ----------------------------------------------------------------------------------------------------------- 
	public int selectCount() throws Exception;
	
	public int selectUnblockCount() throws Exception;
	public int selectBlockCount() throws Exception;
	public int selectSnsCount() throws Exception;

// -----------------------------------------------------------------------------------------------------------

	public int selectCountHost() throws Exception;
	
	public int selectUnblockCountHost() throws Exception;
	public int selectBlockCountHost() throws Exception;
	
// ------------------------------------------------------------------------------------------------------------	
	
	public List<MemberVo> selectListTest(int currentPage, int limit, MemberVo vo) throws Exception;
	
	public List<MemberVo> selectUnblockUsers(int currentPage, int limit, MemberVo vo) throws Exception;
	public List<MemberVo> selectBlockUsers(int currentPage, int limit, MemberVo vo) throws Exception;
	public List<MemberVo> selectSnskUsers(int currentPage, int limit, MemberVo vo) throws Exception;

	
// ------------------------------------------------------------------------------------------------------------	
	
	public List<MemberVo> selectListHost(int currentPage, int limit, MemberVo vo) throws Exception;
	
	public List<MemberVo> selectUnblockHost(int currentPage, int limit, MemberVo vo) throws Exception;
	public List<MemberVo> selectBlockHost(int currentPage, int limit, MemberVo vo) throws Exception;
	
//	------------------------------------------------------------------------------------------------------------
	
	public int memberblock(MemberVo vo) throws Exception;
	public int memberUnblock(MemberVo vo) throws Exception;
	
// ------------------------------------------------------------------------------------------------------------		
	
	public MemberVo updatePasswd(MemberVo vo) throws Exception;
	public MemberVo findAccount(MemberVo vo) throws Exception;
	
// ------------------------------------------------------------------------------------------------------------		

	public int mailPasswd(MemberVo renewal) throws Exception;
	public MemberVo mailId(MemberVo vo) throws Exception;
		
// ------------------------------------------------------------------------------------------------------------		

	public MemberVo takeInfo(MemberVo vo) throws Exception;
	public int updateHostInfo(MemberVo vo)throws Exception;
	
	public MemberVo quitStdInfo(MemberVo stdVo) throws Exception;
	
	public MemberVo viweDetailInfo(String standname);
	
}
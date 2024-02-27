package study.cloud.stc.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.cloud.stc.member.model.dao.MemberDao;
import study.cloud.stc.member.model.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;

	
	// 회원가입
	@Override
	public int insertJoin(MemberVo vo) throws Exception {
		return dao.insertJoin(vo);
	}
	@Override
	public int idCheck(String memId) throws Exception{
		return dao.idCheck(memId);
	}
	
// ----------------------------------------------------------------------------------------------------------- 	
	
	@Override
	public List<MemberVo> selectList(MemberVo vo) throws Exception {

		return dao.selectList(vo);
	}

// ----------------------------------------------------------------------------------------------------------- 
	@Override
	public int selectCount() throws Exception {

		return dao.selectCount();

	}

	@Override
	public int selectUnblockCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectUnblockCount();
	}

	@Override
	public int selectBlockCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectBlockCount();
	}

	@Override
	public int selectSnsCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectSnsCount();
	}

// ----------------------------------------------------------------------------------------------------------- 
	@Override
	public List<MemberVo> selectListTest(int currentPage, int limit, MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectListTest(currentPage, limit, vo);
	}

	@Override
	public int memberblock(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.memberblock(vo);
	}

	@Override
	public int memberUnblock(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.memberUnblock(vo);
	}

	@Override
	public List<MemberVo> selectUnblockUsers(int currentPage, int limit, MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectUnblockUsers(currentPage, limit, vo);
	}

	@Override
	public List<MemberVo> selectBlockUsers(int currentPage, int limit, MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectBlockUsers(currentPage, limit, vo);
	}

	@Override
	public List<MemberVo> selectSnskUsers(int currentPage, int limit, MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectSnskUsers(currentPage, limit, vo);
	}

	@Override
	public List<MemberVo> selectListHost(int currentPage, int limit, MemberVo vo) throws Exception {
		return dao.selectListHost(currentPage, limit, vo);
	}

	@Override
	public List<MemberVo> selectUnblockHost(int currentPage, int limit, MemberVo vo) throws Exception {
		return dao.selectUnblockHost(currentPage, limit, vo);
	}

	@Override
	public List<MemberVo> selectBlockHost(int currentPage, int limit, MemberVo vo) throws Exception {
		return dao.selectBlockHost(currentPage, limit, vo);
	}

// ----------------------------------------------------------------------------------------------------	

	@Override
	public int selectCountHost() throws Exception {
		return dao.selectCountHost();
	}

	@Override
	public int selectUnblockCountHost() throws Exception {
		return dao.selectUnblockCountHost();
	}

	@Override
	public int selectBlockCountHost() throws Exception {
		return dao.selectBlockCountHost();
	}

//----------------------------------------------------------------------------------------------------	

	@Override
	public MemberVo updatePasswd(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updatePasswd(vo);
	}
	
	@Override
	public MemberVo findAccount(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.findAccount(vo);
	}
// ----------------------------------------------------------------------------------------------------
	@Override
	public int mailPasswd(MemberVo renewal) {
		// TODO Auto-generated method stub
		return dao.mailPasswd(renewal);
	}
	
	@Override
	public MemberVo mailId(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.mailId(vo);
	}

// ----------------------------------------------------------------------------------------------------
		
	@Override
	public MemberVo takeInfo(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.takeInfo(vo);
	}

	@Override
	public int updateHostInfo(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateHostInfo(vo);
	}

	@Override
	public MemberVo quitStdInfo(MemberVo stdVo) throws Exception {
		// TODO Auto-generated method stub
		return dao.quitStdInfo(stdVo);
	}



	@Override
	public MemberVo viweDetailInfo(String standname) {
		// TODO Auto-generated method stub
		return dao.viweDetailInfo(standname);
	}
	
	
}
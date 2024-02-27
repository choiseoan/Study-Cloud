package study.cloud.stc.chatting.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.cloud.stc.chatting.model.dao.MemberRoomDao;
import study.cloud.stc.chatting.model.vo.MemberRoomVo;

@Service
public class MemberRoomServiceImpl implements MemberRoomService {

	@Autowired
	MemberRoomDao dao;
	
	@Override
	public MemberRoomVo viewMemberId(MemberRoomVo mrvo) {
		// TODO Auto-generated method stub
		return dao.viewMemberId(mrvo);
	}

	@Override
	public int addMemId(MemberRoomVo mrvo) {
		// TODO Auto-generated method stub
		return dao.addMemId(mrvo);
	}

	@Override
	public List<MemberRoomVo> selectAdminEntry(String room_id) {
		// TODO Auto-generated method stub
		return dao.selectAdminEntry(room_id);
	}

	@Override
	public List<MemberRoomVo> selectUserEntry(String room_id) {
		// TODO Auto-generated method stub
		return dao.selectUserEntry(room_id);
	}

	@Override
	public int onlineUser(MemberRoomVo mrvo) {
		// TODO Auto-generated method stub
		return dao.onlineUser(mrvo);
	}

	@Override
	public int offlineUser(MemberRoomVo mrvo) {
		// TODO Auto-generated method stub
		return dao.offlineUser(mrvo);
	}

}

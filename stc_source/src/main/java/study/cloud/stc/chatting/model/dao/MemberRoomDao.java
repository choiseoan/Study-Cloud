package study.cloud.stc.chatting.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import study.cloud.stc.chatting.model.vo.MemberRoomVo;

@Repository
public class MemberRoomDao {

	@Autowired
	private SqlSession session;
	
	public MemberRoomVo viewMemberId(MemberRoomVo mrvo) {
		// TODO Auto-generated method stub
		return session.selectOne("memroomns.viewMemberId", mrvo);
	}

	public int addMemId(MemberRoomVo mrvo) {
		// TODO Auto-generated method stub
		return session.insert("memroomns.addMemId", mrvo);
	}

	public List<MemberRoomVo> selectAdminEntry(String room_id) {
		// TODO Auto-generated method stub
		return session.selectList("memroomns.selectAdminEntry", room_id);
	}

	public List<MemberRoomVo> selectUserEntry(String room_id) {
		// TODO Auto-generated method stub
		return session.selectList("memroomns.selectUserEntry", room_id);
	}

	public int onlineUser(MemberRoomVo mrvo) {
		// TODO Auto-generated method stub
		return session.update("memroomns.onlineUser", mrvo);
	}

	public int offlineUser(MemberRoomVo mrvo) {
		// TODO Auto-generated method stub
		return session.update("memroomns.offlineUser", mrvo);
	}

}

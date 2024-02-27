package study.cloud.stc.chatting.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import study.cloud.stc.chatting.model.vo.ChattRoomVo;
import study.cloud.stc.chatting.model.vo.ChattingVo;

@Repository
public class ChattingDao {

	@Autowired
	private SqlSession session;
	
	public int addtMessage(ChattingVo vo) {
		// TODO Auto-generated method stub
		return session.insert("chatns.addtMessage", vo);
	}

	public List<ChattingVo> selectListMessage(ChattingVo schvo) {
		// TODO Auto-generated method stub
		return session.selectList("chatns.selectListMessage", schvo);
	}

	public int reduceCount(String chaContents) {
		// TODO Auto-generated method stub
		return session.update("chatns.reduceCount", chaContents);
	}

	public int entreducecount(String memId) {
		// TODO Auto-generated method stub
		return session.update("chatns.entreducecount", memId); 
	}

	public int viewUnreadmsg(ChattingVo rcvo) {
		// TODO Auto-generated method stub
		return session.selectOne("chatns.viewUnreadmsg", rcvo);
	}

}

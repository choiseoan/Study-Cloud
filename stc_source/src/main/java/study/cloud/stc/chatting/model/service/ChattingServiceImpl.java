package study.cloud.stc.chatting.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.cloud.stc.chatting.model.dao.ChattingDao;
import study.cloud.stc.chatting.model.vo.ChattRoomVo;
import study.cloud.stc.chatting.model.vo.ChattingVo;

@Service
public class ChattingServiceImpl implements ChattingService{

	@Autowired
	ChattingDao dao;
	
	@Override
	public int addtMessage(ChattingVo vo) {
		// TODO Auto-generated method stub
		return dao.addtMessage(vo);
	}

	@Override
	public List<ChattingVo> selectListMessage(ChattingVo schvo) {
		// TODO Auto-generated method stub
		return dao.selectListMessage(schvo);
	}

	@Override
	public int reduceCount(String msg) {
		// TODO Auto-generated method stub
		return dao.reduceCount(msg);
	}

	@Override
	public int entreducecount(String enterId) {
		// TODO Auto-generated method stub
		return dao.entreducecount(enterId);
	}

	@Override
	public int viewUnreadmsg(ChattingVo rcvo) {
		// TODO Auto-generated method stub
		return  dao.viewUnreadmsg(rcvo);
	}

}

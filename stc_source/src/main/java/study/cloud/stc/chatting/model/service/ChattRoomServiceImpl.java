package study.cloud.stc.chatting.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.cloud.stc.chatting.model.dao.ChattRoomDao;
import study.cloud.stc.chatting.model.vo.ChattRoomVo;

@Service
public class ChattRoomServiceImpl implements ChattRoomService{

	@Autowired
	private ChattRoomDao dao;
	
	@Override
	public ChattRoomVo viewRoomId(ChattRoomVo crvo) {
		
		return dao.viewRoomId(crvo);
	}

	@Override
	public int addRoomId(ChattRoomVo crvo) {
		// TODO Auto-generated method stub
		return dao.addRoomId(crvo);
	}

	@Override
	public int updateChattRoom(ChattRoomVo crvo) {
		// TODO Auto-generated method stub
		return dao.updateChattRoom(crvo);
	}

	@Override
	public List<ChattRoomVo> selectListChattRoom(ChattRoomVo crvo) {
		// TODO Auto-generated method stub
		return dao.selectListChattRoom(crvo);
	}

	@Override
	public int selectCount(String chaRoomId) {
		// TODO Auto-generated method stub
		return dao.selectCount(chaRoomId);
	}

	@Override
	public List<ChattRoomVo> searchListChattRoom() {
		// TODO Auto-generated method stub
		return dao.searchListChattRoom();
	}

	@Override
	public List<ChattRoomVo> allListChattRoom() {
		// TODO Auto-generated method stub
		return dao.allListChattRoom(); 
	}

	@Override
	public List<ChattRoomVo> searchAllListChattRoom() {
		// TODO Auto-generated method stub
		return dao.searchAllListChattRoom();
	}

	@Override
	public List<ChattRoomVo> searchReqChattRoom(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return dao.searchReqChattRoom(map);
	}

	@Override
	public int searchRoomCount(String chaRoomId) {
		// TODO Auto-generated method stub
		return dao.searchRoomCount(chaRoomId);
	}

	@Override
	public List<ChattRoomVo> allEnterListChattRoom(String memId) {
		// TODO Auto-generated method stub
		return dao.allEnterListChattRoom(memId);
	}

}

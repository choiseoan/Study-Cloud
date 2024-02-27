package study.cloud.stc.chatting.model.service;

import java.util.List;

import study.cloud.stc.chatting.model.vo.ChattRoomVo;
import study.cloud.stc.chatting.model.vo.ChattingVo;

public interface ChattingService {

	public int addtMessage(ChattingVo vo);

	public List<ChattingVo> selectListMessage(ChattingVo schvo);

	public int reduceCount(String msg);

	public int entreducecount(String enterId);

	public int viewUnreadmsg(ChattingVo rcvo);

}

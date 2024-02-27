package study.cloud.stc.chatting.model.service;

import java.util.List;

import study.cloud.stc.chatting.model.vo.MemberRoomVo;

public interface MemberRoomService {

	public MemberRoomVo viewMemberId(MemberRoomVo mrvo);

	public int addMemId(MemberRoomVo mrvo);

	public List<MemberRoomVo> selectAdminEntry(String room_id);

	public List<MemberRoomVo> selectUserEntry(String room_id);

	public int onlineUser(MemberRoomVo mrvo);

	public int offlineUser(MemberRoomVo mrvo);

}

package study.cloud.stc.chat;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import study.cloud.stc.chatting.model.service.ChattRoomService;
import study.cloud.stc.chatting.model.service.ChattingService;
import study.cloud.stc.chatting.model.service.MemberRoomService;
import study.cloud.stc.chatting.model.vo.ChattRoomVo;
import study.cloud.stc.chatting.model.vo.ChattingVo;
import study.cloud.stc.chatting.model.vo.MemberRoomVo;
import study.cloud.stc.member.model.service.MemberService;
import study.cloud.stc.member.model.vo.MemberVo;

@Controller
@RequestMapping("/chatting")
public class ChattingController {
	
	@Autowired
	ChattingService service;
	
	@Autowired
	ChattRoomService crService;
	
	@Autowired
	MemberRoomService mrservice;
	
	@Autowired
	MemberService mbservice;
	
	// 채팅방 입장
		@GetMapping
		public String viewChat(
				HttpServletRequest request, 
				HttpServletResponse response, 
				Model model, 
				ModelAndView mv,
				Principal principal, 
				@RequestParam(value="room_id", defaultValue="1") String room_id
				) throws Exception
		{

			ChattingVo schvo = new ChattingVo();
			ChattRoomVo crvo = new ChattRoomVo();

			schvo.setRoomId(room_id);
			crvo.setChaRoomId(room_id);
			// 전송자 구분 용 
			String standname = principal.getName();

			//참가자 리스트 (관리자)
			request.setAttribute("adminEntry", mrservice.selectAdminEntry(room_id)); 
			
			//참가자 리스트 (유저)
			request.setAttribute("userEntry", mrservice.selectUserEntry(room_id)); 
			
			// 대화 그리고 분류용 정보
			request.setAttribute("chatt", service.selectListMessage(schvo));
			request.setAttribute("standname", standname);
			request.setAttribute("chrlist", crService.selectListChattRoom(crvo));
			
			// 입장시 보여지는 개설 된 전체 방 개수
			request.setAttribute("roomCount", crService.selectCount(room_id)); 
			
			//입장 한 안원의 상세 정보
			request.setAttribute("detailInfo", mbservice.viweDetailInfo(standname));
			
			
			return "chat";
		}
		
		@PostMapping("/searchroom")
		@ResponseBody
		public List<ChattRoomVo> userInfoAjax(
				HttpServletRequest req,
				@RequestParam(value="searchKeyword", defaultValue="valueIsNull") String chaRoomId,
				@RequestParam(value="room_id", defaultValue="valueIsNull") String roomId
			) throws Exception {
			
			
			// 이 때는 전체 방이 나오게 하기
			if(chaRoomId.equals("valueIsNull")) {
				return crService.searchAllListChattRoom();
			}
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("chaRoomId", chaRoomId);
			map.put("roomId", roomId);
			
			
			// 하단의 경우에서 부터는 조건에 맞춰서 찾기
//			return new Gson().toJson(crService.searchListChattRoom());
//			return crService.searchReqChattRoom(chaRoomId);
			return crService.searchReqChattRoom(map);
		}
		
		@PostMapping("/updatecount")
		@ResponseBody
		public String updateCount(
			@RequestParam(value="chaRoomId", defaultValue="valueIsNull") String chaRoomId
				) throws Exception {
			
			if(chaRoomId.equals("valueIsNull")) {
				String nullcount = String.valueOf( crService.selectCount(chaRoomId));
				
				return nullcount;
			}
			
			String roomCount = String.valueOf( crService.searchRoomCount(chaRoomId));
			
			return roomCount;
		}
		
		@RequestMapping("/onlinestatus")
		@ResponseBody
		public String addChatUser(
			HttpServletRequest req ,
			@RequestParam(value="enterId", defaultValue="nullId") String enterId,
			@RequestParam(value="roomId", defaultValue="nullRoom") String roomId
				) {
			
			MemberRoomVo mrvo= new MemberRoomVo();
			ChattRoomVo crvo = new ChattRoomVo();
					
			// 1. RoomId 넣기
			crvo.setChaRoomId(roomId);
			mrvo.setMemId(enterId);
			mrvo.setRoomId(roomId);
			
			
			// 1-0. chattRoom 	- select 해서  있는지 없는지 확인 없으면 insert 있으면 넘기기  
			//crvo에 들어있는건 : 방 아이디
			if(crService.viewRoomId(crvo) == null) {
				crService.addRoomId(crvo);
			}
			
			// 1-1. MemberRoom 	- division 사용해서 해당 id 와, 상단에서 기입한 정보와 같은걸 기입
			//mrvo에 들어있는건 : 입장한 사람의 아이디, 방 아이디
			if(mrservice.viewMemberId(mrvo) == null) {
				mrservice.addMemId(mrvo);
			}else {
				System.out.println("인원 있음");
			}
			
			// 인원 접속 상태 실시간 변경 + ajax 변경
			mrservice.onlineUser(mrvo);
			
			return "success";
		}
		
		@RequestMapping("/offlinestatus")
		@ResponseBody
		public String offlinestatus(
				HttpServletRequest req ,
				@RequestParam(value="exitId", defaultValue="nullId") String exitId,
				@RequestParam(value="roomId", defaultValue="nullRoom") String roomId
				) {
			
			MemberRoomVo mrvo= new MemberRoomVo();
			
			mrvo.setMemId(exitId);
			mrvo.setRoomId(roomId);
			
			// 인원 접속 상태 실시간 변경 + ajax 변경
			mrservice.offlineUser(mrvo);
			
			return "DigiXross";
		}
		
		
		@PostMapping("/reducecount")
		@ResponseBody
		public String reducecount(
				HttpServletRequest req,
				@RequestParam(value="msg", defaultValue="valueIsNull") String msg
			) throws Exception {
			
			if((int) msg.length() > 0) {
				service.reduceCount(msg);
			}else {
				return "this is empty";
			}
			
			
			return "clear";
		}
		
		@PostMapping("/entreducecount")
		@ResponseBody
		public String entreducecount(
				HttpServletRequest req,
				@RequestParam(value="enterId", defaultValue="valueIsNull") String enterId
			) throws Exception {
			
			
			service.entreducecount(enterId);
			
			
			return "clear";
		}
		
}

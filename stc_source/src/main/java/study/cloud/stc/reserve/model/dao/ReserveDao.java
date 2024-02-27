package study.cloud.stc.reserve.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import study.cloud.stc.product.model.vo.ProductTimePriceDto;
import study.cloud.stc.product.model.vo.ProductTimeReqDto;
import study.cloud.stc.reserve.model.vo.MapVo;
import study.cloud.stc.reserve.model.vo.ReserveTimeReqDto;
import study.cloud.stc.reserve.model.vo.ReserveVo;



@Repository
public class ReserveDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//예약
	@Transactional
	public int insertReserve(ReserveTimeReqDto rtDto) throws Exception{
		int resultCnt = sqlSession.insert("reserve.insertReservation", rtDto);
		int resultCnt2 = 0;
		
		if(rtDto != null && rtDto.getRsvTime()!= null ) {
			for(int i=0; i< rtDto.getRsvTime().length; i++) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("proNum", rtDto.getProNum());
				map.put("rsvDate", rtDto.getRsvDate());
				map.put("rsvTime", rtDto.getRsvTime()[i]);
				resultCnt2 += updateRsvNumToProTime(map);
			}
		}
		return resultCnt;
	}
	
	
	//예약삭제
	@Transactional
	public int deleteReserve(ReserveTimeReqDto rtDto) throws Exception{
		sqlSession.insert("reserve.updateForRsvdelete", rtDto);
		return sqlSession.insert("reserve.rsvdelete", rtDto);
	}
	
	public int selectTotalCount() throws Exception{
		return sqlSession.selectOne("reserve.selectTotalCount");	
	}
	
	public List<ReserveVo> selectReserveListForHost(ReserveTimeReqDto rtDto) throws Exception{
		return sqlSession.selectList("reserve.selectReserveListForHost", rtDto);	
	}
	
	public List<ReserveVo> selectListForHost(ReserveTimeReqDto rtDto) throws Exception{
		return sqlSession.selectList("reserve.selectListForHost", rtDto);	
	}
	
	//예약확인
	public List<ReserveVo> selectReserveList(ReserveTimeReqDto rtDto) throws Exception{
		return sqlSession.selectList("reserve.selectReserveList", rtDto);	
	}
	
	public List<ReserveVo> selectList(ReserveTimeReqDto rtDto) throws Exception{
		return sqlSession.selectList("reserve.selectList", rtDto);	
	}
	
	//상품이름조회
	public MapVo selectProName(ReserveTimeReqDto rtDto) throws Exception{
		return sqlSession.selectOne("reserve.selectProName", rtDto);	
	}
	
	//상품이름리스트
	public List<MapVo> selectProNameList() throws Exception{
		return sqlSession.selectList("reserve.selectProNameList");	
	}
	
	//상품시간가격리스트
	public List<ProductTimePriceDto> selectTimePriceRsvList(ProductTimeReqDto dto) throws Exception {
		return sqlSession.selectList("reserve.selectTimePriceRsvList", dto);
	}
	
	//예약번호추가
	private int updateRsvNumToProTime(Map<String, String> map) throws Exception{
		return sqlSession.update("reserve.updateRsvNumToProTime", map);	
	}
	
	public ReserveTimeReqDto selectRsvNum(ReserveTimeReqDto rtDto) throws Exception {
		List<ReserveTimeReqDto> list = sqlSession.selectList("reserve.selectRsvNum", rtDto);
		String rsvTime = "";
		int rsvAmount = 0;
		int rsvHour = 0;
		boolean[] timeArray = new boolean[24];
		
		ReserveTimeReqDto dto = new ReserveTimeReqDto();
		
		dto.setRsvNum(list.get(0).getRsvNum());
		dto.setMemId(list.get(0).getMemId());
		dto.setProNum(list.get(0).getProNum());
		dto.setRsvDate(list.get(0).getRsvDate().split(" ")[0]);
		dto.setRsvStatus(list.get(0).getRsvStatus());
		dto.setRsvPerson(list.get(0).getRsvPerson());
		
		for(int i = 0; i < list.size(); i++) {
			rsvAmount += list.get(i).getRsvAmount();
		}
		
		dto.setRsvAmount(rsvAmount);
				
		for(int i = 0; i < list.size(); i++) {
			timeArray[Integer.parseInt(list.get(i).getRsvDate().split(" ")[1].substring(0,2))] = true;
		}
		
		for(int i = 0; i < timeArray.length; i++) {
			if(timeArray[i]) {
				//총 예약시간
				rsvHour += 1;
				
				//전체 예약시간
				if(i == 0) {
					//0시만 예약했을 경우
					if(!timeArray[i+1]) {
						rsvTime += "00:00~01:00 ";
					}else {
						rsvTime += "00:00~";
					}
				}else {
					if(timeArray[i-1]) {
						if(!timeArray[i+1]) {
							if(i < 10) {
								rsvTime += "0" + (i+1) + ":00 ";
							}else {
								rsvTime += (i+1)+":00 ";
							}
						}else {
							// continue되면
						}
					}else {
						if(timeArray[i+1]) {
							if(i < 10) {
								rsvTime += "0" + i + ":00~";
							}else {
								rsvTime += i+":00~";
							}
						}else {
							if(i < 10) {
								rsvTime += "0" + i + ":00~";
								
								if(i + 1 < 10) {
									rsvTime += "0" + (i+1) + ":00 ";
								}else {
									rsvTime += (i+1) + ":00 ";
								}
							}else {
								rsvTime += i+":00~"+(i+1) + ":00 ";
							}
						}
					}
				}
			}
		}
		rsvTime += "(" + rsvHour + "시간)";
		String[] rsvTimes = rsvTime.split(" ");
		
		dto.setRsvTime(rsvTimes);
		
		return dto;
	}


}

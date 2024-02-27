package study.cloud.stc.reserve.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.cloud.stc.product.model.vo.ProductTimePriceDto;
import study.cloud.stc.product.model.vo.ProductTimeReqDto;
import study.cloud.stc.reserve.model.vo.MapVo;
import study.cloud.stc.reserve.model.vo.ReserveTimeReqDto;
import study.cloud.stc.reserve.model.vo.ReserveVo;


public interface ReserveService {
	
	
	//예약
	public int insertReserve(ReserveTimeReqDto rtDto) throws Exception;
	
	//예약 삭제
	public int deleteReserve(ReserveTimeReqDto rtDto) throws Exception;
	
	public int selectTotalCount() throws Exception;
		
	//예약확인
	public List<ReserveVo> selectReserveList(ReserveTimeReqDto rtDto) throws Exception;
	
	public List<ReserveVo> selectList(ReserveTimeReqDto rtDto) throws Exception;
	
	public List<ReserveVo> selectReserveListForHost(ReserveTimeReqDto rtDto) throws Exception;
	
	public List<ReserveVo> selectListForHost(ReserveTimeReqDto rtDto) throws Exception;
	
	//상품이름
	public MapVo selectProName(ReserveTimeReqDto vo) throws Exception;
	
	//상품이름리스트
	public List<MapVo> selectProNameList() throws Exception;
	
	//선택된 날짜의 time과 price, 그리고 예약상태 알아오기
	public List<ProductTimePriceDto> selectTimePriceRsvList(ProductTimeReqDto dto) throws Exception;
	
	public ReserveTimeReqDto selectRsvNum(ReserveTimeReqDto rtDto) throws Exception;


}


package study.cloud.stc.reserve.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import study.cloud.stc.product.model.vo.ProductTimePriceDto;
import study.cloud.stc.product.model.vo.ProductTimeReqDto;
import study.cloud.stc.reserve.model.service.ReserveService;
import study.cloud.stc.reserve.model.vo.MapVo;
import study.cloud.stc.reserve.model.vo.ReserveTimeReqDto;
import study.cloud.stc.reserve.model.vo.ReserveVo;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	
	@Autowired
	private ReserveService reserveservice;
	@Autowired
	private ReserveTimeReqDto rtDto;

	
	@GetMapping
	public ModelAndView reserve(ModelAndView mv) {
		mv.setViewName("/reserve/reserve");
		return mv;
	}
	
	//예약하기
	@PostMapping("/reserve")
	@ResponseBody
	public String selectedValues(@RequestBody ReserveTimeReqDto rtDto, Principal pricipal) throws Exception {
		String insertedRegDate = "";
		
		rtDto.setMemId(pricipal.getName());
		this.rtDto = rtDto;
		System.out.println("rtDto: " + this.rtDto);
		int result = reserveservice.insertReserve(rtDto);
		if(result > 0) {
			insertedRegDate = rtDto.getRegDate();
		} else {
			
		}
		return insertedRegDate;
		
	}
	
	@RequestMapping("/reserveinfo")
	public ModelAndView reserveinfo(
			ReserveTimeReqDto rtDto,
			Principal principal,
			ModelAndView mv) throws Exception {
		if(!principal.getName().contains("host")) {
			rtDto.setMemId(principal.getName());
		}
		
		System.out.println(rtDto.getMemId());
		
		ReserveTimeReqDto dto = reserveservice.selectRsvNum(rtDto);		
		MapVo mapVo = reserveservice.selectProName(rtDto);
		
		mv.addObject("dto", dto);
		mv.addObject("mapVo", mapVo);

		
		mv.setViewName("/reserve/reserveinfo");
		return mv;
	}
	

	@ExceptionHandler(NullPointerException.class)
	public ModelAndView memberNullPointExceptionHandler( NullPointerException e
			// 오류 발생함. ModelAndView mv
			) {
		e.printStackTrace();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage()+" 오류가 발생했습니다. 다시 시도해 주세요.");
		mv.setViewName("errors/error");
		return mv;
	}
	@ExceptionHandler(NumberFormatException.class)
	public ModelAndView memberNumberFormatExceptionHandler( NumberFormatException e
			// 오류 발생함. ModelAndView mv
			) {
		e.printStackTrace();
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage()+" 오류가 발생했습니다. 다시 시도해 주세요.");
		mv.setViewName("errors/error");
		return mv;
	}
	@ExceptionHandler(SQLException.class)
	public ModelAndView memberSQLExceptionHandler( SQLException e
			// 오류 발생함. ModelAndView mv
			) {
		e.printStackTrace();
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage()+" 오류가 발생했습니다. 다시 시도해 주세요.");
		mv.setViewName("errors/error");
		return mv;
	}
	@ExceptionHandler(Exception.class)
	public ModelAndView memberExceptionHandler( Exception e
			// 오류 발생함. ModelAndView mv
			) {
		e.printStackTrace();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage()+" 오류가 발생했습니다. 다시 시도해 주세요.");
		mv.setViewName("errors/error");
		return mv;
	}
}

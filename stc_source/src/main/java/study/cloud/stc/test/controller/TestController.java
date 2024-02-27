package study.cloud.stc.test.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.cloud.stc.common.paging.Paging;
import study.cloud.stc.test.model.service.TestService;

@Controller
@RequestMapping("/test")
public class TestController {

	@Autowired
	private TestService service;
	private final static int BOARD_LIMIT = 5;
	private final static int PAGE_LIMIT = 5;
		

	@GetMapping("/list")
	public ModelAndView TestSelect( 
			ModelAndView mv
			, HttpServletRequest req
			, @RequestParam(value="page", defaultValue="1") int page
		) throws Exception {
		
		
		// Rowbounds 유기적 페이징 가능
		int currentPage = page;
		int totalCnt = service.selectCount();
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, BOARD_LIMIT, PAGE_LIMIT);
		mv.addObject("pageInfo", map);
		
		
		//mv.addObject("testlist", service.selectList());
		mv.addObject("testlist", service.selectList(currentPage,BOARD_LIMIT));
		
		mv.setViewName("/test/list");
		
		System.out.println("totalCnt: "+ totalCnt);
		
		
		return mv;
	}
	
	@GetMapping("/selectOne")
	public ModelAndView TestSelectOne( 
			ModelAndView mv
		) throws Exception {
		int boardNum = 12;
		mv.addObject("selectOne", service.selectOne(boardNum));
		mv.setViewName("/test/listone");
		
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
//	@ExceptionHandler
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

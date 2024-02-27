package study.cloud.stc.notice.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import study.cloud.stc.common.file.FileUtil;
import study.cloud.stc.common.paging.Paging;
import study.cloud.stc.notice.model.service.NoticeService;
import study.cloud.stc.notice.model.vo.NoticeVo;

 

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	private final static int BOARD_LIMIT = 10;
	private final static int PAGE_LIMIT = 5;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	@GetMapping
	public ModelAndView noticeList(ModelAndView mv
		  , NoticeVo vo
		  , @RequestParam(value="page", defaultValue="1") int page
		  , @RequestParam(value="notiIdx", defaultValue="") String notiIdx
			) throws Exception {

		int currentPage = page; 
		int totalCnt= service.selectCount(notiIdx); 
		Map<String, Integer> map= new Paging().paging(currentPage, totalCnt, BOARD_LIMIT, PAGE_LIMIT); 
		mv.addObject("pageInfo", map);
		mv.addObject("selectNotiIdx", service.selectNotiIdx());
		mv.addObject("noticeList", service.selectList(currentPage, BOARD_LIMIT, notiIdx));
		mv.setViewName("notice");

		return mv;
	}
	
	@PostMapping("/insert")
	public ModelAndView insertNotice(ModelAndView mv
			, NoticeVo vo
			, @RequestParam(name = "report", required = false) MultipartFile multi
			, HttpServletRequest request
			) throws Exception {
		Map<String, String> filePath;
		try {
			filePath = fileUtil.saveFile(multi, request, null);
			vo.setOriginalFilename(filePath.get("original"));
			vo.setRenameFilename(filePath.get("rename"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		service.insert(vo);
		mv.setViewName("redirect:/notice");
		return mv;
	}

	@PostMapping("/update")
	public ModelAndView updateNotice(ModelAndView mv
			, NoticeVo vo
			, @RequestParam(name = "report", required = false) MultipartFile multi
			, HttpServletRequest request
			) throws Exception {
		Map<String, String> filePath;
		try {
			filePath = fileUtil.saveFile(multi, request, null);
			vo.setOriginalFilename(filePath.get("original"));
			vo.setRenameFilename(filePath.get("rename"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		service.update(vo);
		mv.setViewName("redirect:/notice");
		return mv;
	}
 
	@PostMapping("/delete")
	public ModelAndView deleteNotice(ModelAndView mv
			, int notiNum) throws Exception{
		service.delete(notiNum);
		mv.setViewName("redirect:/notice");
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

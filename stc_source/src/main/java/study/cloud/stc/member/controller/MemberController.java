package study.cloud.stc.member.controller;

import java.security.Principal;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import study.cloud.stc.member.model.service.MemberService;
import study.cloud.stc.member.model.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private MemberVo stdVo;
	
	@GetMapping("/updatepw")
	public ModelAndView viewUpdatePasswd(ModelAndView mv) throws Exception {
		
		mv.setViewName("/member/updatePasswd");
		return mv;
	}
	

	@RequestMapping(value = "/updateajax", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String updatePasswd(
			MemberVo vo
			) throws Exception {
		
		System.out.println("VomemId: "+vo.getMemId());
		System.out.println("VomemEmail: "+vo.getMemEmail());
		
		MemberVo result = service.updatePasswd(vo);
		
		System.out.println(result);
		String shout= null;		
		
		if(result == null) {
			shout= "fail";
		}
		else {
			shout= "success";
		}
		
		return shout;
	}
	
	@GetMapping("/viewaccount")
	public ModelAndView viewfindAccount(ModelAndView mv) throws Exception {
		
		mv.setViewName("/member/findAccount");
		return mv;
	}
	
	
	@RequestMapping(value = "/findajax", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String findAjax(
			MemberVo vo
			) throws Exception {
		
		System.out.println("memName: "+vo.getMemName());
		System.out.println("memPhone: "+vo.getMemPhone());
		System.out.println("memEmail: "+ vo.getMemEmail());
		
		MemberVo result = service.findAccount(vo);
		
		System.out.println(result);
		String shout= null;		
		
		if(result == null) {
			shout= "fail";
		}
		else {
			shout= "success";
		}
		
		return shout;
	}
	
	@GetMapping("/delete")
	public ModelAndView memberQuit(ModelAndView mv, MemberVo vo, Principal principal) throws Exception  {
		
		mv.setViewName("/member/delete");
		return mv;
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public String memberQuitAjax(MemberVo vo, Principal principal) throws Exception  {
		
		System.out.println("vo.getMemPasswd(): "+vo.getMemPasswd());
		// vo 는 입력한 비밀번호
		
		stdVo.setMemId(principal.getName());
		
		stdVo = service.quitStdInfo(stdVo);
		System.out.println(stdVo);
		
		String shout= null;
		
		String division= vo.getMemPasswd();
		String standatd= stdVo.getMemPasswd();
		
		System.out.println("vo.getMemPasswd(): "+vo.getMemPasswd());
		System.out.println("stdVo.getMemPasswd(): "+stdVo.getMemPasswd());
		
		if(division.equals(standatd)) {
			shout= "success";
			service.memberblock(stdVo);
		}else {
			shout= "fail";
		}
		
		return shout;
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
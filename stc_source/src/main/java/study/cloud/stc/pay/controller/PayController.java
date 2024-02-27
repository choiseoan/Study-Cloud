package study.cloud.stc.pay.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import study.cloud.stc.reserve.model.vo.ReserveTimeReqDto;

@Controller
public class PayController {

	
	@GetMapping("/pay")
	public ModelAndView paypage(
				ModelAndView mv,
				ReserveTimeReqDto rtDto,
				Principal principal
			) {
		mv.setViewName("/pay");
		return mv;
	}
	
	@PostMapping("/payinfo")
	public ModelAndView payInfo(ModelAndView mv) {
		mv.setViewName("/payinfo");
		return mv;
	}
	
	
}

package study.cloud.stc;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Principal principal) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		// 			principal.getName() 이거 사용해서 아이디 조회 가능
		if(principal != null) {
			System.out.println("principal: "+principal.getName());
			System.out.println("principal: "+principal.getClass());
		}
		
		return "home";
	}
	
	@GetMapping("/contact")
	public ModelAndView viewContact(ModelAndView mv) {
		mv.setViewName("contact");
		return mv;
	}
	@GetMapping("/serviceterms")
	public ModelAndView viewServiceTerms(ModelAndView mv) {
		mv.setViewName("serviceterms");
		return mv;
	}
	@GetMapping("/privacy")
	public ModelAndView viewPrivacy(ModelAndView mv) {
		mv.setViewName("privacy");
		return mv;
	}
}

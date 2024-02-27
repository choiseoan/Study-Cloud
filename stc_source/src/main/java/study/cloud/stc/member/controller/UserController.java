package study.cloud.stc.member.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import study.cloud.stc.common.paging.Paging;
import study.cloud.stc.member.model.service.MemberService;
import study.cloud.stc.member.model.vo.MemberVo;
import study.cloud.stc.product.model.vo.ProductVo;
import study.cloud.stc.qna.model.service.QnaService;
import study.cloud.stc.qna.model.vo.QnaVo;
import study.cloud.stc.reserve.model.service.ReserveService;
import study.cloud.stc.reserve.model.vo.MapVo;
import study.cloud.stc.reserve.model.vo.ReserveTimeReqDto;
import study.cloud.stc.reserve.model.vo.ReserveVo;
import study.cloud.stc.review.model.service.ReviewService;
import study.cloud.stc.review.model.vo.ReviewResReqVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private MemberService mservice;
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private QnaService qna_service;
	@Autowired
	private ReviewService rv_service;
	
	//유저 마이페이지
	@GetMapping
	public ModelAndView main(ModelAndView mv,  Principal principal) throws Exception {
		
		mv.addObject("principal", principal.getName());
		mv.setViewName("user/user");
		return mv;
	}	
	
	//내 정보
	@GetMapping("/info")
	public ModelAndView viewUserInfo(ModelAndView mv, Principal principal, MemberVo vo) throws Exception {
		
		
		vo.setMemId(principal.getName());
		
		mv.addObject("mv", mservice.takeInfo(vo));
		
		/*
		 * vo.setMemId(principal.getName());
		 * 
		 * renewal= 
		 */
		
		//System.out.println("renewal:" + renewal);
		
		mv.setViewName("/user/info");
		
		return mv;
	}
	
	@PostMapping("/userinfoajax")
	@ResponseBody
	public String userInfoAjax(
			MemberVo vo
			) throws Exception {
		
		System.out.println("이건 변환 전: "+vo);
		
		String strphone = vo.getMemPhone();
		String newstrPhone = strphone.replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]", "");
		
		System.out.println("newstrPhone: "+ newstrPhone);
		vo.setMemPhone(newstrPhone);
		
		int result = 0;
		
		result = mservice.updateHostInfo(vo);

		String shout= null;
		
		if(result > 0) {
			shout = "success";
		}else {
			shout = "fail";
		}
		
		return shout;
	}
	
	
	
	//내 예약
	//내 예약 리스트 페이지
	@GetMapping("/reserve")
	public ModelAndView selectreserveList(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam(value="page", defaultValue="1") int page,
			ModelAndView mv, 
			Principal principal) throws Exception {
		
		mv.setViewName("/user/reserve/reserve");
		
		ReserveTimeReqDto rtDto = new ReserveTimeReqDto();
		rtDto.setMemId(principal.getName());
				
		List<ReserveVo> reserveVo = reserveService.selectReserveList(rtDto);
		List<ReserveVo> listVo = reserveService.selectList(rtDto); 
		List<MapVo> mapVo = reserveService.selectProNameList();
		
		int currentPage = page; 
		int totalCnt= reserveService.selectTotalCount(); 
		Map<String, Integer> map= new Paging().paging(currentPage, totalCnt, 12, 3); 
		mv.addObject("pageInfo", map);
		
		request.setAttribute("reserveVo", reserveVo);
		request.setAttribute("listVo", listVo);
		request.setAttribute("mapVo", mapVo);
				
		return mv;
	}
	
	//예약취소하기 삭제
	@PostMapping("/reserve/delete")
	@ResponseBody
	public String delete(ReserveTimeReqDto rtDto, Principal pricipal) throws Exception {
		rtDto.setMemId(pricipal.getName());
		int result = reserveService.deleteReserve(rtDto);
		
		 return String.valueOf(result);
	}

	
	
	//내 리뷰
	@GetMapping("/review")
	public ModelAndView selectReviewList(ModelAndView mv
			, @RequestParam(value="page", defaultValue="1") int page
			, Principal principal
			) throws Exception {
		
		Map<String, Object> userReview = new HashMap<>();
		
		List<ReviewResReqVo> userRsvNum = rv_service.userRsvProName(principal.getName());
		String proNum = userRsvNum.get(0).getProNum();
		userReview.put("userRsvNum", userRsvNum);
		ReviewResReqVo vo = new ReviewResReqVo();
		vo.setProNum(proNum);
		vo.setMemId(principal.getName());
		List<ReviewResReqVo> reviewList = rv_service.selectUserReviewList(vo);
		userReview.put("reviewList", reviewList);
		mv.addObject("userReview", userReview);
		mv.setViewName("/user/review");
		return mv;
	}
	
	//내 Q&A
	@GetMapping("/qna")
	public ModelAndView selectQnaList(ModelAndView mv
			, @RequestParam(value="page", defaultValue="1") int page
			, Principal principal
			) throws Exception {

		List<QnaVo> productList = qna_service.selectUserQnaList(principal.getName());
		int proNum = 0;
		
	    if (productList.size() > 0) {
	        proNum = productList.get(0).getProNum();
	    }
	    
		Map<String, Object> userQna = new HashMap<>();
		userQna.put("productList", productList);
		userQna.put("selectedProNum", proNum);

		mv.addObject("userQna", userQna);
		mv.setViewName("/user/qna");
		return mv;
	}
	@PostMapping("/qna")
	@ResponseBody
	public String selectQnaListAjax(
			  @RequestParam(name="selectedProNum") int proNum
			, @RequestParam(value="page", defaultValue="1") int page
			, Principal principal
			, QnaVo vo
			) throws Exception {
		vo.setProNum(proNum);
		vo.setMemId(principal.getName());
		
		int cntPerPage = 3; 
		int currentPage = page;
		int totalCnt = qna_service.selectUserQnaCount(vo);
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, cntPerPage, 5);

		List<QnaVo> productList = qna_service.selectUserQnaList(principal.getName());
				
		if (proNum == 0) {
		    if (productList.size() > 0) {
		    	proNum = productList.get(0).getProNum();
		    }
		}
		List<QnaVo> qnaList = new ArrayList<>();
		if (proNum > 0) {
			qnaList = qna_service.selectUserQna(currentPage, cntPerPage, vo);
		}

		Map<String, Object> userQna = new HashMap<>();
		userQna.put("pageInfo", map);
		userQna.put("selectedProNum", proNum);
		userQna.put("productList", productList);
		userQna.put("qnaList", qnaList);
		
		return new Gson().toJson(userQna);

	}
	@PostMapping("/qna/update")
	@ResponseBody
	public String updateQnaAjax(QnaVo vo
			, @RequestParam(name="selectedProNum") int proNum
			, @RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="qnaNum") int qnaNum
			, Principal principal
			) throws Exception {
		vo.setProNum(proNum);
		vo.setMemId(principal.getName());
		
		int cntPerPage = 3; 
		int currentPage = page;
		int totalCnt = qna_service.selectUserQnaCount(vo);
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, cntPerPage, 5);

		List<QnaVo> productList = qna_service.selectUserQnaList(principal.getName());

		if (proNum == 0) {
			if (productList.size() > 0) {
				proNum = productList.get(0).getProNum();
		    }
		}
		List<QnaVo> qnaList = new ArrayList<>();
		if (proNum > 0) {
			qna_service.update(vo);
			qnaList = qna_service.selectUserQna(currentPage, cntPerPage, vo);
		}

		Map<String, Object> userQna = new HashMap<>();
		userQna.put("pageInfo", map);
		userQna.put("selectedProNum", proNum);
		userQna.put("productList", productList);
		userQna.put("qnaList", qnaList);

		return new Gson().toJson(userQna);
	}

	@PostMapping("/qna/delete")
	@ResponseBody
	public String deleteQnaAjax(
			  @RequestParam(name="selectedProNum") int proNum
			, @RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="qnaNum") int qnaNum
			, Principal principal
			, QnaVo vo
			) throws Exception {
		vo.setProNum(proNum);
		vo.setMemId(principal.getName());
		
		int cntPerPage = 3; 
		int currentPage = page;
		int totalCnt = qna_service.selectUserQnaCount(vo);
		if(totalCnt == 1) {
			totalCnt = 0;
		}
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, cntPerPage, 5);

		List<QnaVo> productList = qna_service.selectUserQnaList(principal.getName());

		if (proNum == 0) {
			if (productList.size() > 0) {
				proNum = productList.get(0).getProNum();
		    }
		}
		List<QnaVo> qnaList = new ArrayList<>();
		if (proNum > 0) {
			qna_service.delete(qnaNum);
			qnaList = qna_service.selectUserQna(currentPage, cntPerPage, vo);
		}

		Map<String, Object> userQna = new HashMap<>();
		userQna.put("pageInfo", map);
		userQna.put("selectedProNum", proNum);
		userQna.put("productList", productList);
		userQna.put("qnaList", qnaList);

		return new Gson().toJson(userQna);
	}
	

	
	
	
}

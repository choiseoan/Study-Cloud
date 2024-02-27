package study.cloud.stc.member.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import study.cloud.stc.common.file.FileUtil;
import study.cloud.stc.common.paging.Paging;
import study.cloud.stc.member.model.service.MemberService;
import study.cloud.stc.member.model.vo.MemberVo;
import study.cloud.stc.product.model.service.ProductService;
import study.cloud.stc.product.model.vo.HostProductDto;
import study.cloud.stc.product.model.vo.ProductDetailDto;
import study.cloud.stc.product.model.vo.ProductPicDto;
import study.cloud.stc.product.model.vo.ProductTimeReqDto;
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
@RequestMapping("/host")
public class HostController {

	@Autowired
	private QnaService qna_service;
	@Autowired
	private ProductService pservice;
	@Autowired
	private MemberService mservice;
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private ReviewService rv_service;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	
	//호스트 마이페이지
	@GetMapping
	public ModelAndView main(ModelAndView mv) throws Exception {
		mv.setViewName("/host/host");
		return mv;
	}	
	
	
	//내정보
	@GetMapping("/info")
	public ModelAndView viewHostInfo(ModelAndView mv, Principal principal, MemberVo vo) throws Exception {
		
		
		System.out.println("memId: "+principal.getName());
		vo.setMemId(principal.getName());
		
		System.out.println("vo:"+ vo);
		
		System.out.println("result: "+mservice.takeInfo(vo));
		
		
		mv.addObject("mv", mservice.takeInfo(vo));
		
		/*
		 * vo.setMemId(principal.getName());
		 * 
		 * renewal= 
		 */
		
		//System.out.println("renewal:" + renewal);
		
		mv.setViewName("/host/info");
		
		return mv;
	}
	
	@PostMapping("/info")
	@ResponseBody
	public String hostInfoAjax(
			MemberVo vo
			) throws Exception {
		
		System.out.println("이건 변환 전: "+vo);
		
		String strphone = vo.getMemPhone();
		String newstrPhone = strphone.replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]", "");
		
		System.out.println("newstrPhone: "+ newstrPhone);
		vo.setMemPhone(newstrPhone);
		
		System.out.println("이건 변환 후: "+vo);
		
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
	
	
	
	
	
	
	
	//공간관리
	//공간관리리스트
	@GetMapping("/product")
	public ModelAndView selectProductList(
			ModelAndView mv
			,HostProductDto dto
			, @RequestParam(value="page", defaultValue="1") int page
			,Principal principal
			) throws Exception {
		String memId = principal.getName();
		 dto.setMemId(memId);
		 int currentPage = page;
		 int totalCnt = pservice.selectCount(dto);
		 Map<String, Integer> map= new Paging().paging(currentPage, totalCnt,10 , 10);
		 mv.addObject("pageInfo", map);
		 mv.addObject("hostlist",pservice.selectList(currentPage,10, dto));
		 mv.setViewName("/host/product");
		return mv;
	}	
	
	@GetMapping("/product/insert")
	public ModelAndView insertProductPage(ModelAndView mv) throws Exception {
		mv.setViewName("/host/product/insert");
		return mv;
	}
	
	//상품등록
	@PostMapping("/product/insert")
	public ModelAndView insertProduct(
	        ModelAndView mv
	        , @RequestParam(name = "uploadfile", required = false) MultipartFile[] multifiles
	        , HttpServletRequest request
	        , ProductDetailDto dto
	        , Principal principal
	) throws Exception {
	    dto.setMemId(principal.getName());

	    if (multifiles != null) {
	    	List<ProductPicDto> picList = new ArrayList<ProductPicDto>();
	        for (int i = 0; i < multifiles.length; i++) {
	            MultipartFile multi = multifiles[i];
	            Map<String, String> filePath = fileUtil.saveFile(multi, request, null);

	            ProductPicDto pic = new ProductPicDto(); 
	            pic.setProPicOriginal(filePath.get("original"));
	            pic.setProPicRename(filePath.get("rename"));
	            picList.add(pic);
	        }
	        dto.setPicList(picList);
	    }

	    int result = pservice.insertDetail(dto);
	    mv.setViewName("redirect:/host/product");

	    return mv;
	}
	
	@GetMapping("/product/update")
	public ModelAndView updateProductPage(
			ModelAndView mv
			,@RequestParam("proNum") int proNum
			,ProductDetailDto dto
			,Principal principal
			) throws Exception {
		ProductDetailDto pd = pservice.selectOne(proNum);
		mv.addObject("productDetail", pd);
		mv.setViewName("/host/product/update");
		return mv;
	}
	
	@PostMapping("/product/update")
	public ModelAndView updateProduct(
			ModelAndView mv
			  , @RequestParam(name = "uploadfile", required = false) MultipartFile multi
				,ProductDetailDto pd
				,Principal principal
				, HttpServletRequest request
				) throws Exception {
			Map<String, String> filePath;
			try {
						filePath = fileUtil.saveFile(multi, request, null);
							pd.setProPicOriginal(filePath.get("original"));
							pd.setProPicRename(filePath.get("rename"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			int result = pservice.updateProduct(pd);  // TODO ProductDetailDto으로 수정
			if(result == 4) {
				mv.setViewName("redirect:/host/product");
			}else if(result == 3) {
				mv.setViewName("redirect:/host/product");
			}else if(result == 2) {
				mv.setViewName("redirect:/host/product");
			}else {
//				mv.addObject("message","업데이트 실패");
				mv.setViewName("redirect:/host/product");
			}
			return mv;
		}
	
	
	//예약관리
	//공간관리 - RESERVETIME EDIT 공간 시간,가격설정
	@GetMapping("/reserve/rsvprotime")
	public ModelAndView selectRsvProtime(ModelAndView mv, String proNum ) throws Exception {
		mv.addObject("proNum", proNum);
		mv.setViewName("/host/reserve/rsvprotime");
		return mv;
	}
	
	//공간관리 - RESERVETIME EDIT 공간 시간,가격설정
	@PostMapping("/reserve/rsvprotime")
	@ResponseBody 
	public String seletedValues(
			@RequestBody ProductTimeReqDto reqDto
			) throws Exception {			
			int result = pservice.insertProTime(reqDto);
			
			return String.valueOf(result);
	}
		
	//예약관리 리스트 페이지
	@GetMapping("/reserve")
	public ModelAndView selectreserveList(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam(value="page", defaultValue="1") int page,
			ModelAndView mv, 
			Principal principal) throws Exception {
		
		mv.setViewName("/host/reserve/reserve");
		
		ReserveTimeReqDto rtDto = new ReserveTimeReqDto();
		rtDto.setMemId(principal.getName());
				
		List<ReserveVo> reserveVo = reserveService.selectReserveListForHost(rtDto);
		List<ReserveVo> listVo = reserveService.selectListForHost(rtDto);
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
		
	//예약확인상세페이지
	@GetMapping("/reserve/reserveinfo")
	public ModelAndView selectreserveList(ModelAndView mv) throws Exception {
		mv.setViewName("/host/reserve/reserveinfo");
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
	
	
	//리뷰관리
	//리뷰리스트
	@GetMapping("/review")
	public ModelAndView selectReviewList(ModelAndView mv
			, @RequestParam(value="page", defaultValue="1") int page
			, Principal principal
			) throws Exception {

		List<ProductVo> productList = pservice.selectHostProductList(principal.getName());
		int proNum = 0;
		
	    if (productList.size() > 0) {
	        proNum = productList.get(productList.size() - 1).getProNum();
	    }
	    
		Map<String, Object> userQna = new HashMap<>();
		userQna.put("productList", productList);
		userQna.put("selectedProNum", proNum);
		List<ReviewResReqVo> rsvo = rv_service.userRsvNumSelect(proNum);
		userQna.put("userRsvNum", rsvo);
		List<ReviewResReqVo> reviewList = rv_service.selectReviewList(proNum);
		userQna.put("reviewList", reviewList);
		mv.addObject("userQna", userQna);
		mv.setViewName("/host/review");
		return mv;
	}	
	
	
	//Q&A관리
	//Q&A리스트
	@GetMapping("/qna")
	public ModelAndView selectQnaList(ModelAndView mv
			, @RequestParam(value="page", defaultValue="1") int page
			, Principal principal
			) throws Exception {
		List<ProductVo> productList = pservice.selectHostProductList(principal.getName());
		int proNum = 0;
		
	    if (productList.size() > 0) {
	        proNum = productList.get(0).getProNum();
	    }
	    
		Map<String, Object> hostQna = new HashMap<>();
		hostQna.put("productList", productList);
		hostQna.put("selectedProNum", proNum);

		mv.addObject("hostQna", hostQna);
		mv.setViewName("/host/qna");
		return mv;
	}
	@PostMapping("/qna")
	@ResponseBody
	public String selectQnaListAjax(
			  @RequestParam(name="selectedProNum") int proNum
			, @RequestParam(value="page", defaultValue="1") int page
			, Principal principal
			) throws Exception {

		int cntPerPage = 3; 
		int currentPage = page;
		int totalCnt = qna_service.selectHostQnaCount(proNum);
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, cntPerPage, 5);

		List<ProductVo> productList = pservice.selectHostProductList(principal.getName());

		if (proNum == 0) {
		    if (productList.size() > 0) {
		        proNum = productList.get(0).getProNum();
		    }
		}
		List<QnaVo> qnaList = new ArrayList<>();
		if (proNum > 0) {
		    qnaList = qna_service.selectHostProductQnaList(currentPage, cntPerPage, proNum);
		}

		Map<String, Object> hostQna = new HashMap<>();
		hostQna.put("pageInfo", map);
		hostQna.put("productList", productList);
		hostQna.put("selectedProNum", proNum);
		hostQna.put("qnaList", qnaList);

		return new Gson().toJson(hostQna);

	}
	@PostMapping("/qna/delete")
	@ResponseBody
	public String deleteQnaAjax(
			  @RequestParam(name="selectedProNum") int proNum
			, @RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="qnaNum") int qnaNum
			, Principal principal
			) throws Exception {

		int cntPerPage = 3; 
		int currentPage = page;
		int totalCnt = qna_service.selectHostQnaCount(proNum);
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, cntPerPage, 5);

		List<ProductVo> productList = pservice.selectHostProductList(principal.getName());

		if (proNum == 0) {
		    if (productList.size() > 0) {
		        proNum = productList.get(0).getProNum();
		    }
		}
		List<QnaVo> qnaList = new ArrayList<>();
		if (proNum > 0) {
			qna_service.delete(qnaNum);
		    qnaList = qna_service.selectHostProductQnaList(currentPage, cntPerPage, proNum);
		}

		Map<String, Object> hostQna = new HashMap<>();
		hostQna.put("pageInfo", map);
		hostQna.put("productList", productList);
		hostQna.put("selectedProNum", proNum);
		hostQna.put("qnaList", qnaList);

		return new Gson().toJson(hostQna);
	}
	
	@PostMapping("/qna/reply/update")
	@ResponseBody
	public String replyUpdateQnaAjax(QnaVo vo
			, @RequestParam(name="selectedProNum") int proNum
			, @RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="qnaNum") int qnaNum
			, Principal principal
			) throws Exception {

		int cntPerPage = 3; 
		int currentPage = page;
		int totalCnt = qna_service.selectHostQnaCount(proNum);
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, cntPerPage, 5);

		List<ProductVo> productList = pservice.selectHostProductList(principal.getName());

		if (proNum == 0) {
		    if (productList.size() > 0) {
		        proNum = productList.get(0).getProNum();
		    }
		}
		List<QnaVo> qnaList = new ArrayList<>();
		if (proNum > 0) {
			qna_service.updateReply(vo);
		    qnaList = qna_service.selectHostProductQnaList(currentPage, cntPerPage, proNum);
		}

		Map<String, Object> hostQna = new HashMap<>();
		hostQna.put("pageInfo", map);
		hostQna.put("productList", productList);
		hostQna.put("selectedProNum", proNum);
		hostQna.put("qnaList", qnaList);

		return new Gson().toJson(hostQna);
	}
	
	@PostMapping("/qna/reply/delete")
	@ResponseBody
	public String replyDeleteQnaAjax(
			  @RequestParam(name="selectedProNum") int proNum
			, @RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="qnaNum") int qnaNum
			, Principal principal
			) throws Exception {

		int cntPerPage = 3; 
		int currentPage = page;
		int totalCnt = qna_service.selectHostQnaCount(proNum);
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, cntPerPage, 5);

		List<ProductVo> productList = pservice.selectHostProductList(principal.getName());

		if (proNum == 0) {
		    if (productList.size() > 0) {
		        proNum = productList.get(0).getProNum();
		    }
		}
		List<QnaVo> qnaList = new ArrayList<>();
		if (proNum > 0) {
			qna_service.deleteReply(qnaNum);
		    qnaList = qna_service.selectHostProductQnaList(currentPage, cntPerPage, proNum);
		}

		Map<String, Object> hostQna = new HashMap<>();
		hostQna.put("pageInfo", map);
		hostQna.put("productList", productList);
		hostQna.put("selectedProNum", proNum);
		hostQna.put("qnaList", qnaList);

		return new Gson().toJson(hostQna);
	}	
	
	
	
	
	
	
	
	
	
}

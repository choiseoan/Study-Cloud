package study.cloud.stc.product.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import study.cloud.stc.common.paging.Paging;
import study.cloud.stc.product.model.service.ProductService;
import study.cloud.stc.product.model.vo.ProductDetailDto;
import study.cloud.stc.product.model.vo.ProductTimePriceDto;
import study.cloud.stc.product.model.vo.ProductTimeReqDto;
import study.cloud.stc.product.model.vo.ProductVo;
import study.cloud.stc.qna.model.service.QnaService;
import study.cloud.stc.qna.model.vo.QnaVo;
import study.cloud.stc.reserve.model.service.ReserveService;
import study.cloud.stc.reserve.model.vo.ReserveVo;
import study.cloud.stc.review.model.service.ReviewService;
import study.cloud.stc.review.model.vo.ReviewResReqVo;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService service;
	@Autowired
	private QnaService qna_service;
	@Autowired
	private ReserveService reserveservice;
	@Autowired
	private ReviewService rv_service;
	
	@GetMapping
	public ModelAndView productList(ModelAndView mv
			, ProductVo vo
			, @RequestParam(value="page", defaultValue="1") int page
			) throws Exception {
		int currentPage = page; 
		int totalCnt= service.selectCount(vo); 
		Map<String, Integer> map= new Paging().paging(currentPage, totalCnt, 8, 3); 
		mv.addObject("pageInfo", map);
		mv.addObject("pdList", service.selectList(currentPage, 8, vo));
		mv.setViewName("product/product");
		return mv;
	}
	
	@GetMapping("/map")
	public ModelAndView productMap(ModelAndView mv
			, ProductVo vo
			) throws Exception {
		mv.addObject("pdList", service.selectList(vo));
		mv.setViewName("product/map");
		return mv;
	}

	@GetMapping("/detail")
	public ModelAndView productDetail(
			ModelAndView mv
			, @RequestParam(value="qnapage", defaultValue="1") int qnapage
			, @RequestParam(value="proNum" ,defaultValue = "") int proNum
			) throws Exception {
		ProductDetailDto dto = service.selectOne(proNum);
		Map<String, Object> product = new HashMap<>();
		product.put("detail", dto);
		List<ReviewResReqVo> rsvo = rv_service.userRsvNumSelect(proNum);
		List<ReviewResReqVo> reviewList = rv_service.selectReviewList(proNum);
		mv.addObject("reviewList", reviewList);
		mv.addObject("userRsvNum", rsvo);
		mv.addObject("product", product);
		mv.setViewName("product/detail");
		return mv;
	}
	@PostMapping("/detail")
	@ResponseBody
	public String productDetailAjax(
			  @RequestParam(value="qnapage", defaultValue="1") int qnapage
			, @RequestParam(value="proNum", defaultValue = "") int proNum
			) throws Exception {
		int currentPage = qnapage; 
		int totalCnt= qna_service.selectQnaCount(proNum);
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, 3, 5); 

		ProductDetailDto dto = service.selectOne(proNum);
		List<QnaVo> qnaList = qna_service.selectQnaList(currentPage, 3, proNum);
		
		Map<String, Object> product = new HashMap<>();
		product.put("detail", dto);
		product.put("pageInfo", map);
		product.put("qnaList", qnaList);
		
		return new Gson().toJson(product);
	}

	@PostMapping("/detail/qnainsert")
	@ResponseBody
	public String insertProductQnaAjax(QnaVo vo
			, @RequestParam(value="qnapage", defaultValue="1") int qnapage
			) throws Exception {

		int currentPage = qnapage; 
		int totalCnt= qna_service.selectQnaCount(vo.getProNum());
		if(totalCnt == 0) {
			totalCnt = 1;
		}
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, 3, 5); 
		
		qna_service.insert(vo);
		List<QnaVo> qnaList = qna_service.selectQnaList(currentPage, 3, vo.getProNum());
		
		Map<String, Object> product = new HashMap<>();
		product.put("pageInfo", map);
		product.put("qnaList", qnaList);
		return new Gson().toJson(product);
	}
	
	@PostMapping("/detail/qnaupdate")
	@ResponseBody
	public String updateProductQnaAjax(QnaVo vo
			, @RequestParam(value="qnaNum") int qnaNum
			, @RequestParam(value="proNum") int proNum
			, @RequestParam(value="qnapage", defaultValue="1") int qnapage
			) throws Exception {

		int currentPage = qnapage; 
		int totalCnt= qna_service.selectQnaCount(vo.getProNum());
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, 3, 5); 
		qna_service.update(vo);
		List<QnaVo> qnaList = qna_service.selectQnaList(currentPage, 3, vo.getProNum());

		Map<String, Object> product = new HashMap<>();
		product.put("pageInfo", map);
		product.put("qnaList", qnaList);
		return new Gson().toJson(product);
	}
	
	@PostMapping("/detail/qnadelete")
	@ResponseBody
	public String deleteProductQnaAjax(QnaVo vo
			, @RequestParam(value="qnaNum", defaultValue = "") int qnaNum
			, @RequestParam(value="proNum", defaultValue = "") int proNum
			, @RequestParam(value="qnapage", defaultValue="1") int qnapage
			) throws Exception {

		int currentPage = qnapage; 
		int totalCnt= qna_service.selectQnaCount(vo.getProNum());
		if(totalCnt == 1) {
			totalCnt = 0;
		}
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, 3, 5); 
		qna_service.delete(qnaNum);
		List<QnaVo> qnaList = qna_service.selectQnaList(currentPage, 3, vo.getProNum());

		Map<String, Object> product = new HashMap<>();
		product.put("pageInfo", map);
		product.put("qnaList", qnaList);
		return new Gson().toJson(product);
	}
	
	@PostMapping("/detail/qnareply")
	@ResponseBody
	public String replyProductQnaAjax(QnaVo vo
			, @RequestParam(value="qnaNum", defaultValue = "") int qnaNum
			, @RequestParam(value="proNum", defaultValue = "") int proNum
			, @RequestParam(value="qnapage", defaultValue="1") int qnapage
			) throws Exception {

		int currentPage = qnapage; 
		int totalCnt= qna_service.selectQnaCount(vo.getProNum());
		Map<String, Integer> map = new Paging().paging(currentPage, totalCnt, 3, 5); 
		qna_service.updateReply(vo);
		List<QnaVo> qnaList = qna_service.selectQnaList(currentPage, 3, vo.getProNum());

		Map<String, Object> product = new HashMap<>();
		product.put("pageInfo", map);
		product.put("qnaList", qnaList);
		return new Gson().toJson(product);
	}
	
	//선택된 날짜의 time과 price, 그리고 예약상태를 알아오기 
	@GetMapping("/timepricersv")
	@ResponseBody
	public List<ProductTimePriceDto> selectTimePriceRsvList(ProductTimeReqDto dto) throws Exception {
		List<ProductTimePriceDto> timePriceRsvList =  reserveservice.selectTimePriceRsvList(dto);
		return timePriceRsvList;  // json 형태
	}
		
	
}

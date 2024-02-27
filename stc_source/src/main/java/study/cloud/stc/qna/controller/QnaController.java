package study.cloud.stc.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import study.cloud.stc.qna.model.service.QnaService;
import study.cloud.stc.qna.model.vo.QnaVo;


@Controller
//@RequestMapping("/product/detail")
public class QnaController {

//	@Autowired
//	private QnaService service;
//	
//	@PostMapping("/insertqna")
//	@ResponseBody
//	public String insertQna(QnaVo vo
//			) throws Exception {
//		
//		service.insert(vo);
//
//		List<QnaVo> qnaList = service.selectQnaList(vo.getProNum());
//
//		return new Gson().toJson(qnaList);
//
//	}
	
}

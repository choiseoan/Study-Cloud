package study.cloud.stc.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.cloud.stc.reserve.model.vo.ReserveVo;
import study.cloud.stc.review.model.dao.ReviewDao;
import study.cloud.stc.review.model.vo.ReviewResReqVo;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao dao;

	@Override
	public List<ReviewResReqVo> userRsvNumSelect(int proNum) throws Exception {
		return dao.userRsvNumSelect(proNum);
	}
	@Override
	public List<ReviewResReqVo> userRsvNum(String name) throws Exception {
		return dao.userRsvNum(name);
	}
	@Override
	public List<ReviewResReqVo> userRsvProName(String name) throws Exception {
		return dao.userRsvProName(name);
	}
	@Override
	public List<ReviewResReqVo> selectReviewList(int proNum) throws Exception {
		return dao.selectReviewList(proNum);
	}
	@Override
	public List<ReviewResReqVo> selectUserReviewList(ReviewResReqVo vo) throws Exception {
		return dao.selectUserReviewList(vo);
	}
	
	
}

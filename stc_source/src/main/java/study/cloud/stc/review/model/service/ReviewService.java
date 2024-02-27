package study.cloud.stc.review.model.service;

import java.util.List;

import study.cloud.stc.reserve.model.vo.ReserveVo;
import study.cloud.stc.review.model.vo.ReviewResReqVo;

public interface ReviewService {

	public List<ReviewResReqVo> userRsvNumSelect(int proNum) throws Exception;
	public List<ReviewResReqVo> userRsvNum(String name) throws Exception;
	public List<ReviewResReqVo> userRsvProName(String name) throws Exception;
	public List<ReviewResReqVo> selectReviewList(int proNum) throws Exception;
	public List<ReviewResReqVo> selectUserReviewList(ReviewResReqVo vo) throws Exception;
	
}

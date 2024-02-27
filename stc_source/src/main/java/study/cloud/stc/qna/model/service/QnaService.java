package study.cloud.stc.qna.model.service;

import java.util.List;

import study.cloud.stc.qna.model.vo.QnaVo;


public interface QnaService {

	public int insert(QnaVo vo) throws Exception;

	// productDetail 페이징 List
	public int selectQnaCount(int proNum) throws Exception;
	public List<QnaVo> selectQnaList(int currentPage, int limit, int proNum) throws Exception;
	
	// detail qna List
	public int update(QnaVo vo) throws Exception;
	public int delete(int qnaNum) throws Exception;
	public int updateReply(QnaVo vo) throws Exception;
	
	// host qna 페이징 List 
	public int selectHostQnaCount(int proNum) throws Exception;
	public List<QnaVo> selectHostProductQnaList(int currentPage, int limit, int proNum) throws Exception;
	public int deleteReply(int qnaNum) throws Exception;
	
	// user qna
	public int selectUserQnaCount(QnaVo vo) throws Exception;
	public List<QnaVo> selectUserQnaList(String name) throws Exception;
	public List<QnaVo> selectUserQna(int currentPage, int limit, QnaVo vo) throws Exception;
	
	
}

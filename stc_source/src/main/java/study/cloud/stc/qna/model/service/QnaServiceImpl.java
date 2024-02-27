package study.cloud.stc.qna.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.cloud.stc.qna.model.dao.QnaDao;
import study.cloud.stc.qna.model.vo.QnaVo;
 

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao dao;
	
	@Override
	public int insert(QnaVo vo) throws Exception {
		return dao.insert(vo);
	}

	@Override
	public int selectQnaCount(int proNum) throws Exception {
		return dao.selectQnaCount(proNum);
	}

	@Override
	public List<QnaVo> selectQnaList(int currentPage, int limit, int proNum) throws Exception {
		return dao.selectQnaList(currentPage, limit, proNum);
	}

	@Override
	public int update(QnaVo vo) throws Exception {
		return dao.update(vo);
	}

	@Override
	public int delete(int qnaNum) throws Exception {
		return dao.delete(qnaNum);	
	}

	@Override
	public int updateReply(QnaVo vo) throws Exception {
		return dao.updateReply(vo);	
	}

	// host qna 페이징 List
	@Override
	public int selectHostQnaCount(int proNum) throws Exception {
		return dao.selectHostQnaCount(proNum);
	}

	@Override
	public List<QnaVo> selectHostProductQnaList(int currentPage, int limit, int proNum) throws Exception {
		return dao.selectHostProductQnaList(currentPage, limit, proNum);
	}

	@Override
	public int deleteReply(int qnaNum) throws Exception {
		return dao.deleteReply(qnaNum);	
	}

	// user qna 
	@Override
	public int selectUserQnaCount(QnaVo vo) throws Exception {
		return dao.selectUserQnaCount(vo);	
	}
	@Override
	public List<QnaVo> selectUserQnaList(String name) throws Exception {
		return dao.selectUserQnaList(name);	
	}
	@Override
	public List<QnaVo> selectUserQna(int currentPage, int limit, QnaVo vo) throws Exception {
		return dao.selectUserQna(currentPage, limit, vo);
	}
	


}

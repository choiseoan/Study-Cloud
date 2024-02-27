package study.cloud.stc.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import study.cloud.stc.notice.model.dao.NoticeDao;
import study.cloud.stc.notice.model.vo.NoticeVo;

//@Transactional
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao dao;
	
	@Override
	public int insert(NoticeVo vo) throws Exception{
		return dao.insert(vo);
	}

	@Override
	public int update(NoticeVo vo) throws Exception{
		return dao.update(vo);
	}

	@Override
	public int delete(int notiNum) throws Exception {
		return dao.delete(notiNum);
	}

	@Override
	public List<NoticeVo> selectList(int currentPage, int limit, String notiIdx) throws Exception {
		return dao.selectList(currentPage, limit, notiIdx);
	}
	
	@Override
	public int selectCount(String notiIdx) throws Exception {
		return dao.selectCount(notiIdx);
	}

	@Override
	public List<NoticeVo> selectNotiIdx() throws Exception {
		return dao.selectNotiIdx();
	}

	

}

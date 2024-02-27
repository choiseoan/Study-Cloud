package study.cloud.stc.product.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import study.cloud.stc.product.model.dao.ProductDao;
import study.cloud.stc.product.model.vo.HostProductDto;
import study.cloud.stc.product.model.vo.ProductDetailDto;
import study.cloud.stc.product.model.vo.ProductTimeReqDto;
import study.cloud.stc.product.model.vo.ProductVo;
 
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao dao;
	
	
	@Override
	public List<ProductVo> selectList(ProductVo vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public List<ProductVo> selectList(int currentPage, int limit, ProductVo vo) throws Exception {
		return dao.selectList(currentPage, limit, vo);
	}

	@Override
	public int selectCount(ProductVo vo) throws Exception {
		return dao.selectCount(vo);
	}
	
	
	@Override
	public ProductDetailDto selectOne(int proNum) throws Exception {
		return dao.selectOne(proNum);
	}

	
	
	
	//상품등록	

	@Override
	@Transactional
	public int insertDetail(ProductDetailDto dto) throws Exception {
		
		int nextValProNum = dao.insertMap(dto);
		dto.setProNum(nextValProNum);
		int result = dao.insertProduct(dto);
			
		return result;
	}

	@Override
	public List<HostProductDto> selectList(HostProductDto dto) throws Exception {
		return dao.selectList(dto);
	}

	@Override
	public int selectCount(HostProductDto dto) throws Exception {
		return dao.selectCount(dto);
	}

	@Override
	public List<HostProductDto> selectList(int currentPage, int limit, HostProductDto dto) throws Exception {
		return dao.selectList(currentPage, limit, dto);
	
	}

	// host qna select 옵션 List
	@Override
	public List<ProductVo> selectHostProductList(String membId) throws Exception {
		return dao.selectHostProductList(membId);
	}

	@Override
	@Transactional
	public int updateProduct(ProductDetailDto dto) throws Exception {
		int result = dao.updateMap(dto);
		if(result == 1) {
			result = dao.updateProduct(dto);
		}if(result ==1) {
			if(dto.getProPicRenameOld() != null && !dto.getProPicRenameOld().equals("")) {
				if(dto.getProPicRename() != null && !dto.getProPicRename().equals("")) {
					result = dao.updateProductFile(dto);
				}
			}else {
				if(dto.getProPicRename() != null && !dto.getProPicRename().equals("")) {
					result = dao.insertProductFile(dto);
				}
			}
		}
		return result;
	}

	@Override
	@Transactional
	public int deleteProduct(int proNum) throws Exception {
		int result = dao.deleteProductFile(proNum);
		if(result == 1) {
			result = dao.deleteProduct(proNum);
		}if(result == 1) {
			result = dao.deleteMap(proNum);
		}
		return result;
	}

	
	
	
	
	//상품운영시간
	@Override
	public int insertProTime(ProductTimeReqDto dto) throws Exception {
		return dao.insertProTime(dto);
	}
	@Override
	public int insertProTime(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HostProductDto> selectAdminList(int currentPage, int limit,HostProductDto dto) throws Exception {
	
		return dao.selectAdminList(currentPage, limit, dto);
	}

	@Override
	public List<HostProductDto> selectAdminList(HostProductDto dto) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	


	
}

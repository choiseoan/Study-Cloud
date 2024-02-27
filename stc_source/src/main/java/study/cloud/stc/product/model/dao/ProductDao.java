package study.cloud.stc.product.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import study.cloud.stc.product.model.vo.HostProductDto;
import study.cloud.stc.product.model.vo.ProductDetailDto;
import study.cloud.stc.product.model.vo.ProductTimePriceDto;
import study.cloud.stc.product.model.vo.ProductTimeReqDto;
import study.cloud.stc.product.model.vo.ProductVo;

@Repository
public class ProductDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ProductVo> selectList(ProductVo vo) throws Exception {
		return sqlSession.selectList("product.selectList", vo);
	}

	public List<ProductVo> selectList(int currentPage, int limit, ProductVo vo) throws Exception {
		return sqlSession.selectList("product.selectList", vo, new RowBounds((currentPage-1)*limit, limit));
	}

	public int selectCount(ProductVo vo) throws Exception {
		return sqlSession.selectOne("product.selectOneCount", vo);
	}


	public int insertProduct(ProductDetailDto dto) {
		return sqlSession.insert("product.insertProduct2",dto);
	}
	public int insertMap(ProductDetailDto dto) {
		int result = sqlSession.insert("product.insertProduct",dto);
		return dto.getProNum();
	}
	
	public int insertProductFile(ProductDetailDto dto) {
		return sqlSession.insert("product.insertProductFile", dto);
	}

	//게시물 수정
		public int updateMap(ProductDetailDto dto) throws Exception{
			return sqlSession.update("product.updateMap",dto);
		}
		public int updateProduct(ProductDetailDto dto) throws Exception{
			/*
			 * int result = sqlSession.insert("product.updateProduct",dto); return
			 * dto.getProNum();
			 */
			return sqlSession.update("product.updateProduct", dto);
		}
//		public int updateProtime(ProductDetailDto dto) throws Exception{
//			return sqlSession.update("product.updateProTime",dto);
//		}
		public int updateProductFile(ProductDetailDto dto) throws Exception{
			return sqlSession.update("product.updateProductFile",dto);
		}
	
		//게시물 삭제
		public int deleteProductFile(int proNum) throws Exception{
			return sqlSession.delete("product.deleteProductfile", proNum);
		}
		public int deleteProduct(int proNum) throws Exception{
			return sqlSession.delete("product.deleteProduct", proNum);
		}
		public int deleteMap(int proNum) throws Exception{
			return sqlSession.delete("product.deleteMap", proNum);
		}
	
	
	
	public ProductDetailDto selectOne(int proNum) {
//		ProductDetailDto test = sqlSession.selectOne("product.proDetail",proNum);
//		System.out.println(test.getPicList().size());
//		System.out.println(test.getTimePriceList().size());
		return sqlSession.selectOne("product.proDetail",proNum);
	}
	
	public List<HostProductDto> selectList(HostProductDto dto) throws Exception{
		return sqlSession.selectList("product.hostProductList", dto);
	}
	
	//페이징
		public int selectCount(HostProductDto dto) throws Exception{
			return sqlSession.selectOne("product.productOneCnt",dto);
		}
		
		public List<HostProductDto> selectList(int currentPage,int limit,HostProductDto dto) throws Exception{
			return sqlSession.selectList("product.hostProductList",dto,new RowBounds((currentPage-1)*limit,limit));
		}
		
		public List<HostProductDto> selectAdminList(int currentPage,int limit,HostProductDto dto) throws Exception{
			return sqlSession.selectList("product.adminProductList",dto,new RowBounds((currentPage-1)*limit,limit));
		}

		
	public List<ProductVo> selectHostProductList(String membId) {
		return sqlSession.selectList("product.selectHostProductList", membId);
	}
	
	
	//상품운영시간
	public int insertProTime(ProductTimeReqDto dto) {
		int resultCnt = 0;  // insert 한 갯수
		for(ProductTimePriceDto tp : dto.getValues()) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("time", tp.getTime());
			map.put("price", tp.getPrice());
			map.put("rsvNum", tp.getRsvNum());
			map.put("proNum", dto.getProNum());
			map.put("proDate", dto.getProDate());
			
			int result = 0;
			try {
				result = sqlSession.insert("product.insertProTime", map);
			}catch (Exception e) {
				// insert 실패
			}
			if(result == 0) {  // insert 실패
				result = sqlSession.update("product.updateProTime", map);
			}else {
				resultCnt++;  
			}
		}
		return resultCnt;
//		return sqlSession.insert("product.insertProTimeAll", dto);	
	}
	
}

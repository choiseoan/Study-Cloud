package study.cloud.stc.common.paging;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

public class Paging {
	public Map<String, Integer> paging(int currentPage, int totalCnt, int BOARD_LIMIT, int PAGE_LIMIT) {

		/*
		 * 유기적 페이징 1. @RequestParam(value="page", defaultValue="1") int page ==> 전달 받는
		 * 인자에 이걸 추가하세요
		 * 
		 * 2. int currentPage = page; int totalCnt= service.selectCount(); Map<String,
		 * Integer> map= new Paging().paging(currentPage, totalCnt, BOARD_LIMIT,
		 * PAGE_LIMIT); mv.addObject("pageInfo", map); ==> 함수 내부에 넣어 주세요
		 */

		int totalPage = (totalCnt % BOARD_LIMIT == 0) ? (totalCnt / BOARD_LIMIT) : (totalCnt / BOARD_LIMIT) + 1;
		int startPage = (currentPage % PAGE_LIMIT == 0) ? (currentPage / PAGE_LIMIT - 1) * PAGE_LIMIT + 1
				: (currentPage / PAGE_LIMIT) * PAGE_LIMIT + 1;
		int endPage = (startPage + PAGE_LIMIT > totalPage) ? totalPage : (startPage + PAGE_LIMIT);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPage", currentPage);

		return map;

	}
}

package diet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.qna.QnaVo;

@Service
public class DietService {

	@Autowired
	private DietDao dao;
	
	
	
	public List<FoodVo> selectName(FoodVo vo) {
		return dao.selectName(vo);
	}
	
	public FoodVo selectOne(FoodVo vo) {
		FoodVo vout = dao.selectOne(vo); 
		dao.countSearch(vout.getFd_no());
		return vout;
	}
	
	public int countName(String name) {
		return dao.countName(name);
	}
	
	public List<FoodVo> selectTopList(){
		return dao.selectTopList();
	}
	public List<FoodVo> getList(FoodVo vo) {
		return dao.selectList(vo);
	}
	// 총갯수와 총페이지수를 구하는 메서드
		public int[] getRowPageCount(FoodVo vo) {
			int totCount = dao.count(vo); // 총갯수
			// 총페이지 수 = 총갯수/페이지당갯수, 만약 총갯수에서 페이지당갯수로 나눈 나머지가 있으면 +1
			int totPage = totCount / vo.getPageRow();
			if (totCount % vo.getPageRow() > 0) totPage++;
			
			// 목록하단에 노출되는 페이지 범위 구하기
			// 시작페이지값 = (사용자가요청한페이지-1)/페이지당갯수*페이지당갯수+1
			int startpage = (vo.getReqPage()-1)/vo.getPageRow()*vo.getPageRow()+1;
			// 마지막페이지값 = 시작페이지-1+페이지당갯수
			int endpage = startpage-1+vo.getPageRow();
			if (endpage > totPage) endpage = totPage;
			
			int[] rowPageCount = new int[4];
			rowPageCount[0] = totCount;
			rowPageCount[1] = totPage;
			rowPageCount[2] = startpage;
			rowPageCount[3] = endpage;
			return rowPageCount;
		}
	
}

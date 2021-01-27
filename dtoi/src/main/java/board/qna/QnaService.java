package board.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {

	@Autowired
	private QnaDao qnaDao;
	
	// 총갯수와 총페이지수를 구하는 메서드
	public int[] getRowPageCount(QnaVo vo) {
		int totCount = qnaDao.count(vo); // 총갯수
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
	
	// 목록을 구하는 메서드
	public List<QnaVo> getList(QnaVo vo) {
		// limit 시작값 = (사용자가 요청한 페이지번호 - 1) * 페이지당갯수
		//int startIdx = (vo.getReqPage() - 1) * vo.getPageRow();
		//vo.setStartIdx((vo.getReqPage() - 1) * vo.getPageRow());
		return qnaDao.selectList(vo);
	}
	
	public QnaVo selectOne(QnaVo uv) {		
		return qnaDao.selectOne(uv);
	}
	
	public boolean insert(QnaVo vo) {
		int r = qnaDao.insert(vo);
		qnaDao.refUpdate(vo.getQna_no());
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	public boolean insertReply(QnaVo vo) {
		/*
		 * 부모의 그룹내에서 부모의 seq보다 큰것들을 전부 +1		  
		 */
		Map map = new HashMap();
		map.put("ref",vo.getRef());		
		map.put("seq",vo.getSeq());
		qnaDao.updateSeq(map);
		/*
		 * 그룹, 순서, 들여쓰기
		 * ref, seq, lev
		 */
		vo.setSeq(vo.getSeq()+1);
		vo.setLev(vo.getLev()+1);
		int r = qnaDao.insertReply(vo);		
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(QnaVo vo) {
		int r = qnaDao.update(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(QnaVo vo) {
		int r = qnaDao.delete(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
}

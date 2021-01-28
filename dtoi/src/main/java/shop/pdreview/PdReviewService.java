package shop.pdreview;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service  
public class PdReviewService {

	@Autowired
	private PdReviewDao pdreviewDao;
	
		public int[] getRowPageCount(PdReviewVo vo) {
			int totCount = pdreviewDao.count(vo);
	
			int totPage = totCount / vo.getPageRow();
			if (totCount % vo.getPageRow() > 0) totPage++;
			
			int startpage = (vo.getReqPage()-1)/vo.getPageRow()*vo.getPageRow()+1;
	
			int endpage = startpage-1+vo.getPageRow();
			if (endpage > totPage) endpage = totPage;
			
			int[] rowPageCount = new int[4];
			rowPageCount[0] = totCount;
			rowPageCount[1] = totPage;
			rowPageCount[2] = startpage;
			rowPageCount[3] = endpage;
			return rowPageCount;
		}

		public List<PdReviewVo> getList(int pd_no) {
	
			return pdreviewDao.selectList(pd_no);
		}
		
		
		
		public boolean insert(PdReviewVo vo) {
			int r = pdreviewDao.insert(vo);
			if (r > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		public boolean update(PdReviewVo vo) {
			int r = pdreviewDao.update(vo);
			if (r > 0) {
				return true;
			} else {
				return false;
			}
		}

		public boolean delete(PdReviewVo vo) {
			int r = pdreviewDao.delete(vo);
			if (r > 0) {
				return true;
			} else {
				return false;
			}
		}
}
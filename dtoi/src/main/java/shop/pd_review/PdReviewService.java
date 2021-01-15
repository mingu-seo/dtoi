package shop.pd_review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service  
public class PdReviewService {

	@Autowired
	private PdReviewDao pdreviewDao;
	// �Ѱ����� ������������ ���ϴ� �޼���
		public int[] getRowPageCount(PdReviewVo vo) {
			int totCount = pdreviewDao.count(vo); // �Ѱ���
			// �������� �� = �Ѱ���/�������簹��, ���� �Ѱ������� �������簹���� ���� �������� ������ +1
			int totPage = totCount / vo.getPageRow();
			if (totCount % vo.getPageRow() > 0) totPage++;
			
			// ����ϴܿ� ����Ǵ� ������ ���� ���ϱ�
			// ������������ = (����ڰ���û��������-1)/�������簹��*�������簹��+1
			int startpage = (vo.getReqPage()-1)/vo.getPageRow()*vo.getPageRow()+1;
			// �������������� = ����������-1+�������簹��
			int endpage = startpage-1+vo.getPageRow();
			if (endpage > totPage) endpage = totPage;
			
			int[] rowPageCount = new int[4];
			rowPageCount[0] = totCount;
			rowPageCount[1] = totPage;
			rowPageCount[2] = startpage;
			rowPageCount[3] = endpage;
			return rowPageCount;
		}
		
		// ����� ���ϴ� �޼���
		public List<PdReviewVo> getList(PdReviewVo vo) {
			// limit ���۰� = (����ڰ� ��û�� ��������ȣ - 1) * �������簹��
			//int startIdx = (vo.getReqPage() - 1) * vo.getPageRow();
			//vo.setStartIdx((vo.getReqPage() - 1) * vo.getPageRow());
			return pdreviewDao.selectList(vo);
		}
		
		public PdReviewVo selectOne(PdReviewVo uv) {
			return pdreviewDao.selectOne(uv);
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
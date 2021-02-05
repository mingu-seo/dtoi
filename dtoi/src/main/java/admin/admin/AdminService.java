package admin.admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;
	
	
	public AdminVo login(AdminVo vo) {
		AdminVo adminVo = adminDao.login(vo);
		return adminVo;
	}
	
	// 총갯수와 총페이지수를 구하는 메서드
	public int[] getRowPageCount(AdminVo vo) {
		int totCount = adminDao.count(vo); // 총갯수
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
	// 총갯수와 총페이지수를 구하는 메서드
		public int[] getRowPageCount_hist(AdminVo vo) {
			int totCount_hist = adminDao.historyCount(vo); // 총갯수
			// 총페이지 수 = 총갯수/페이지당갯수, 만약 총갯수에서 페이지당갯수로 나눈 나머지가 있으면 +1
			int totPage = totCount_hist / vo.getPageRow();
			if (totCount_hist % vo.getPageRow() > 0) totPage++;
			
			// 목록하단에 노출되는 페이지 범위 구하기
			// 시작페이지값 = (사용자가요청한페이지-1)/페이지당갯수*페이지당갯수+1
			int startpage = (vo.getReqPage()-1)/vo.getPageRow()*vo.getPageRow()+1;
			// 마지막페이지값 = 시작페이지-1+페이지당갯수
			int endpage = startpage-1+vo.getPageRow();
			if (endpage > totPage) endpage = totPage;
			
			int[] rowPageCount = new int[4];
			rowPageCount[0] = totCount_hist;
			rowPageCount[1] = totPage;
			rowPageCount[2] = startpage;
			rowPageCount[3] = endpage;
			return rowPageCount;
		}
	
	// 목록을 구하는 메서드
	public List<AdminVo> getList(AdminVo vo) {
		// limit 시작값 = (사용자가 요청한 페이지번호 - 1) * 페이지당갯수
		//int startIdx = (vo.getReqPage() - 1) * vo.getPageRow();
		vo.setStartIdx((vo.getReqPage() - 1) * vo.getPageRow());
		return adminDao.selectList(vo);
	}
	
	public AdminVo selectOne(AdminVo uv) {
		return adminDao.selectOne(uv);
	}
	
	public boolean isDuplicateId(String id) {
		int cnt = adminDao.isDuplicateId(id);
		if (cnt == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean insert(AdminVo vo) {
		int r = adminDao.insert(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(AdminVo vo) {
		int r = adminDao.update(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(AdminVo vo) {
		int r = adminDao.delete(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	public void insertLoginHistory(AdminVo vo) {
		adminDao.insertLoginHistory(vo);
	}
	
	public List<AdminVo> historyList(AdminVo vo) {
		// limit 시작값 = (사용자가 요청한 페이지번호 - 1) * 페이지당갯수
		//int startIdx = (vo.getReqPage() - 1) * vo.getPageRow();
		vo.setStartIdx((vo.getReqPage() - 1) * vo.getPageRow());
		return adminDao.historyList(vo);
	}
	
	
	
	
	
	
	
	
	
}

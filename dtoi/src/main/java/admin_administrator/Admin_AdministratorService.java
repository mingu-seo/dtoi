package admin_administrator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Admin_AdministratorService {

	@Autowired
	private Admin_AdministratorDao aDao;
	
	// 총갯수와 총페이지수를 구하는 메서드
	public int[] getRowPageCount(Admin_AdministratorVo vo) {
		int totCount = aDao.count(vo); // 총갯수
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
	public List<Admin_AdministratorVo> getList(Admin_AdministratorVo vo) {
		// limit 시작값 = (사용자가 요청한 페이지번호 - 1) * 페이지당갯수
		//int startIdx = (vo.getReqPage() - 1) * vo.getPageRow();
		vo.setStartIdx((vo.getReqPage() - 1) * vo.getPageRow());
		return aDao.selectList(vo);
	}
	
	public Admin_AdministratorVo selectOne(Admin_AdministratorVo uv) {
		return aDao.selectOne(uv);
	}
	
	public boolean isDuplicateId(String id) {
		int cnt = aDao.isDuplicateId(id);
		if (cnt == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean insert(Admin_AdministratorVo vo) {
		int r = aDao.insert(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(Admin_AdministratorVo vo) {
		int r = aDao.update(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(Admin_AdministratorVo vo) {
		int r = aDao.delete(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public Admin_AdministratorVo login(Admin_AdministratorVo vo) {
		return aDao.login(vo);
	}
	
	
	
	
	
	
	
	
	
	
	
}

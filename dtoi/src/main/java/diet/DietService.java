package diet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}

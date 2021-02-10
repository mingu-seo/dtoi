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
	
	public FoodVo selectNameOne(FoodVo vo) {
		return dao.selectNameOne(vo);
	}
	
	public int countName(String name) {
		return dao.countName(name);
	}
}

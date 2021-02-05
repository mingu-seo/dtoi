package diet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DietService {

	@Autowired
	private DietDao dao;
	
	public List<FoodVo> selectName(FoodVo vo) {
		return dao.selectFoodName(vo);
	}
}

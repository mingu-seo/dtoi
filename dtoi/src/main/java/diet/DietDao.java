package diet;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DietDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<FoodVo> selectFoodName(FoodVo vo) {
		return sqlSession.selectOne("food.selectName", vo);
	}
}

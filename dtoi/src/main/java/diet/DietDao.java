package diet;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DietDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<FoodVo> selectName(FoodVo vo) {
		return sqlSession.selectOne("food.selectName", vo);
	}
	
	public List<FoodVo> selectTopList(){
		return sqlSession.selectList("food.selectTopList");
	}
	
	public FoodVo selectOne(FoodVo vo) {
		return sqlSession.selectOne("food.selectOne", vo);
	}
	
	public int countName(String name) {
		return sqlSession.selectOne("food.countName", name);
	}
	
	public int countSearch(int fd_no) {
		return sqlSession.update("food.updateSearchCount", fd_no);
	}
}

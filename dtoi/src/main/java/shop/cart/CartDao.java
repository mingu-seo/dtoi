package shop.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class CartDao {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(CartVo vo) {
		return sqlSession.selectOne("cart.count", vo);
	}
	
	public List<CartVo> selectList(CartVo vo) {
		return sqlSession.selectList("cart.selectList", vo);
	}
	
	public CartVo selectOne(CartVo vo) {
		return sqlSession.selectOne("cart.selectOne", vo);
	}
	
	public int insert(CartVo vo) {
		return sqlSession.insert("cart.insert",vo);
	}
	
	public int check(CartVo vo) {
		return sqlSession.selectOne("cart.check",vo);
	}
	
	public int update(CartVo vo) {
		return sqlSession.update("cart.update",vo);
	}
	
	public int delete(CartVo vo) {
		return sqlSession.delete("cart.delete", vo);
	}
	
	
	
}

package shop.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shop.cart.CartVo;

@Repository
public class OrderDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(OrderVo vo) {
		return sqlSession.selectOne("order.count", vo);
	}
	
	public List<OrderVo> selectList(OrderVo vo) {
		return sqlSession.selectList("order.selectList", vo);
	}
	
	public OrderVo selectOne(OrderVo vo) {
		return sqlSession.selectOne("order.selectOne", vo);
	}
	
	public int insert(OrderVo vo) {
		return sqlSession.insert("order.insert",vo);
	}
}

package shop.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shop.product.ProductVo;

@Repository
public class ProductDao {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(ProductVo vo) {
		return sqlSession.selectOne("product.count", vo);
	}
	
	public List<ProductVo> selectList(ProductVo vo) {
		return sqlSession.selectList("product.selectList", vo);
	}
	
	public ProductVo selectOne(ProductVo vo) {
		return sqlSession.selectOne("product.selectOne", vo);
	}
	
	public int insert(ProductVo vo) {
		return sqlSession.insert("product.insert",vo);
	}
	
	public int update(ProductVo vo) {
		return sqlSession.update("product.update",vo);
	}
	
	public int delete(ProductVo vo) {
		return sqlSession.delete("product.delete", vo);
	}
	
	public void updateReadcnt(int pd_no) {
		sqlSession.update("product.updateReadcnt",pd_no);
	}
	
	
	
}

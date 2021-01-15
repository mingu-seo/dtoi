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
		return sqlSession .selectOne("product.count",vo);
	}
	public List<ProductVo> selectList(ProductVo vo) {
		return sqlSession .selectList("product.selectList",vo);
	}
	public ProductVo selectOne(ProductVo vo) {
		return sqlSession .selectOne("product.selectOne",vo);
	}
	
}

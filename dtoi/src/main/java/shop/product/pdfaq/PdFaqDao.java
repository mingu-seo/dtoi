package shop.product.pdfaq;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PdFaqDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(PdFaqVo vo) {
		return sqlSession.selectOne("pdfaq.count", vo);
	}
	
	public List<PdFaqVo> selectList(PdFaqVo vo) {
		return sqlSession.selectList("pdfaq.selectList", vo);
	}
	
	public PdFaqVo selectOne(PdFaqVo vo) {
		return sqlSession.selectOne("pdfaq.selectOne", vo);
	}
	
	public int insert(PdFaqVo vo) {
		return sqlSession.insert("pdfaq.insert",vo);
	}
	
	public int update(PdFaqVo vo) {
		return sqlSession.update("pdfaq.update", vo);
	}
	
	public int delete(PdFaqVo vo) {
		return sqlSession.delete("pdfaq.delete", vo);
	}
	
	
}

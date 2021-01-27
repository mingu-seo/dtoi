package board.faq;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(FaqVo vo) {
		return sqlSession.selectOne("faq.count", vo);
	}
	
	public List<FaqVo> selectList(FaqVo vo) {
		return sqlSession.selectList("faq.selectList", vo);
	}
	
	public FaqVo selectOne(FaqVo vo) {
		return sqlSession.selectOne("faq.selectOne", vo);
	}
	
	public int insert(FaqVo vo) {
		return sqlSession.insert("faq.insert",vo);
	}
	
	public int update(FaqVo vo) {
		return sqlSession.update("faq.update", vo);
	}
	
	public int delete(FaqVo vo) {
		return sqlSession.delete("faq.delete", vo);
	}
	
	
}

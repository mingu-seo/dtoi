package shop.product.pdreview;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class PdReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(PdReviewVo vo) { 
		return sqlSession .selectOne("pdreview.count",vo);
	}
	public List<PdReviewVo> selectList(PdReviewVo vo) {
		List<PdReviewVo> list = sqlSession.selectList("pdreview.selectList", vo);
		return list;
	}
	public PdReviewVo selectOne(PdReviewVo vo) {
		sqlSession.update("pdreview.updateReadCount",vo);
		return sqlSession .selectOne("pdreview.selectOne",vo);
	}
	public int insert(PdReviewVo vo) {
		 return sqlSession.insert("pdreview.insert", vo); 
	}
	public int update(PdReviewVo vo) {
		 return sqlSession.update("pdreview.update", vo); 
	}
	public int delete(PdReviewVo vo) {
		return sqlSession.delete("pdreview.delete", vo); 		
	}
	
	
}
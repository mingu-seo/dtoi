package shop.pdreview;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PdReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(PdReviewVo vo) { 
		return sqlSession .selectOne("pd_review.count",vo);
	}
	public List<PdReviewVo> selectList(PdReviewVo vo) {
		return sqlSession .selectList("pd_review.selectList",vo);
	}
	public PdReviewVo selectOne(PdReviewVo vo) {
		sqlSession.update("pd_review.updateReadCount",vo);
		return sqlSession .selectOne("pd_review.selectOne",vo);
	}
	public int insert(PdReviewVo vo) {
		 return sqlSession.insert("pd_review.insertBoard", vo); 
	}
	public int update(PdReviewVo vo) {
		 return sqlSession.update("pd_review.updateBoard", vo); 
	}
	public int delete(PdReviewVo vo) {
		return sqlSession.delete("pd_review.deleteBoard", vo); 		
	}
	public void updateReadcount(int re_no) {
	sqlSession.update("pd_review.updateBoard",re_no);
	}
	
}
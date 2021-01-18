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
		return sqlSession .selectOne("pdreview.count",vo);
	}
	public List<PdReviewVo> selectList(PdReviewVo vo) {
		return sqlSession .selectList("pdreview.selectList",vo);
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
		return sqlSession.delete("pdreview.delet", vo); 		
	}
	public void updateReadcount(int re_no) {
	sqlSession.update("pdreview.update",re_no);
	}
	
}
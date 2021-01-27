package board.qna;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(QnaVo vo) {
		return sqlSession.selectOne("qna.count", vo);
	}
	
	public List<QnaVo> selectList(QnaVo vo) {
		return sqlSession.selectList("qna.selectList", vo);
	}
	
	public QnaVo selectOne(QnaVo vo) {
		return sqlSession.selectOne("qna.selectOne", vo);
	}
	
	public int insert(QnaVo vo) {
		return sqlSession.insert("qna.insert",vo);
	}
	
	public int insertReply(QnaVo vo) {
		return sqlSession.insert("qna.insertReply",vo);
	}
	
	public int update(QnaVo vo) {
		return sqlSession.update("qna.update", vo);
	}
	
	public int delete(QnaVo vo) {
		return sqlSession.delete("qna.delete", vo);
	}	
	
	public void refUpdate(int no) {
		sqlSession.update("qna.refUpdate", no);
	}
	public void updateSeq(Map map) {
		sqlSession.update("qna.updateSeq", map);
	}
	
}

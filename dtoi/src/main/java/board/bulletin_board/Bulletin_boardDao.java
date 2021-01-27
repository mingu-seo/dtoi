package board.bulletin_board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Bulletin_boardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(Bulletin_boardVo vo) {
		return sqlSession.selectOne("bulletin_board.count", vo);
	}
	
	public List<Bulletin_boardVo> selectList(Bulletin_boardVo vo) {
		return sqlSession.selectList("bulletin_board.selectList", vo);
	}
	
	public Bulletin_boardVo selectOne(Bulletin_boardVo vo) {
		return sqlSession.selectOne("bulletin_board.selectOne", vo);
	}
	
	public int insert(Bulletin_boardVo vo) {
		return sqlSession.insert("bulletin_board.insert",vo);
	}
	
	public int update(Bulletin_boardVo vo) {
		return sqlSession.update("bulletin_board.update", vo);
	}
	
	public int delete(Bulletin_boardVo vo) {
		return sqlSession.delete("bulletin_board.delete", vo);
	}
	public void updateReadCnt(int no) {
		sqlSession.update("bulletin_board.updateReadCnt",no);
	}	
	
	
}

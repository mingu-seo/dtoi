package board.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(NoticeVo vo) {
		return sqlSession.selectOne("notice.count", vo);
	}
	
	public List<NoticeVo> selectList(NoticeVo vo) {
		return sqlSession.selectList("notice.selectList", vo);
	}
	
	public NoticeVo selectOne(NoticeVo vo) {
		return sqlSession.selectOne("notice.selectOne", vo);
	}
	
	public int insert(NoticeVo vo) {
		return sqlSession.insert("notice.insert",vo);
	}
	
	public int update(NoticeVo vo) {
		return sqlSession.update("notice.update", vo);
	}
	
	public int delete(NoticeVo vo) {
		return sqlSession.delete("notice.delete", vo);
	}
	public void updateReadCnt(int no) {
		sqlSession.update("notice.updateReadCnt",no);
	}	
	
	
}

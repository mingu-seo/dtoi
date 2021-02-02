package admin.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(AdminVo vo) {
		return sqlSession.selectOne("admin.count", vo); //네임스페이스.아이디
	}
	
	public List<AdminVo> selectList(AdminVo vo) {
		return sqlSession.selectList("admin.selectList", vo);
	}
	
	public AdminVo selectOne(AdminVo vo) {
		return sqlSession.selectOne("admin.selectOne", vo);
	}
	
	public int isDuplicateId(String ad_id) {
		return sqlSession.selectOne("admin.isDuplicateId", ad_id);
	}
	
	public int insert(AdminVo vo) {
		return sqlSession.insert("admin.insertAdmin",vo);
	}
	
	public int update(AdminVo vo) {
		return sqlSession.update("admin.updateAdmin", vo);
	}
	
	public int delete(AdminVo vo) {
		return sqlSession.delete("admin.deleteAdmin", vo);
	}
	
	public AdminVo login(AdminVo vo) {
		return sqlSession.selectOne("admin.login", vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

package admin.admin;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public AdminVo login(AdminVo vo) {
		return sqlSession.selectOne("admin.login", vo);
	}
	
	public int count(AdminVo vo) {
		return sqlSession.selectOne("admin.count", vo);
	}
	
	public List<AdminVo> selectList(AdminVo vo) {
		return sqlSession.selectList("admin.selectList", vo);
	}
	
	public AdminVo selectOne(AdminVo vo) {
		return sqlSession.selectOne("admin.selectOne", vo);
	}
	
	public int isDuplicateId(String cst_id) {
		return sqlSession.selectOne("admin.isDuplicateId", cst_id);
	}
	
	public int insert(AdminVo vo) {
		return sqlSession.insert("admin.insertCustomer",vo);
	}
	
	public int update(AdminVo vo) {
		return sqlSession.update("admin.updateCustomer", vo);
	}
	
	public int delete(AdminVo vo) {
		return sqlSession.delete("admin.deleteCustomer", vo);
	}
	public int insertLoginHistory(AdminVo vo) {
		return sqlSession.insert("admin.insertLoginHistory", vo);
	}
	public int historyCount(AdminVo vo) {
		return sqlSession.selectOne("admin.historyCount", vo);
	}
	
	public List<AdminVo> historyList(AdminVo vo) {
		return sqlSession.selectList("admin.historyList", vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

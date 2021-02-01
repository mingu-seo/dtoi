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
		return sqlSession.selectOne("administrator.count", vo);
	}
	
	public List<AdminVo> selectList(AdminVo vo) {
		return sqlSession.selectList("administrator.selectList", vo);
	}
	
	public AdminVo selectOne(AdminVo vo) {
		return sqlSession.selectOne("administrator.selectOne", vo);
	}
	
	public int isDuplicateId(String cst_id) {
		return sqlSession.selectOne("administrator.isDuplicateId", cst_id);
	}
	
	public int insert(AdminVo vo) {
		return sqlSession.insert("administrator.insertCustomer",vo);
	}
	
	public int update(AdminVo vo) {
		return sqlSession.update("administrator.updateCustomer", vo);
	}
	
	public int delete(AdminVo vo) {
		return sqlSession.delete("administrator.deleteCustomer", vo);
	}
	
	public AdminVo login(AdminVo vo) {
		return sqlSession.selectOne("administrator.login", vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

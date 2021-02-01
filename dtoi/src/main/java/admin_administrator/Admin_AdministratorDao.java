package admin_administrator;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Admin_AdministratorDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(Admin_AdministratorVo vo) {
		return sqlSession.selectOne("administrator.count", vo);
	}
	
	public List<Admin_AdministratorVo> selectList(Admin_AdministratorVo vo) {
		return sqlSession.selectList("administrator.selectList", vo);
	}
	
	public Admin_AdministratorVo selectOne(Admin_AdministratorVo vo) {
		return sqlSession.selectOne("administrator.selectOne", vo);
	}
	
	public int isDuplicateId(String cst_id) {
		return sqlSession.selectOne("administrator.isDuplicateId", cst_id);
	}
	
	public int insert(Admin_AdministratorVo vo) {
		return sqlSession.insert("administrator.insertCustomer",vo);
	}
	
	public int update(Admin_AdministratorVo vo) {
		return sqlSession.update("administrator.updateCustomer", vo);
	}
	
	public int delete(Admin_AdministratorVo vo) {
		return sqlSession.delete("administrator.deleteCustomer", vo);
	}
	
	public Admin_AdministratorVo login(Admin_AdministratorVo vo) {
		return sqlSession.selectOne("administrator.login", vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

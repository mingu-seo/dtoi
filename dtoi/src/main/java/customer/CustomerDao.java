package customer;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(CustomerVo vo) {
		return sqlSession.selectOne("customer.count", vo);
	}
	
	public List<CustomerVo> selectList(CustomerVo vo) {
		return sqlSession.selectList("customer.selectList", vo);
	}
	
	public CustomerVo selectOne(CustomerVo vo) {
		return sqlSession.selectOne("customer.selectOne", vo);
	}
	
	public int isDuplicateId(String cst_id) {
		return sqlSession.selectOne("customer.isDuplicateId", cst_id);
	}
	
	public int insert(CustomerVo vo) {
		return sqlSession.insert("customer.insertCustomer",vo);
	}
	
	public int update(CustomerVo vo) {
		return sqlSession.update("customer.updateCustomer", vo);
	}
	
	public int delete(CustomerVo vo) {
		return sqlSession.delete("customer.deleteCustomer", vo);
	}
	
	public CustomerVo login(CustomerVo vo) {
		return sqlSession.selectOne("customer.login", vo);
	}
	
	public CustomerVo kakaologin(CustomerVo vo) {
		return sqlSession.selectOne("customer.login", vo);
	}
	
	public CustomerVo searchId(CustomerVo vo) throws SQLException {
		return sqlSession.selectOne("customer.searchId", vo);
	}
	
	public CustomerVo searchpwd(CustomerVo vo) throws SQLException {
		return sqlSession.selectOne("customer.searchPwd", vo);
	}
	
	public int idcheck(CustomerVo param) throws SQLException {
		return sqlSession.selectOne("customer.idcheck", param);
	}
	
	public int updatePw(CustomerVo vo) throws SQLException {
		return sqlSession.selectOne("customer.updatePwd", vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}

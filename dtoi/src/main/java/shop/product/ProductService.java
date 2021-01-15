package shop.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.product.ProductVo;

@Service 
public class ProductService {

	@Autowired
	private ProductDao productDao;
	
	// 목록을 구하는 메서드
	public List<ProductVo> getList(ProductVo vo) {
		// limit 시작값 = (사용자가 요청한 페이지번호 - 1) * 페이지당갯수
		//int startIdx = (vo.getReqPage() - 1) * vo.getPageRow();
		//vo.setStartIdx((vo.getReqPage() - 1) * vo.getPageRow());
		return productDao.selectList(vo);
	}
	
	public ProductVo selectOne(ProductVo uv, boolean isView) {
		return productDao.selectOne(uv);
	}
	
}
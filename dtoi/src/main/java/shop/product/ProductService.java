package shop.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.product.ProductVo;

@Service 
public class ProductService {

	@Autowired
	private ProductDao productDao;
	
	// ����� ���ϴ� �޼���
	public List<ProductVo> getList(ProductVo vo) {
		// limit ���۰� = (����ڰ� ��û�� ��������ȣ - 1) * �������簹��
		//int startIdx = (vo.getReqPage() - 1) * vo.getPageRow();
		//vo.setStartIdx((vo.getReqPage() - 1) * vo.getPageRow());
		return productDao.selectList(vo);
	}
	
	public ProductVo selectOne(ProductVo uv, boolean isView) {
		return productDao.selectOne(uv);
	}
	
}
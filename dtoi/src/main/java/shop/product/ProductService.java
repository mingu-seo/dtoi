package shop.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.product.ProductVo;

@Service 
public class ProductService {

	@Autowired
	private ProductDao productDao;

	public List<ProductVo> getList(ProductVo vo) {
		return productDao.selectList(vo);
	}
	
	public ProductVo selectOne(ProductVo uv, boolean isView) {
		if (isView) productDao.updateReadcnt(uv.getPd_no());
		return productDao.selectOne(uv);
	}
	
	public boolean insert(ProductVo vo) {
		int r = productDao.insert(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(ProductVo vo) {
		int r = productDao.update(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(ProductVo vo) {
		int r = productDao.delete(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}

	
}
package shop.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.product.ProductVo;


@Service 
public class CartService {

	@Autowired
	private CartDao cartDao;
	

	public List<CartVo> getList(CartVo uv) {
		return cartDao.selectList(uv);
	}
	
	public CartVo selectOne(CartVo uv) {
		return cartDao.selectOne(uv);
	}
	
	public boolean insert(CartVo vo) {
		int r = cartDao.insert(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(CartVo vo) {
		int r = cartDao.update(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(CartVo vo) {
		int r = cartDao.delete(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}

	
}
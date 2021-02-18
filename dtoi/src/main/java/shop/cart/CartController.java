package shop.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import shop.product.ProductService;
import shop.product.ProductVo;


@Controller
public class CartController {


	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;

	
	
	@RequestMapping("/cart/index.do")
	public String index(HttpServletRequest req, ProductVo vo, CartVo uv) {
		List<CartVo> clist = cartService.getList(uv);
		List<ProductVo> list = productService.getList(vo);
		req.setAttribute("clist", clist);
		req.setAttribute("list", list);
		req.setAttribute("vo", vo);
				return "shop/cart/index";
	}
	

	
	@GetMapping("/cart/delete.do")
	public void delete(HttpServletResponse res, ProductVo vo) throws IOException {
		int delCount = 0;
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (delCount > 0) {
			out.print("alert('" +delCount+ " 건이 삭제되었습니다.');");
			out.print("location.href='/dtoi/cart/index.do';");
		} else {
			out.print("alert('삭제실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}


}
	
	


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
import org.springframework.web.multipart.MultipartFile;

import shop.product.ProductService;
import shop.product.ProductVo;
import shop.product.pdreview.PdReviewVo;


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
	public void delete(HttpServletResponse res, CartVo vo) throws IOException {
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
	
	@RequestMapping("/cart/insert.do")
	public void insert(CartVo vo, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(cartService.insert(vo));
		out.flush();
	}
	
	@RequestMapping("/cart/check.do")
	public void check(CartVo vo, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(cartService.check(vo));
		out.flush();
	}

}
	
	


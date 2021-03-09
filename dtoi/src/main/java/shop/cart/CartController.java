package shop.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import customer.CustomerVo;
import shop.product.ProductService;





@Controller
public class CartController {


	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;

	
	
	@RequestMapping("/cart/index.do")
	public String index(HttpServletRequest req, CartVo cvo, CustomerVo vo) {
		HttpSession sess = req.getSession(); // 세션객체 생성
		CustomerVo uv = (CustomerVo)sess.getAttribute("authUser"); // 세션에 저장되어 있는 객체 가져오기
		cvo.setCst_no(uv.getCst_no()); 
		
		List<CartVo> clist = cartService.getList(cvo);
		req.setAttribute("clist", clist);
		req.setAttribute("vo",cvo);
				return "shop/cart/index";
	}
	
	@GetMapping("/cart/delete.do")
	public void delete(HttpServletResponse res, CartVo vo) throws IOException {
		res.getWriter().print(cartService.delete(vo));
	}
		
		
	@GetMapping("/cart/cartDelete.do")
	public void cartDelete(HttpServletResponse res, CartVo vo) throws IOException {
		int delCount = 0;
		for(int i = 0; i < vo.getCartNos().length; i++) {			
			vo.setCart_no(Integer.parseInt(vo.getCartNos()[i]));
			if (cartService.delete(vo)) delCount++;
		}
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (delCount > 0) {
			out.print("alert('"+vo.getCartNos().length+ "건중에"+delCount+ " 건이 삭제되었습니다.');");
			out.print("location.href='/dtoi/cart/index.do';");
		} else {
			out.print("alert('삭제실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/cart/update.do")
	public void update(CartVo vo, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(cartService.update(vo));
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
	
	


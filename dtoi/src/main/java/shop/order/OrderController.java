package shop.order;



import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import customer.CustomerVo;
import shop.cart.CartService;
import shop.cart.CartVo;
import shop.product.ProductService;



@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;
	
	
	
	@RequestMapping("/order/index.do")
	public String index(HttpServletRequest req, OrderVo vo, CartVo cvo, CustomerVo uv) {
		String[] nos = req.getParameterValues("cartNos");
		String cart_no = "";
		for (int i=0; i<nos.length; i++) {
			cart_no += nos[i];
			if (i < nos.length-1) cart_no+=",";
		}
		
		// 서비스(로직) 처리(호출)
		HttpSession sess = req.getSession(); // 세션객체 생성
		CustomerVo uv1 = (CustomerVo)sess.getAttribute("authUser"); // 세션에 저장되어 있는 객체 가져오기
		cvo.setCst_no(uv1.getCst_no()); 
		cvo.setNos(cart_no);
		List<CartVo> clist = cartService.getListCart(cvo);
		req.setAttribute("clist", clist);
		req.setAttribute("vo", vo);
		
		return "shop/order/index";
	}
	

	@RequestMapping("/order/detail.do")
	public String detail(HttpServletRequest req, OrderVo vo) {
		OrderVo uv = orderService.selectOne(vo);	
		
		req.setAttribute("vo", uv);
		return "order/detail";
	}
	
	
	@RequestMapping("/order/insert.do")
	public void insert( OrderVo vo, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(orderService.insert(vo));
		out.flush();
	}
	
	
}

package admin.order;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import shop.order.OrderService;
import shop.order.OrderVo;





@Controller
public class AdminOrderController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/admin/order/index.do")
	public String index(HttpServletRequest req, OrderVo vo) {
		// 서비스(로직) 처리(호출)
		int[] rowPageCount = orderService.getRowPageCount(vo);
		List<OrderVo> list = orderService.getList(vo);

		req.setAttribute("totCount", rowPageCount[0]);
		req.setAttribute("totalPage", rowPageCount[1]);
		req.setAttribute("startPage", rowPageCount[2]); // 시작페이지
		req.setAttribute("endPage", rowPageCount[3]); // 마지막페이지
		req.setAttribute("list", list);
		req.setAttribute("reqPage", vo.getReqPage());
		req.setAttribute("vo", vo);
		return "admin/order/index";
	}
	
	@RequestMapping("/admin/order/detail.do")
	public String detail(HttpServletRequest req, OrderVo vo) {
		OrderVo uv = orderService.selectOne(vo);	
		
		req.setAttribute("vo", uv);	
		
		
		return "admin/order/detail";
	}
	
	
	
	
	
}

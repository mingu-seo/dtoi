package admin.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import customer.CustomerService;
import customer.CustomerVo;



@Controller
public class AdminCustomerController {

	@Autowired
	private CustomerService cService;	
	
	@RequestMapping("/admin/customer/index.do")
	public String index(HttpServletRequest req, CustomerVo vo) {
		// 서비스(로직) 처리(호출)
		int[] rowPageCount = cService.getRowPageCount(vo);
		List<CustomerVo> list = cService.getList(vo);
		
		// 값 저장
		// totalPage, list, reqPage
		req.setAttribute("totalPage", rowPageCount[1]);
		req.setAttribute("startPage", rowPageCount[2]); // 시작페이지
		req.setAttribute("endPage", rowPageCount[3]); // 마지막페이지
		req.setAttribute("list", list);
		// /customer/index.do?reqPage=2 -> UserVo에 reqPage 필드에 바인딩 (커맨드객체)
		// /customer/index.do
		req.setAttribute("reqPage", vo.getReqPage());
		req.setAttribute("vo", vo);
		
		// jsp 포워딩
		return "admin/customer/index";
	}
	
	@RequestMapping("/admin/customer/detail.do")
	public String detail(HttpServletRequest req, CustomerVo vo) {
		
		CustomerVo uv = cService.selectOne(vo);
		
		req.setAttribute("vo", uv);
		
		// jsp 포워딩
		return "admin/customer/detail";
	}	
	


	
	
	
}

package customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerDietController {

	@Autowired
	private CustomerService cService;
	
	@RequestMapping("/customer/diet/edit.do")
	public String edit(HttpServletRequest req, CustomerVo vo) {
		
		CustomerVo uv = cService.selectOne(vo);
		
		req.setAttribute("vo", uv);
		
		// jsp 포워딩
		return "customer/diet/edit";
	}
	
	@RequestMapping("/customer/diet/write.do")
	public String write(HttpServletRequest req, HttpServletResponse res) {
		
		return "customer/diet/write";
	}
	
	@RequestMapping("/customer/diet/insert.do")
	public String insert(HttpServletRequest req, HttpServletResponse res) {
		
		
		return "customer/diet/insert";
	}
}

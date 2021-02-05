package diet;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DietController {

	@Autowired
	private DietService service;
	
	@GetMapping("/diet/index.do")
	public String index() {
		return "diet/index";
	}
	
	@GetMapping("/diet/getFoodJson.do")
	public String getFoodJson(HttpServletRequest req) {
		FoodVo vo = new FoodVo();
		vo.setName((String)req.getAttribute("food"));
		req.setAttribute("flist", service.selectName(vo));
		return "diet/foodJson";
	}
}

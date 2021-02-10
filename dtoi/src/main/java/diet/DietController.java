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
		String name = req.getParameter("name");
		int fc = service.countName(name); // food count
		vo.setName(name);
		vo.setFoodCount(fc);
//		System.out.println(vo.getName());
		
		req.setAttribute("foodCount", fc);
		if(fc > 1) {
			req.setAttribute("flist", service.selectName(vo));
		}
		else {
			req.setAttribute("vo", service.selectNameOne(vo));
		}
		
		
		return "diet/foodJson";
	}
}

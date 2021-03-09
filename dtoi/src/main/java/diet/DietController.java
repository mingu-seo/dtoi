package diet;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class DietController {

	@Autowired
	private DietService service;
	
	@GetMapping("/diet/index.do")
	public String index(HttpServletRequest req, FoodVo vo) {
		int[] rowPageCount = service.getRowPageCount(vo);
		List<FoodVo> list = service.getList(vo);
		
		System.out.println(service.selectTopList().toString());
		req.setAttribute("totCount", rowPageCount[0]);
		req.setAttribute("totalPage", rowPageCount[1]);
		req.setAttribute("startPage", rowPageCount[2]); // 시작페이지
		req.setAttribute("endPage", rowPageCount[3]);
		req.setAttribute("list", list);
		req.setAttribute("reqPage", vo.getReqPage());
		req.setAttribute("vo", vo);
		
		return "diet/index";
	}
	
	@GetMapping("/diet/getFoodJson.do")
	public String getFoodJson(HttpServletRequest req) {
		FoodVo vo = new FoodVo();
		String no = req.getParameter("fd_no");
		String name = req.getParameter("name");
		if(no != null) {vo.setFd_no(Integer.parseInt(no));}
		vo.setName(name);
//		System.out.println(vo.getName());
		
		req.setAttribute("vo", service.selectOne(vo));
		
		
		return "diet/foodJson";
	}
}

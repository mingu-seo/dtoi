package admin.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.bulletin_board.Bulletin_boardVo;
import customer.CustomerVo;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin/admin/index.do")
	public String index(HttpServletRequest req, AdminVo vo) {
		// 서비스(로직) 처리(호출)
		int[] rowPageCount = adminService.getRowPageCount(vo);
		List<AdminVo> list = adminService.getList(vo);
		
		// 값 저장
		// totalPage, list, reqPage
		req.setAttribute("totCount", rowPageCount[0]);
		req.setAttribute("totalPage", rowPageCount[1]);
		req.setAttribute("startPage", rowPageCount[2]); // 시작페이지
		req.setAttribute("endPage", rowPageCount[3]); // 마지막페이지
		req.setAttribute("list", list);
		// /customer/index.do?reqPage=2 -> UserVo에 reqPage 필드에 바인딩 (커맨드객체)
		// /customer/index.do
		req.setAttribute("reqPage", vo.getReqPage());
		req.setAttribute("vo", vo);
		
		// jsp 포워딩
		return "admin/admin/index";
	}
	
	@RequestMapping("/admin/admin/detail.do")
	public String detail(HttpServletRequest req, AdminVo vo) {
		
		AdminVo uv = adminService.selectOne(vo);
		
		req.setAttribute("vo", uv);
		
		// jsp 포워딩
		return "admin/admin/detail";
	}
	
	@GetMapping("/admin/admin/write.do")
	public String write() {
		return "admin/admin/write";
	}
	
	@RequestMapping("/admin/admin/insert.do")
	public void insert(AdminVo vo, HttpServletResponse res) throws Exception {
		res.getWriter().print(adminService.insert(vo));
	}
	
	@RequestMapping("/admin/history/index.do")
	public String historyList(HttpServletRequest req, AdminVo vo) {
		// 서비스(로직) 처리(호출)
		int[] rowPageCount = adminService.getRowPageCount_hist(vo);
		List<AdminVo> list = adminService.historyList(vo);
		
		// 값 저장
		// totalPage, list, reqPage
		req.setAttribute("totCount", rowPageCount[0]);
		req.setAttribute("totalPage", rowPageCount[1]);
		req.setAttribute("startPage", rowPageCount[2]); // 시작페이지
		req.setAttribute("endPage", rowPageCount[3]); // 마지막페이지
		req.setAttribute("list", list);
		// /customer/index.do?reqPage=2 -> UserVo에 reqPage 필드에 바인딩 (커맨드객체)
		// /customer/index.do
		req.setAttribute("reqPage", vo.getReqPage());
		req.setAttribute("vo", vo);
		
		// jsp 포워딩
		return "admin/history/index";
	}
	@RequestMapping("/admin/admin/groupDelete.do")
	public void groupDelete(AdminVo vo, HttpServletResponse res,HttpServletRequest req) throws IOException {
		
		int delCount = 0;
		for(int i = 0; i < vo.getNos().length; i++) {			
			vo.setAd_no(Integer.parseInt(vo.getNos()[i]));
			if (adminService.delete(vo)) delCount++;
		}
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (delCount > 0) {
			out.print("alert('"+vo.getNos().length+ "건중에"+delCount+ " 건이 삭제되었습니다.');");
			out.print("location.href='/dtoi/admin/admin/index.do';");
		} else {
			out.print("alert('삭제실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	@RequestMapping(value="/admin/admin/isDuplicateId.do", method=RequestMethod.GET)
	public void isDuplicateId(HttpServletRequest req, HttpServletResponse res, @RequestParam("id") String userid) throws IOException{
		boolean r = adminService.isDuplicateId(userid);
		res.getWriter().print(r);
	}
	
}

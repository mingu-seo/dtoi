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

import customer.CustomerVo;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
		
		@GetMapping("/admin/index.do")
		public String login() {
			return "admin/index";
		}		
	
	
		@PostMapping("/admin/index.do")
		public String loginProcess(AdminVo vo, HttpServletRequest req, HttpServletResponse res) throws IOException {
			
			AdminVo adminVo = adminService.login(vo);
			// 결과 확인
			if (adminVo != null) { // 로그인 성공
				// 세션객체 가져오기
				HttpSession sess = req.getSession();
				// 세션객체에 로그인정보 저장
				sess.setAttribute("adminUser", adminVo);				
				//req.getSession().setAttribute("authUser", uv);
				String url = "/dtoi/admin/admin/index.do";
				System.out.println(req.getParameter("url"));
				if (req.getParameter("url") != null && !"".equals(req.getParameter("url"))) {
					url = req.getParameter("url");
					if (req.getParameter("param") != null && !"".equals(req.getParameter("param"))) {
						url += "?"+req.getParameter("param");
					}
				}
				return "redirect: "+url; 
				
			} else { 
			
				res.setContentType("text/html; charset=utf-8"); // 한글처리
				PrintWriter out = res.getWriter();
				out.print("<script>");
				out.print("alert('아이디와 비밀번호가 올바르지 않습니다.');");
				String url = "/dtoi/admin/index.do";
				if (req.getParameter("url") != null && !"".equals(req.getParameter("url"))) {
					url = req.getParameter("url");
					if (req.getParameter("param") != null && !"".equals(req.getParameter("param"))) {
						url += "?"+req.getParameter("param");
					}
				}
				out.print("location.href='"+url+"';");
				out.print("</script>");
				out.flush();
				return null; 
			}
		}
	
	@RequestMapping("/admin/admin/index.do")
	public String index(HttpServletRequest req, AdminVo vo) {
		// 서비스(로직) 처리(호출)
		int[] rowPageCount = adminService.getRowPageCount(vo);
		List<AdminVo> list = adminService.getList(vo);
		
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
	
	
}

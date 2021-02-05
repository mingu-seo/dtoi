package admin.history;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import admin.admin.AdminService;
import admin.admin.AdminVo;

@Controller
public class Admin_historyController {
	
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
			adminVo.setIp(vo.getIp());
			adminService.insertLoginHistory(adminVo);	
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
			System.out.println(url);
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
}

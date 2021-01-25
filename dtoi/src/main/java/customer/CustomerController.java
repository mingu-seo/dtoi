package customer;

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

@Controller
public class CustomerController {

	@Autowired
	private CustomerService cService;
	
	@GetMapping("/")
	public String index() {
		return "redirect:/customer/index.do";
	}
	
	@RequestMapping("/customer/index.do")
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
		return "customer/index";
	}
	
	@RequestMapping("/customer/detail.do")
	public String detail(HttpServletRequest req, CustomerVo vo) {
		
		CustomerVo uv = cService.selectOne(vo);
		
		req.setAttribute("vo", uv);
		
		// jsp 포워딩
		return "customer/detail";
	}
	
	@GetMapping("/customer/write.do")
	public String write() {
		System.out.println("여기는 write.do");
		return "customer/write";
	}
	
	@RequestMapping("/customer/insert.do")
	public void insert(CustomerVo vo, HttpServletResponse res) throws Exception {
		// 등록처리
		res.getWriter().print(cService.insert(vo));
	}
	
	@RequestMapping(value="/customer/isDuplicateId.do", method=RequestMethod.GET)
	public void isDuplicateId(HttpServletRequest req, HttpServletResponse res, @RequestParam("id") String userid) throws IOException{
		boolean r = cService.isDuplicateId(userid);
		res.getWriter().print(r);
	}
	
	@RequestMapping("/customer/edit.do")
	public String edit(HttpServletRequest req, CustomerVo vo) {
		
		CustomerVo uv = cService.selectOne(vo);
		
		req.setAttribute("vo", uv);
		
		// jsp 포워딩
		return "customer/edit";
	}
	
	@PostMapping("/customer/update.do")
	public void update(CustomerVo vo, HttpServletResponse res) throws IOException {
		res.getWriter().print(cService.update(vo));
	}
	
	@GetMapping("/customer/delete.do")
	public void delete(CustomerVo vo, HttpServletResponse res) throws IOException {
		
		res.getWriter().print(cService.delete(vo));
	}
	
	// 로그인폼
	@GetMapping("/customer/login.do")
	public String login() {
		return "customer/login";
	}
	
	// 로그인처리
	@PostMapping("/customer/login.do")
	public String loginProcess(CustomerVo vo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		/*
		 세션(session) : 브라우저 단위로 저장되는 저장소		 
		 
		 DB에서 아이디 비밀번호로 조회한 결과를 가져오고
		 결과가 있으면(로그인 성공)
		 - 세션에 결과객체를 저장
		 - 목록페이지로 이동
		 결과값 없으면(로그인 실패)
		 - 메시지 처리
		 - 로그인폼으로 이동
		 */
		// 사용자가 입력한 아이디와 비밀번호로 DB에서 조회한 결과
		CustomerVo uv = cService.login(vo);
		// 결과 확인
		if (uv != null) { // 로그인 성공
			// 세션객체 가져오기
			HttpSession sess = req.getSession();
			// 세션객체에 로그인정보 저장
			sess.setAttribute("authUser", uv);
			
			// 위 코드와 동일하게
			//req.getSession().setAttribute("authUser", uv);
			String url = "/dtoi/customer/index.do";
			System.out.println(req.getParameter("url"));
		if (req.getParameter("url") != null && !"".equals(req.getParameter("url"))) {
				url = req.getParameter("url"); 
			}
			return "redirect: "+url; 
			
		} else { // 로그인 실패
			req.setAttribute("msg", "아이디와 비밀번호가 올바르지 않습니다.");
			return "redirect:/customer/login.do";
		}
	}
	
	@RequestMapping("/customer/logout.do")
	public void logout(HttpServletResponse res, HttpSession sess, HttpServletRequest req) throws IOException {
		
		sess.invalidate(); // 세션초기화(모든 세션)
		// authUser만 세션 제거
		//sess.removeAttribute("authUser");
		
		res.setContentType("text/html; charset=utf-8"); // 한글처리
		PrintWriter out = res.getWriter();
		out.print("<script>");
		out.print("alert('로그아웃되었습니다.');");
		String url = "/dtoi/customer/index.do";
		if (req.getParameter("url") != null && !"".equals(req.getParameter("url"))) {
			url = req.getParameter("url"); 
		}
		out.print("location.href='"+url+"';");
		out.print("</script>");
		out.flush();
	}
	
	
	
	
	
	
	
	
}

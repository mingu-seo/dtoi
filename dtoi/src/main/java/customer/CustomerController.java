package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.bulletin_board.Bulletin_boardService;
import board.bulletin_board.Bulletin_boardVo;
import board.qna.QnaService;
import board.qna.QnaVo;
import shop.cart.CartService;
import shop.cart.CartVo;







@Controller
public class CustomerController {

	@Autowired
	private CustomerService cService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private Bulletin_boardService bulletin_boardService;
	
	@Autowired
	private CartService cartService;
	
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
	
	@RequestMapping("/customer/mypage.do")
	public String mypage(HttpServletRequest req, CustomerVo vo) {
		
		CustomerVo uv = cService.selectOne(vo);
		
		req.setAttribute("vo", uv);
		
		// jsp 포워딩
		return "customer/mypage";
	}
	
	@GetMapping("/customer/write.do")
	public String write(HttpServletRequest req, HttpServletResponse res) {
		
		return "customer/write";

	}
	@PostMapping("/customer/write.do")
	public String write(CustomerVo vo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		CustomerVo uv = cService.login(vo);
		// 결과 확인
		if (uv != null) { 
			HttpSession sess = req.getSession();
			// 세션객체에 로그인정보 저장
			sess.setAttribute("authUser", uv);
		}
		return "customer/index";
		
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
	public void delete(CustomerVo vo, HttpServletResponse res, HttpSession sess) throws IOException {
		sess.invalidate();
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
		if (uv != null) { 
			// 로그인 성공

			// 세션객체 가져오기
			HttpSession sess = req.getSession();
			// 세션객체에 로그인정보 저장
			sess.setAttribute("authUser", uv);
			req.setAttribute("msg", "로그인 되었습니다.");
			
			// 위 코드와 동일하게
			//req.getSession().setAttribute("authUser", uv);
			String url = "/dtoi/index.do";
			System.out.println(req.getParameter("url"));
			if (req.getParameter("url") != null && !"".equals(req.getParameter("url"))) {
				url = req.getParameter("url");
				if (req.getParameter("param") != null && !"".equals(req.getParameter("param"))) {
					url += "?"+req.getParameter("param");
				}
			}
			return "redirect: "+url; 
			
		} else { // 로그인 실패
		
			res.setContentType("text/html; charset=utf-8"); // 한글처리
			PrintWriter out = res.getWriter();
			out.print("<script>");
			out.print("alert('아이디와 비밀번호가 올바르지 않습니다.');");
			String url = "/dtoi/customer/login.do";
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
	
	@RequestMapping("/customer/logout.do")
	public void logout(HttpServletResponse res, HttpSession sess, HttpServletRequest req) throws IOException {
		
		sess.invalidate(); // 세션초기화(모든 세션)
		
		//sess.removeAttribute("authUser"); (authUser만 세션 제거)
		
		res.setContentType("text/html; charset=utf-8"); // 한글처리
		PrintWriter out = res.getWriter();
		out.print("<script>");
		out.print("alert('로그아웃되었습니다.');");
		String url = "/dtoi/index.do";
		if (req.getParameter("url") != null && !"".equals(req.getParameter("url"))) {
			url = req.getParameter("url"); 
			if (req.getParameter("param") != null && !"".equals(req.getParameter("param"))) {
				url += "?"+req.getParameter("param");
			}
		}
		out.print("location.href='"+url+"';");
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/customer/idsearch.do")
	public String idsearch(Model model, CustomerVo param) throws Exception {
		model.addAttribute("vo", param);
		
		return "customer/idsearch";
	}
	
	@RequestMapping("/customer/pwdsearch.do")
	public String pwdsearch(Model model, CustomerVo param) throws Exception {
		model.addAttribute("vo", param);
		
		return "customer/pwdsearch";
	}
		
	@RequestMapping("/customer/searchid.do")
	public String searchid (Model model, CustomerVo param) throws Exception {
		CustomerVo data = cService.searchId(param);
		String cst_id = "";
		if (data != null) {cst_id = data.getCst_id();}
		model.addAttribute("value", cst_id);
		
		return "include/return";
	}
	
	@RequestMapping("/customer/searchpwd.do")
	public String searchpwd(Model model, CustomerVo param) throws Exception {
		boolean success = cService.searchPwd(param);
		
		if (success) {
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", "임시 비밀번호가 메일로 전달되었습니다.");
			model.addAttribute("url", "pwdsearch.do");
		} else {
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", "임시 비밀번호 발급에 실패하였습니다.");
			model.addAttribute("url", "pwdsearch.do");
		}
		
		return "include/alert";
	}
	
	@RequestMapping("/customer/pwdcheck.do")
	public String pwcheck(Model model, CustomerVo param) throws Exception {
		model.addAttribute("vo", param);
		int value = cService.idcheck(param);
		
		model.addAttribute("value", value);
		
		return "include/return";
	}
	

	
	@RequestMapping("/customer/myqna.do")
	public String myPost(HttpServletRequest req, QnaVo vo) {
		// 서비스(로직) 처리(호출)
		int[] rowPageCount = qnaService.getRowPageCount(vo);
		List<QnaVo> list = qnaService.getList(vo);
		
		// 값 저장
		// totalPage, list, reqPage
		req.setAttribute("totCount", rowPageCount[0]);
		req.setAttribute("totalPage", rowPageCount[1]);
		req.setAttribute("startPage", rowPageCount[2]); // 시작페이지
		req.setAttribute("endPage", rowPageCount[3]); // 마지막페이지
		req.setAttribute("list", list);
		// /board/index.do?reqPage=2 -> BoardVo에 reqPage 필드에 바인딩 (커맨드객체)
		// /board/index.do
		req.setAttribute("reqPage", vo.getReqPage());
		req.setAttribute("vo", vo);
		
		// jsp 포워딩
		return "customer/myqna";
	}
	
	@RequestMapping("/customer/mypost.do")
	public String index(HttpServletRequest req, Bulletin_boardVo vo) {
		// 서비스(로직) 처리(호출)
		int[] rowPageCount = bulletin_boardService.getRowPageCount(vo);
		List<Bulletin_boardVo> list = bulletin_boardService.getList(vo);

		req.setAttribute("totCount", rowPageCount[0]);
		req.setAttribute("totalPage", rowPageCount[1]);
		req.setAttribute("startPage", rowPageCount[2]); // 시작페이지
		req.setAttribute("endPage", rowPageCount[3]); // 마지막페이지
		req.setAttribute("list", list);
		req.setAttribute("reqPage", vo.getReqPage());
		req.setAttribute("vo", vo);
		return "customer/mypost";
	}
	
	@RequestMapping("/customer/mycart.do")
	public String index(HttpServletRequest req, CartVo cvo, CustomerVo vo) {
		HttpSession sess = req.getSession(); // 세션객체 생성
		CustomerVo uv = (CustomerVo)sess.getAttribute("authUser"); // 세션에 저장되어 있는 객체 가져오기
		cvo.setCst_no(uv.getCst_no()); 
		
		List<CartVo> clist = cartService.getList(cvo);
		req.setAttribute("clist", clist);
		req.setAttribute("vo",cvo);
				return "customer/mycart";
	}

	
}

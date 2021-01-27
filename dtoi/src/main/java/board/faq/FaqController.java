package board.faq;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;




@Controller
public class FaqController {

	@Autowired
	private FaqService faqService;
	
	
	@RequestMapping("/board/faq/index.do")
	public String index(HttpServletRequest req, FaqVo vo) {
		// 서비스(로직) 처리(호출)
		int[] rowPageCount = faqService.getRowPageCount(vo);
		List<FaqVo> list = faqService.getList(vo);

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
		return "board/faq/index";
	}
	@GetMapping("/board/faq/write.do")
	public String write() {
		return "board/faq/write";
	}
	
	@RequestMapping("/board/faq/insert.do")
	public void insert(FaqVo vo, HttpServletRequest req, HttpServletResponse res, MultipartFile file) throws Exception {
				
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (faqService.insert(vo)) {
			out.print("alert('정상적으로 등록되었습니다.');");
			out.print("location.href='/dtoi/board/faq/index.do';");
		} else {
			out.print("alert('등록실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/board/faq/detail.do")
	public String detail(HttpServletRequest req, FaqVo vo) {
		
		
		FaqVo uv = faqService.selectOne(vo);	
		
		
		req.setAttribute("vo", uv);	
		
		
		// jsp 포워딩
		return "board/faq/detail";
	}
	
	@PostMapping("/board/faq/update.do")
	public void update(FaqVo vo, HttpServletResponse res, HttpServletRequest req, MultipartFile file) throws IOException {		
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (faqService.update(vo)) {
			out.print("alert('정상적으로 수정되었습니다.');");
			out.print("location.href='/dtoi/board/faq/detail.do?faq_no="+vo.getFaq_no()+"';");
		} else {
			out.print("alert('수정실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/board/faq/edit.do")
	public String edit(HttpServletRequest req, FaqVo vo) {
		
		FaqVo uv = faqService.selectOne(vo);
		
		req.setAttribute("vo", uv);
		
		// jsp 포워딩
		return "board/faq/edit";
	}
	@GetMapping("/board/faq/delete.do")
	public void delete(FaqVo vo, HttpServletResponse res) throws IOException {
		res.getWriter().print(faqService.delete(vo));
	}
	
	
	
	
	
	
	
	
}

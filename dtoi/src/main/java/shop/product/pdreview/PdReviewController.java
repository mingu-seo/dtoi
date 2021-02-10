package shop.product.pdreview;



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
public class PdReviewController {
	

	@Autowired
	private PdReviewService rService;
	
	

	@GetMapping("/product/pdreview/write.do")
	public String write(HttpServletRequest req, PdReviewVo vo) {
		req.setAttribute("pdreviewvo", vo);
		return "shop/product/pdreview/write";
	}
	
	@RequestMapping("/product/pdreview/insert.do")
	public void insert(PdReviewVo vo, HttpServletRequest req, HttpServletResponse res, MultipartFile file) throws Exception {
				
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (rService.insert(vo)) {
			out.print("alert('정상적으로 등록되었습니다.');");
			out.print("location.href='/dtoi/product/detail.do?pd_no="+vo.getPd_no()+"';");
		} else {
			out.print("alert('등록실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/product/pdreview/detail.do")
	public String detail(HttpServletRequest req, PdReviewVo vo) {
		PdReviewVo uv = rService.selectOne(vo);	
		req.setAttribute("vo", uv);	
		// jsp 포워딩
		return "shop/product/pdreview/detail";
	}
	
	@PostMapping("/product/pdreview/update.do")
	public void update(PdReviewVo vo, HttpServletResponse res, HttpServletRequest req, MultipartFile file) throws IOException {		
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (rService.update(vo)) {
			out.print("alert('정상적으로 수정되었습니다.');");
			out.print("location.href='/dtoi/product/detail.do?pd_no="+vo.getPd_no()+"';");
		} else {
			out.print("alert('수정실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/product/pdreview/edit.do")
	public String edit(HttpServletRequest req, PdReviewVo vo) {
		
		PdReviewVo uv = rService.selectOne(vo);
		
		req.setAttribute("vo", uv);
		
		// jsp 포워딩
		return "shop/product/pdreview/edit";
	}
	
	@GetMapping("/product/pdreview/delete.do")
	public void delete(PdReviewVo vo, HttpServletResponse res) throws IOException {
		res.getWriter().print(rService.delete(vo));
	}
	
	
	
}

package shop.product.pdfaq;



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

import shop.product.pdreview.PdReviewVo;




@Controller
public class PdFaqController {

	@Autowired
	private PdFaqService fService;
	
	

	@GetMapping("/product/pdfaq/write.do")
	public String write(HttpServletRequest req, PdFaqVo vo) {
		req.setAttribute("pdfaqvo", vo);
		return "shop/product/pdfaq/write";
	}
	
	@RequestMapping("/product/pdfaq/insert.do")
	public void insert(PdFaqVo vo, HttpServletRequest req, HttpServletResponse res, MultipartFile file) throws Exception {
				
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (fService.insert(vo)) {
			out.print("alert('정상적으로 등록되었습니다.');");
			out.print("location.href='/dtoi/product/detail.do?pd_no="+vo.getPd_no()+"';");
		} else {
			out.print("alert('등록실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/product/pdfaq/detail.do")
	public String detail(HttpServletRequest req, PdFaqVo vo) {
		PdFaqVo uv = fService.selectOne(vo);	
		req.setAttribute("vo", uv);	
		// jsp 포워딩
		return "shop/product/pdfaq/detail";
	}
	
	@PostMapping("/product/pdfaq/update.do")
	public void update(PdFaqVo vo, HttpServletResponse res, HttpServletRequest req, MultipartFile file) throws IOException {		
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (fService.update(vo)) {
			out.print("alert('정상적으로 수정되었습니다.');");
			out.print("location.href='/dtoi/product/detail.do?pd_no="+vo.getPd_no()+"';");
		} else {
			out.print("alert('수정실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/product/pdfaq/edit.do")
	public String edit(HttpServletRequest req, PdFaqVo vo) {
		
		PdFaqVo uv = fService.selectOne(vo);
		
		req.setAttribute("vo", uv);
		
		// jsp 포워딩
		return "shop/product/pdfaq/edit";
	}
	@GetMapping("/product/pdfaq/delete.do")
	public void delete(PdFaqVo vo, HttpServletResponse res) throws IOException {
		res.getWriter().print(fService.delete(vo));
	}
	
	
	
	
}

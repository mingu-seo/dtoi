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




@Controller
public class PdFaqController {

	@Autowired
	private PdFaqService faqService;
	
	

	@GetMapping("/shop/product/pdfaq/write.do")
	public String write() {
		return "shop/product/pdfaq/write";
	}
	
	@RequestMapping("/shop/product/pdfaq/insert.do")
	public void insert(PdFaqVo vo, HttpServletRequest req, HttpServletResponse res, MultipartFile file) throws Exception {
				
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (faqService.insert(vo)) {
			out.print("alert('정상적으로 등록되었습니다.');");
			out.print("location.href='/shop/product/detail.do?pd_no="+vo.getPdfaq_no()+"';");
		} else {
			out.print("alert('등록실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/shop/product/pdfaq/detail.do")
	public String detail(HttpServletRequest req, PdFaqVo vo) {
		PdFaqVo uv = faqService.selectOne(vo);	
		req.setAttribute("vo", uv);	
		// jsp 포워딩
		return "shop/product/pdfaq/detail";
	}
	
	@PostMapping("/shop/product/product/pdfaq/update.do")
	public void update(PdFaqVo vo, HttpServletResponse res, HttpServletRequest req, MultipartFile file) throws IOException {		
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (faqService.update(vo)) {
			out.print("alert('정상적으로 수정되었습니다.');");
			out.print("location.href='/shop/product/detail.do?pd_no="+vo.getPdfaq_no()+"';");
		} else {
			out.print("alert('수정실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/shop/product/pdfaq/edit.do")
	public String edit(HttpServletRequest req, PdFaqVo vo) {
		
		PdFaqVo uv = faqService.selectOne(vo);
		
		req.setAttribute("vo", uv);
		
		// jsp 포워딩
		return "shop/product/pdfaq/edit";
	}
	@GetMapping("/shop/product/pdfaq/delete.do")
	public void delete(PdFaqVo vo, HttpServletResponse res) throws IOException {
		res.getWriter().print(faqService.delete(vo));
	}
	
	
	
	
	
	
	
	
}

package shop.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import shop.pdreview.PdReviewService;
import shop.pdreview.PdReviewVo;

@Controller
public class ProductController {


	@Autowired
	private ProductService productService;
	@Autowired
	private PdReviewService rService;
	
	@RequestMapping("/product/index.do")
	public String index(HttpServletRequest req, ProductVo vo) {
		
		int[] rowPageCount = productService.getRowPageCount(vo);
		List<ProductVo> list = productService.getList(vo);
		
		// 값 저장
		// totalPage, list, reqPage
		req.setAttribute("totalPage", rowPageCount[1]);
		req.setAttribute("startPage", rowPageCount[2]); // 시작페이지
		req.setAttribute("endPage", rowPageCount[3]); // 마지막페이지
		req.setAttribute("list", list);
		// /board/index.do?reqPage=2 -> BoardVo에 reqPage 필드에 바인딩 (커맨드객체)
		// /board/index.do
		req.setAttribute("reqPage", vo.getReqPage());
		req.setAttribute("vo", vo);
				return "shop/product/index";
	}
	
	
	@RequestMapping("/product/detail.do")
	public String detail(HttpServletRequest req, ProductVo vo) {
		ProductVo uv = productService.selectOne(vo, true);
		List<PdReviewVo> rlist = rService.getList(uv.getPd_no());
		
		req.setAttribute("vo", uv);
		req.setAttribute("rlist", rlist);
	
		// jsp 포워딩
		return "shop/product/detail";
	}

	@RequestMapping("/product/pdreviewInsert.do")
	public void pdreviewInsert(PdReviewVo vo, HttpServletRequest req, HttpServletResponse res, MultipartFile file) throws Exception {
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (rService.insert(vo)) {
			out.print("alert('정상적으로 등록되었습니다.');");
			out.print("location.href='/shop/product/detail.do?pd_no="+vo.getRe_no()+"';");
		} else {
			out.print("alert('등록실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/product/pdreviewUpdate.do")
	public void pdreviewUpdate(PdReviewVo vo, HttpServletRequest req, HttpServletResponse res, MultipartFile file) throws Exception {
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (rService.insert(vo)) {
			out.print("alert('정상적으로 수정되었습니다.');");
			out.print("location.href='/shop/product/detail.do?pd_no="+vo.getRe_no()+"';");
		} else {
			out.print("alert('등록실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	
	@GetMapping("/product/pdreviewDelete.do")
	public void pdreviewDelete(PdReviewVo vo, HttpServletResponse res) throws IOException {
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (rService.delete(vo)) {
			out.print("alert('정상적으로 삭제되었습니다.');");
			out.print("location.href='/shop/product/detail.do?pd_no="+vo.getRe_no()+"';");
		} else {
			out.print("alert('삭제실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
}

package admin.shop;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.bulletin_board.Bulletin_boardVo;
import shop.product.ProductService;
import shop.product.ProductVo;


@Controller
public class Admin_ProductController {


	@Autowired
	private ProductService productService;


	
	@RequestMapping("/admin/product/index.do")
	public String index(HttpServletRequest req, ProductVo vo) {
		List<ProductVo> list = productService.getList(vo);
		req.setAttribute("list", list);
		req.setAttribute("vo", vo);
		// jsp 포워딩
		return "admin/product/index";
	}
	
	@GetMapping("/admin/product/write.do")
	public String write() {
		return "admin/product/write";
	}
	
	@RequestMapping("/admin/product/detail.do")
	public String detail(HttpServletRequest req, ProductVo vo) {
		
		ProductVo uv = productService.selectOne(vo, false);
		
		req.setAttribute("vo", uv);

	
		// jsp 포워딩
		return "admin/product/detail";
	}
	
	@RequestMapping("/admin/product/insert.do")
	public void insert(ProductVo vo, HttpServletRequest req, HttpServletResponse res, MultipartFile file) throws Exception {
		// 등록처리
		//res.getWriter().print(productService.insert(vo));
		
		// 파일을 저장
		if (!file.isEmpty()) { // 사용자가 첨부한 파일이 있으면
			try {
				String ext = "";
				if (file.getOriginalFilename().indexOf(".") > -1 ) { // 파일명에 . 이 포함되어있는 경우
					ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
					System.out.println(ext);
				}
				String filename = new Date().getTime()+ext;
				
				
				// request.getRealPath() -> 실제 경로를 리턴
				String path = req.getRealPath("/upload/");
				System.out.println(path);
				//path = "D:\\AI\\workspace\\user\\src\\main\\webapp\\upload\\";
				file.transferTo(new File(path+filename));
				// 파일명을 vo에 저장
				vo.setPd_image(filename);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (productService.insert(vo)) {
			out.print("alert('정상적으로 등록되었습니다.');");
			out.print("location.href='/dtoi/admin/product/index.do';");
		} else {
			out.print("alert('등록실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/admin/product/groupDelete.do")
	public void groupDelete(ProductVo vo, HttpServletResponse res,HttpServletRequest req) throws IOException {
		/*
		 컨트롤러에서 파라미터를 받는 3가지 방법
		 1. request객체
		 2. @RequestParam
		 3. 커맨드객체 (스프링이 커맨드객체의 필드명과 클라이언트에서 전송되어 오는 파라미터)
		 */		
		int delCount = 0;
		for(int i = 0; i < vo.getNos().length; i++) {			
			vo.setPd_no(Integer.parseInt(vo.getNos()[i]));
			if (productService.delete(vo)) delCount++;
		}
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (delCount > 0) {
			out.print("alert('"+vo.getNos().length+ "건중에"+delCount+ " 건이 삭제되었습니다.');");
			out.print("location.href='/dtoi/admin/product/index.do';");
		} else {
			out.print("alert('삭제실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}

	
	@RequestMapping("/admin/product/edit.do")
	public String edit(Model model, @RequestParam(required = false) String no, HttpServletRequest req, ProductVo vo) {
		
		ProductVo gvo = productService.selectOne(vo, false);
		model.addAttribute("data",gvo);
		
		return "admin/product/edit";
	}
	
	@RequestMapping("/admin/product/update.do")
	public void update(ProductVo vo, HttpServletRequest req, HttpServletResponse res, MultipartFile file) throws Exception {
		// 등록처리
		//res.getWriter().print(productService.insert(vo));
		
		// 파일을 저장
		if (!file.isEmpty()) { // 사용자가 첨부한 파일이 있으면
			try {
				String ext = "";
				if (file.getOriginalFilename().indexOf(".") > -1 ) { // 파일명에 . 이 포함되어있는 경우
					ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
					System.out.println(ext);
				}
				String filename = new Date().getTime()+ext;
				
				
				// request.getRealPath() -> 실제 경로를 리턴
				String path = req.getRealPath("/upload/admin/product/");
				System.out.println(path);
				//path = "D:\\AI\\workspace\\user\\src\\main\\webapp\\upload\\";
				file.transferTo(new File(path+filename));
				// 파일명을 vo에 저장
				vo.setPd_image(filename);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (productService.update(vo)) {
			out.print("alert('정상적으로 수정되었습니다.');");
			out.print("location.href='/dtoi/admin/product/index.do';");
		} else {
			out.print("alert('등록실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	
	
	

	
}

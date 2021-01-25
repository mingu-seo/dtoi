package admin;

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

import shop.product.ProductService;
import shop.product.ProductVo;


@Controller
public class Admin_ProductController {


	@Autowired
	private ProductService productService;


	
	@RequestMapping("/admin/product/index.do")
	public String index(HttpServletRequest req, ProductVo vo) {
		// 서비스(로직) 처리(호출)
		//int[] rowPageCount = productService.getRowPageCount(vo);
		List<ProductVo> list = productService.getList(vo);
		
		// 값 저장
		// totalPage, list, reqPage
//		req.setAttribute("totalPage", rowPageCount[1]);
//		req.setAttribute("startPage", rowPageCount[2]); // 시작페이지
//		req.setAttribute("endPage", rowPageCount[3]); // 마지막페이지
		req.setAttribute("list", list);
		// /board/index.do?reqPage=2 -> ProductVo에 reqPage 필드에 바인딩 (커맨드객체)
		// /board/index.do
//		req.setAttribute("reqPage", vo.getReqPage());
		req.setAttribute("vo", vo);
		
		// jsp 포워딩
		return "admin/product/index";
	}
	
	@GetMapping("/admin/product/write.do")
	public String write() {
		return "admin/product/write";
	}
	
	@GetMapping("/admin/product/detail.do")
	public String detail() {
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
	
	@GetMapping("/admin/product/delete.do")
	public void delete(ProductVo vo, HttpServletResponse res) throws IOException {
		res.getWriter().print(productService.delete(vo));
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

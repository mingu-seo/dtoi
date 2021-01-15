package shop.product;

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
public class ProductController {


	@Autowired
	private ProductService productService;
	
	@RequestMapping("/product/index.do")
	public String index(HttpServletRequest req, ProductVo vo) {
		// 서비스(로직) 처리(호출)
		//int[] rowPageCount = GalleryService.getRowPageCount(vo);
		List<ProductVo> list = productService.getList(vo);
				// 값 저장
				// totalPage, list, reqPage
			//	req.setAttribute("totalPage", rowPageCount[1]);
			//	req.setAttribute("startPage", rowPageCount[2]); // 시작페이지
			//	req.setAttribute("endPage", rowPageCount[3]); // 마지막페이지
				req.setAttribute("list", list);
				// /gallery/index.do?reqPage=2 -> GalleryVo에 reqPage 필드에 바인딩 (커맨드객체)
				// /gallery/index.do
			//	req.setAttribute("reqPage", vo.getReqPage());
				req.setAttribute("vo", vo);
				
				// jsp 포워딩
				return "shop/product/index";
	}
	
	
	@RequestMapping("/product/productAjax.do")
	public String productAjax(Model model, @RequestParam(required = false) String pd_no, HttpServletRequest req, ProductVo vo) { 
	//public String dogAjax(Model model, @RequestParam int no, HttpServletRequest req, GalleryVo vo) { //RequestParam는 no에 값이 없으면 에러난다
	//	System.out.println(no);
	//	System.out.println(req.getParameter("no"));
	//	System.out.println(vo.getNo());
		
		ProductVo pvo = productService.selectOne(vo,true);// 위의 매개변수에서 vo로 사용중이기떄문에 vo로 사용불가능함. 변경해서 사용해 주어야함
		model.addAttribute("data",pvo);
		//req.addAttribute("data",gvo);
		
		return "shop/product/productAjax";
	} 
	
	
}

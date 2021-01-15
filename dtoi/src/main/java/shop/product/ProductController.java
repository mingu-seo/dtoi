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
		// ����(����) ó��(ȣ��)
		//int[] rowPageCount = GalleryService.getRowPageCount(vo);
		List<ProductVo> list = productService.getList(vo);
				// �� ����
				// totalPage, list, reqPage
			//	req.setAttribute("totalPage", rowPageCount[1]);
			//	req.setAttribute("startPage", rowPageCount[2]); // ����������
			//	req.setAttribute("endPage", rowPageCount[3]); // ������������
				req.setAttribute("list", list);
				// /gallery/index.do?reqPage=2 -> GalleryVo�� reqPage �ʵ忡 ���ε� (Ŀ�ǵ尴ü)
				// /gallery/index.do
			//	req.setAttribute("reqPage", vo.getReqPage());
				req.setAttribute("vo", vo);
				
				// jsp ������
				return "shop/product/index";
	}
	
	
	@RequestMapping("/product/productAjax.do")
	public String productAjax(Model model, @RequestParam(required = false) String pd_no, HttpServletRequest req, ProductVo vo) { 
	//public String dogAjax(Model model, @RequestParam int no, HttpServletRequest req, GalleryVo vo) { //RequestParam�� no�� ���� ������ ��������
	//	System.out.println(no);
	//	System.out.println(req.getParameter("no"));
	//	System.out.println(vo.getNo());
		
		ProductVo pvo = productService.selectOne(vo,true);// ���� �Ű��������� vo�� ������̱⋚���� vo�� ���Ұ�����. �����ؼ� ����� �־����
		model.addAttribute("data",pvo);
		//req.addAttribute("data",gvo);
		
		return "shop/product/productAjax";
	} 
	
	
}

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
		
		List<ProductVo> list = productService.getList(vo);
				
				req.setAttribute("list", list);
			
				req.setAttribute("vo", vo);
	
				return "shop/product/index";
	}
	
	
	@RequestMapping("/product/detail.do")
	public String detail(HttpServletRequest req, ProductVo vo) {
		ProductVo uv = productService.selectOne(vo, false);
		
		req.setAttribute("vo", uv);

		// jsp 포워딩
		return "shop/product/detail";
	}
	
	
}

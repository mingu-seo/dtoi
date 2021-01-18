package shop.pdreview;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
	private PdReviewService pdreviewService;
	
	@RequestMapping("/pdreview/index.do")
	public String index(HttpServletRequest req, PdReviewVo vo) {
	
		int[] rowPageCount = pdreviewService.getRowPageCount(vo);
		List<PdReviewVo> list = pdreviewService.getList(vo);
		
				req.setAttribute("totalPage", rowPageCount[1]);
				req.setAttribute("startPage", rowPageCount[2]); 
				req.setAttribute("endPage", rowPageCount[3]); 
				req.setAttribute("list", list);
			
				req.setAttribute("reqPage", vo.getReqPage());
				req.setAttribute("vo", vo);
			
				return "shop/pdreview/index";
	}
	
	@RequestMapping("/pdreview/detail.do")
	public String detail(HttpServletRequest req, PdReviewVo vo) {
		
		PdReviewVo uv = pdreviewService.selectOne(vo);
		List<PdReviewVo> clist = pdreviewService.getList(vo);
		
		req.setAttribute("vo", uv);
		req.setAttribute("clist", clist);
	
	
	return "pdreview/detail";	
	}
	
	@RequestMapping("/pdreview/write.do")
	public String write() {
			return "pdreview/write";
	}
	
	@RequestMapping("/pdreview/insert.do")
	public void insert(PdReviewVo vo, HttpServletResponse res, HttpServletRequest req, MultipartFile file) throws IOException { 
		
		if (!file.isEmpty()) {
			try {
				String ext = "";
				if (file.getOriginalFilename().indexOf(".") > -1 ) { 
					ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
					System.out.println(ext);
				}
				String filename = new Date().getTime()+ext;
		
				
			
				String path = req.getRealPath("/upload/");
				System.out.println(path);
				
				file.transferTo(new File(path+ filename));
				
				vo.setRe_file(filename);
				vo.setRe_ori_file(file.getOriginalFilename());
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (pdreviewService.insert(vo)) {
			out.print("alert('정상적으로 등록되었습니다.');");
			out.print("location.href='/dtoi/pdreview/index.do';");
		} else {
			out.print("alert('등록실패';");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/pdreview/edit.do")
	public String edit(PdReviewVo vo, HttpServletRequest req) throws IOException {
	
		PdReviewVo uv = pdreviewService.selectOne(vo);
		req.setAttribute("vo", uv);
		
		return "pdreview/edit";	
		}
	
	
	
	@PostMapping("/pdreview/update.do")
	public void update(PdReviewVo vo, HttpServletResponse res, HttpServletRequest req, MultipartFile file) throws IOException {
	
				if (!file.isEmpty()) {
					try {
						String ext = "";
						if (file.getOriginalFilename().indexOf(".") > -1 ) { 
							ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
							System.out.println(ext);
						}
						String filename = new Date().getTime()+ext;
				
						
						
						String path = req.getRealPath("/upload/");
						System.out.println(path);
						
						file.transferTo(new File(path+ filename));
						
						vo.setRe_file(filename);
						vo.setRe_ori_file(file.getOriginalFilename());
					} catch (Exception e) {
						System.out.println(e.toString());
					}
				}
				
				res.setContentType("text/html; charset=utf-8");
				PrintWriter out = res.getWriter();
				out.print("<script>");
				if (pdreviewService.update(vo)) {
					out.print("alert('정상적으로 수정되었습니다');");
					out.print("location.href='/dtoi/pdreview/detail.do?no="+vo.getPd_no()+"';");
				} else {
					out.print("alert('수정실패');");
					out.print("history.back();");
				}
				out.print("</script>");
				out.flush();
			}
	
	@GetMapping("/pdreview/delete.do")
	public void delete(PdReviewVo vo, HttpServletResponse res) throws IOException {
		res.getWriter().print(pdreviewService.delete(vo));
	}
	
	
	
}

package board.qna;

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
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	
	
	@RequestMapping("/board/qna/index.do")
	public String index(HttpServletRequest req, QnaVo vo) {
		// 서비스(로직) 처리(호출)
		int[] rowPageCount = qnaService.getRowPageCount(vo);
		List<QnaVo> list = qnaService.getList(vo);
		
		// 값 저장
		// totalPage, list, reqPage
		req.setAttribute("totCount", rowPageCount[0]);
		req.setAttribute("totalPage", rowPageCount[1]);
		req.setAttribute("startPage", rowPageCount[2]); // 시작페이지
		req.setAttribute("endPage", rowPageCount[3]); // 마지막페이지
		req.setAttribute("list", list);
		// /board/index.do?reqPage=2 -> BoardVo에 reqPage 필드에 바인딩 (커맨드객체)
		// /board/index.do
		req.setAttribute("reqPage", vo.getReqPage());
		req.setAttribute("vo", vo);
		
		// jsp 포워딩
		return "board/qna/index";
	}
	
	@RequestMapping("/board/qna/detail.do")
	public String detail(HttpServletRequest req, QnaVo vo) {
		
		QnaVo uv = qnaService.selectOne(vo);		
		
		req.setAttribute("vo", uv);		
		// jsp 포워딩
		return "board/qna/view";
	}
	
	@RequestMapping("/board/qna/reply.do")
	public String reply(HttpServletRequest req, QnaVo vo) {
		
		QnaVo uv = qnaService.selectOne(vo);
		
		req.setAttribute("vo", uv);		
		
		// jsp 포워딩
		return "board/qna/reply";
	}
	
	@GetMapping("/board/qna/write.do")
	public String write() {
		return "board/qna/write";
	}
	
	@RequestMapping("/board/qna/insert.do")
	public void insert(QnaVo vo, HttpServletRequest req, HttpServletResponse res, MultipartFile file) throws Exception {
		// 등록처리
		//res.getWriter().print(replyService.insert(vo));
		
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
				//vo.setFilename(filename);
				//vo.setFilename_org(file.getOriginalFilename());
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (qnaService.insert(vo)) {
			out.print("alert('정상적으로 등록되었습니다.');");
			out.print("location.href='/dtoi/board/qna/index.do';");
		} else {
			out.print("alert('등록실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/board/qna/insertReply.do")
	public void insertReply(QnaVo vo, HttpServletRequest req, HttpServletResponse res, MultipartFile file) throws Exception {
		// 등록처리
		//res.getWriter().print(replyService.insert(vo));
		
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
				//vo.setFilename(filename);
				//vo.setFilename_org(file.getOriginalFilename());
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (qnaService.insertReply(vo)) {
			out.print("alert('정상적으로 답변이 등록되었습니다.');");
			out.print("location.href='/dtoi/board/qna/index.do';");
		} else {
			out.print("alert('등록실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/board/qna/edit.do")
	public String edit(HttpServletRequest req, QnaVo vo) {
		
		QnaVo uv = qnaService.selectOne(vo);
		
		req.setAttribute("vo", uv);
		
		// jsp 포워딩
		return "board/qna/edit";
	}
	
	@PostMapping("/board/qna/update.do")
	public void update(QnaVo vo, HttpServletResponse res, HttpServletRequest req, MultipartFile file) throws IOException {
		//res.getWriter().print(replyService.update(vo));
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
				//vo.setFilename(filename);
				//vo.setFilename_org(file.getOriginalFilename());
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (qnaService.update(vo)) {
			out.print("alert('정상적으로 수정되었습니다.');");
			out.print("location.href='/dtoi/board/qna/detail.do?qna_no="+vo.getQna_no()+"';");
		} else {
			out.print("alert('수정실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@GetMapping("/board/qna/delete.do")
	public void delete(QnaVo vo, HttpServletResponse res) throws IOException {
		res.getWriter().print(qnaService.delete(vo));
	}
	
	
	
	
	
	
}

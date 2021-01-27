package board.bulletin_board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CommentService {

	@Autowired
	private CommentDao commentDao;
	
	
	// 목록을 구하는 메서드
	public List<CommentVo> getList(int bb_no) {		
		return commentDao.selectList(bb_no);
	}
	
	public boolean insert(CommentVo vo) {
		int r = commentDao.insert(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int no) {
		int r = commentDao.delete(no);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
}

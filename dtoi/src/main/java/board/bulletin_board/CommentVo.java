package board.bulletin_board;

import java.sql.Timestamp;

public class CommentVo {
	private int no;
	private int bb_no;
	private String bb_comment;
	private Timestamp regdate;
	private int cst_no;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBb_no() {
		return bb_no;
	}
	public void setBb_no(int bb_no) {
		this.bb_no = bb_no;
	}
	public String getBb_comment() {
		return bb_comment;
	}
	public void setBb_comment(String bb_comment) {
		this.bb_comment = bb_comment;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getCst_no() {
		return cst_no;
	}
	public void setCst_no(int cst_no) {
		this.cst_no = cst_no;
	}
	
	
	
	
}

package bulletin_board;

import java.sql.Timestamp;

import util.CommonVo;

public class Bulletin_boardVo extends CommonVo {
	private int bb_no;
	private int cst_no;
	private String bb_notice;
	private String cst_grade;
	private String cst_id;
	private Timestamp bb_regdate;
	private String bb_title;
	private String bb_content;
	private int commentCount;
	private String user_name;
	private int readCnt;
	private String[] nos;
	
	public Bulletin_boardVo() {
		// 부모에서 초기값으로 10을 대입했지만, 자식에서 5로 변경
		// 부모객체가 먼저 생성되고 나서, 자식 객체가 생성되기 때문에
		//this.setPageRow(5);
	}
	
	public int getBb_no() {
		return bb_no;
	}
	public void setBb_no(int bb_no) {
		this.bb_no = bb_no;
	}
	public int getCst_no() {
		return cst_no;
	}
	public void setCst_no(int cst_no) {
		this.cst_no = cst_no;
	}
	public String getBb_notice() {
		return bb_notice;
	}
	public void setBb_notice(String bb_notice) {
		this.bb_notice = bb_notice;
	}
	public String getCst_grade() {
		return cst_grade;
	}
	public void setCst_grade(String cst_grade) {
		this.cst_grade = cst_grade;
	}
	public String getCst_id() {
		return cst_id;
	}
	public void setCst_id(String cst_id) {
		this.cst_id = cst_id;
	}
	public Timestamp getBb_regdate() {
		return bb_regdate;
	}
	public void setBb_regdate(Timestamp bb_regdate) {
		this.bb_regdate = bb_regdate;
	}
	public String getBb_title() {
		return bb_title;
	}
	public void setBb_title(String bb_title) {
		this.bb_title = bb_title;
	}
	public String getBb_content() {
		return bb_content;
	}
	public void setBb_content(String bb_content) {
		this.bb_content = bb_content;
	}

	public String[] getNos() {
		return nos;
	}

	public void setNos(String[] nos) {
		this.nos = nos;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	
	
}

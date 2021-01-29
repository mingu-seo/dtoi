package board.qna;



import java.sql.Timestamp;

import util.CommonVo;

public class QnaVo extends CommonVo {
	private int qna_no;
	private int cst_no;
	private String qna_section;
	private String qna_title;
	private String qna_content;
	private Timestamp qna_regdate;
	private int ref;
	private int seq;
	private int lev;
	private String user_name;
	
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getCst_no() {
		return cst_no;
	}
	public void setCst_no(int cst_no) {
		this.cst_no = cst_no;
	}
	public String getQna_section() {
		return qna_section;
	}
	public String getQna_name() {
		if (qna_section.equals("1")) {
			return "상품문의";
		} else if (qna_section.equals("2")) {
			return "반품";
		} else {
			return "기타";
		}
	}
	public void setQna_section(String qna_section) {
		this.qna_section = qna_section;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Timestamp getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(Timestamp qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
	
	
	
}
	
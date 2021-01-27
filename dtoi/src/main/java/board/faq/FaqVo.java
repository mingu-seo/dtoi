package board.faq;



import java.sql.Timestamp;

import util.CommonVo;

public class FaqVo extends CommonVo {
	
	private int faq_no;
	private String faq_section;
	private String faq_title;
	private String faq_contents;
	private int cat_no;
	private Timestamp faq_regdate;
	
	
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public String getFaq_section() {
		return faq_section;
	}
	public void setFaq_section(String faq_section) {
		this.faq_section = faq_section;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_contents() {
		return faq_contents;
	}
	public void setFaq_contents(String faq_contents) {
		this.faq_contents = faq_contents;
	}
	public int getCat_no() {
		return cat_no;
	}
	public void setCat_no(int cat_no) {
		this.cat_no = cat_no;
	}
	public Timestamp getFaq_regdate() {
		return faq_regdate;
	}
	public void setFaq_regdate(Timestamp faq_regdate) {
		this.faq_regdate = faq_regdate;
	}
	
	
	
	
	
}
	
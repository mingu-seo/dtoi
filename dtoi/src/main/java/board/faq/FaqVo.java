package board.faq;



import java.sql.Timestamp;

import util.CommonVo;

public class FaqVo extends CommonVo {
	
	private int faq_no;
	private String faq_section;
	private String faq_title;
	private String faq_contents;
	private Timestamp faq_regdate;
	private String[] nos;
	
	
	
	
	public String[] getNos() {
		return nos;
	}
	public void setNos(String[] nos) {
		this.nos = nos;
	}
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public String getFaq_name() {
		if (faq_section.equals("1")) {
			return "배송문의";
		} else if (faq_section.equals("2")) {
			return "상품문의";
		} else {
			return "기타";
		}
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

	public String getFaq_regdate() {
		String date = String.valueOf(faq_regdate);
		return date.substring(0,10);		
	}
	public void setFaq_regdate(Timestamp faq_regdate) {
		this.faq_regdate = faq_regdate;
	}
	
	
	
	
	
}
	
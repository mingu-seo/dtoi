package shop.product.pdfaq;



import java.sql.Timestamp;

import util.CommonVo;

public class PdFaqVo extends CommonVo {
	
	private int pdfaq_no;
	private String pdfaq_title;
	private String pdfaq_contents;
	private Timestamp pdfaq_regdate;
	private int cst_no;
	private int pd_no;
	private String[] nos;
	
	
	
	
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public int getPdfaq_no() {
		return pdfaq_no;
	}
	public void setPdfaq_no(int pdfaq_no) {
		this.pdfaq_no = pdfaq_no;
	}
	public String getPdfaq_title() {
		return pdfaq_title;
	}
	public void setPdfaq_title(String pdfaq_title) {
		this.pdfaq_title = pdfaq_title;
	}
	public String getPdfaq_contents() {
		return pdfaq_contents;
	}
	public void setPdfaq_contents(String pdfaq_contents) {
		this.pdfaq_contents = pdfaq_contents;
	}
	public Timestamp getPdfaq_regdate() {
		return pdfaq_regdate;
	}
	public void setPdfaq_regdate(Timestamp pdfaq_regdate) {
		this.pdfaq_regdate = pdfaq_regdate;
	}
	public int getCst_no() {
		return cst_no;
	}
	public void setCst_no(int cst_no) {
		this.cst_no = cst_no;
	}
	public String[] getNos() {
		return nos;
	}
	public void setNos(String[] nos) {
		this.nos = nos;
	}
	
	
	
	
	
	
	
}
	
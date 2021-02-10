package shop.product.pdreview;

import java.sql.Timestamp;
import util.CommonVo;

public class PdReviewVo extends CommonVo {

	private int re_no;
	private int pd_no;
	private String cst_no;
	private String re_title;
	private String re_content;
	private String re_file;
	private String re_ori_file;
	private Timestamp re_regdate;
	private int re_score;
	private String[] nos;
	
	
	

	public String[] getNos() {
		return nos;
	}

	public void setNos(String[] nos) {
		this.nos = nos;
	}

	public PdReviewVo() {
		super.setOrderby("re_regdate");
	}
	
	public String getRe_ori_file() {
		return re_ori_file;
	}
	public void setRe_ori_file(String re_ori_file) {
		this.re_ori_file = re_ori_file;
	}
	
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public String getCst_no() {
		return cst_no;
	}
	public void setCst_no(String cst_no) {
		this.cst_no = cst_no;
	}
	public String getRe_title() {
		return re_title;
	}
	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_file() {
		return re_file;
	}
	public void setRe_file(String re_file) {
		this.re_file = re_file;
	}
	public Timestamp getRe_regdate() {
		return re_regdate;
	}
	public void setRe_regdate(Timestamp re_regdate) {
		this.re_regdate = re_regdate;
	}
	public int getRe_score() {
		return re_score;
	}
	public void setRe_score(int re_score) {
		this.re_score = re_score;
	}
	
	
	
	
	
}
	
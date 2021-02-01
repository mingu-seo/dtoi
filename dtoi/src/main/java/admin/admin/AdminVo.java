package admin.admin;

import java.sql.Timestamp;

public class AdminVo {
	
	private int ad_no;
	private String ad_id;
	private String ad_name;
	private String ad_pwd;
	private String ad_email;
	private String ad_tel;
	
	private int reqPage; // 사용자 요청페이지
	private int pageRow; // 페이지당 노출갯수

	private int startIdx; // limit 시작값
	private String searchWord; // 검색어
	private String sdate; // 시작일
	private String edate; // 종료일
	private String orderby; // 정렬기준이되는 컬럼명
	private String direct; // ASC, DESC
	
	// 초기화용 생성자
	public AdminVo() {
		this.pageRow = 10;
		this.reqPage = 1;
		this.orderby = "cst_regdate";
		this.direct = "DESC";
	}

	public int getAd_no() {
		return ad_no;
	}

	public void setAd_no(int ad_no) {
		this.ad_no = ad_no;
	}

	public String getAd_id() {
		return ad_id;
	}

	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}

	public String getAd_name() {
		return ad_name;
	}

	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}

	public String getAd_pwd() {
		return ad_pwd;
	}

	public void setAd_pwd(String ad_pwd) {
		this.ad_pwd = ad_pwd;
	}

	public String getAd_email() {
		return ad_email;
	}

	public void setAd_email(String ad_email) {
		this.ad_email = ad_email;
	}

	public String getAd_tel() {
		return ad_tel;
	}

	public void setAd_tel(String ad_tel) {
		this.ad_tel = ad_tel;
	}

	public int getReqPage() {
		return reqPage;
	}

	public void setReqPage(int reqPage) {
		this.reqPage = reqPage;
	}

	public int getPageRow() {
		return pageRow;
	}

	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}

	public int getStartIdx() {
		return startIdx;
	}

	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public String getDirect() {
		return direct;
	}

	public void setDirect(String direct) {
		this.direct = direct;
	}
	
	
	

}

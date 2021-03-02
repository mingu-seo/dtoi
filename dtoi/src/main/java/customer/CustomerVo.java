package customer;

import java.sql.Timestamp;

public class CustomerVo {

	private int cst_no;
	private String cst_id;
	private String cst_name;
	private String cst_pwd;
	private String cst_email;
	private String cst_tel;
	private String cst_gender;
	private Timestamp cst_regdate;
	private String cst_birth;
	private String cst_disease;
	private double cst_height;
	private double cst_weight;
	private int cst_grade;
	private String zipcode;
	private String addr1;
	private String addr2;
	private int qna_no;
	private String qna_section;
	private String qna_title;
	private String qna_content;
	private Timestamp qna_regdate;
	private int ref;
	private int seq;
	private int lev;
	private String user_name;
	private String[] nos;
	
	private int reqPage; // 사용자 요청페이지
	private int pageRow; // 페이지당 노출갯수
	
	public int getCst_no() {
		return cst_no;
	}

	public void setCst_no(int cst_no) {
		this.cst_no = cst_no;
	}

	public String getCst_id() {
		return cst_id;
	}

	public void setCst_id(String cst_id) {
		this.cst_id = cst_id;
	}
	
	public String getCst_pwd() {
		return cst_pwd;
	}

	public void setCst_pwd(String cst_pwd) {
		this.cst_pwd = cst_pwd;
	}

	public String getCst_name() {
		return cst_name;
	}

	public void setCst_name(String cst_name) {
		this.cst_name = cst_name;
	}

	public String getCst_email() {
		return cst_email;
	}

	public void setCst_email(String cst_email) {
		this.cst_email = cst_email;
	}

	public String getCst_tel() {
		return cst_tel;
	}

	public void setCst_tel(String cst_tel) {
		this.cst_tel = cst_tel;
	}

	public String getCst_gender() {
		return cst_gender;
	}

	public void setCst_gender(String cst_gender) {
		this.cst_gender = cst_gender;
	}

	public Timestamp getCst_regdate() {
		return cst_regdate;
	}

	public void setCst_regdate(Timestamp cst_regdate) {
		this.cst_regdate = cst_regdate;
	}

	public String getCst_birth() {
		return cst_birth;
	}

	public void setCst_birth(String cst_birth) {
		this.cst_birth = cst_birth;
	}

	public String getCst_disease() {
		return cst_disease;
	}

	public void setCst_disease(String cst_disease) {
		this.cst_disease = cst_disease;
	}

	public double getCst_height() {
		return cst_height;
	}

	public void setCst_height(double cst_height) {
		this.cst_height = cst_height;
	}

	public double getCst_weight() {
		return cst_weight;
	}

	public void setCst_weight(double cst_weight) {
		this.cst_weight = cst_weight;
	}

	public int getCst_grade() {
		return cst_grade;
	}

	public void setCst_grade(int cst_grade) {
		this.cst_grade = cst_grade;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
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
	
	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_section() {
		return qna_section;
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

	public String[] getNos() {
		return nos;
	}

	public void setNos(String[] nos) {
		this.nos = nos;
	}

	private int startIdx; // limit 시작값
	private String searchWord; // 검색어
	private String sdate; // 시작일
	private String edate; // 종료일
	private String orderby; // 정렬기준이되는 컬럼명
	private String direct; // ASC, DESC
	
	// 초기화용 생성자
	public CustomerVo() {
		this.pageRow = 10;
		this.reqPage = 1;
		this.orderby = "cst_regdate";
		this.direct = "DESC";
	}
	
}
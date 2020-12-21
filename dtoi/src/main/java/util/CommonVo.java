package util;

public class CommonVo {

	private int reqPage; // 사용자 요청페이지
	private int pageRow; // 페이지당 노출갯수
	private int startIdx; // limit 시작값
	private String searchWord; // 검색어
	private String sdate; // 시작일
	private String edate; // 종료일
	private String orderby; // 정렬기준이되는 컬럼명
	private String direct; // ASC, DESC
	
	public CommonVo() {
		this.pageRow = 10;
		this.reqPage = 1;
		this.orderby = "regdate";
		this.direct = "DESC";
	}
	
//	public CommonVo(int pageRow) {
//		this.pageRow = pageRow;
//		this.reqPage = 1;
//		this.orderby = "regdate";
//		this.direct = "DESC";
//	}
	
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
		// 리미트시작값 = (요청한페이지-1)*pageRow
		return (this.reqPage-1)*this.getPageRow();
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

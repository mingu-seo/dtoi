package shop.order;

import util.CommonVo;

public class OrderVo extends CommonVo {
	
	
	private int or_no;
	private int cst_no;
	private String or_pay;
	private int or_pay_price;
	private int deliver;
	private int zipcode;
	private String addr1;
	private String addr2;
	private String[] nos;
	
	
	public int getOr_no() {
		return or_no;
	}
	public void setOr_no(int or_no) {
		this.or_no = or_no;
	}
	public int getCst_no() {
		return cst_no;
	}
	public void setCst_no(int cst_no) {
		this.cst_no = cst_no;
	}
	
	public String getOr_pay() {
		return or_pay;
	}
	public void setOr_pay(String or_pay) {
		this.or_pay = or_pay;
	}
	public int getOr_pay_price() {
		return or_pay_price;
	}
	public void setOr_pay_price(int or_pay_price) {
		this.or_pay_price = or_pay_price;
	}	
	public int getDeliver() {
		return deliver;
	}
	public void setDeliver(int deliver) {
		this.deliver = deliver;
	}
	public String getDeliver_name() {
		if (deliver == 1) {
			return "출고";
		} else  {
			return "미 출고";
		} 
	}
	
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
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
	public String[] getNos() {
		return nos;
	}
	public void setNos(String[] nos) {
		this.nos = nos;
	}
	
	
	

}

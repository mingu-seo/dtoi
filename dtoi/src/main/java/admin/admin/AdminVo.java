package admin.admin;

import java.sql.Timestamp;

import util.CommonVo;

public class AdminVo extends CommonVo{
	
	private int ad_no;
	
	private String ad_id;
	private String ad_pwd;
	private String ad_email;
	private String ad_name;
	private String ad_tel;
	private Timestamp ad_regdate;
	
	private int no;	
	private Timestamp logindate;
	private String ip;
	private String[] nos;
	
	
	
	
	
	
	
	public String[] getNos() {
		return nos;
	}
	public void setNos(String[] nos) {
		this.nos = nos;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Timestamp getLogindate() {
		return logindate;
	}
	public void setLogindate(Timestamp logindate) {
		this.logindate = logindate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
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
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}
	
	public Timestamp getAd_regdate() {
		return ad_regdate;
	}
	public void setAd_regdate(Timestamp ad_regdate) {
		this.ad_regdate = ad_regdate;
	}
	public String getAd_tel() {
		return ad_tel;
	}
	public void setAd_tel(String ad_tel) {
		this.ad_tel = ad_tel;
	}
	
	
	
	
	
	
	

}

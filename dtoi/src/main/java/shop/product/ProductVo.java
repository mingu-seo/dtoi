package shop.product;

import java.sql.Timestamp;

import util.CommonVo;

public class ProductVo extends CommonVo{

	private int pd_no;
	private String pd_name;
	private int pd_price;
	private String pd_content;
	private String pd_category;	
	private String pd_recom;
	private String pd_info;
	private String pd_image;
	private Timestamp pd_regdate;
	private int pd_clickcount;
	private int pd_ordercount;	
	
	
	
	
	
	public Timestamp getPd_regdate() {
		return pd_regdate;
	}
	public void setPd_regdate(Timestamp pd_regdate) {
		this.pd_regdate = pd_regdate;
	}
	public int getpd_clickcount() {
		return pd_clickcount;
	}
	public void setpd_clickcount(int pd_clickcount) {
		this.pd_clickcount = pd_clickcount;
	}
	public int getpd_ordercount() {
		return pd_ordercount;
	}
	public void setpd_ordercount(int pd_ordercount) {
		this.pd_ordercount = pd_ordercount;
	}
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public String getPd_content() {
		return pd_content;
	}
	public void setPd_content(String pd_content) {
		this.pd_content = pd_content;
	}
	public String getPd_category() {
		return pd_category;
	}
	public void setPd_category(String pd_category) {
		this.pd_category = pd_category;
	}
	public String getPd_recom() {
		return pd_recom;
	}
	public void setPd_recom(String pd_recom) {
		this.pd_recom = pd_recom;
	}
	public String getPd_info() {
		return pd_info;
	}
	public void setPd_info(String pd_info) {
		this.pd_info = pd_info;
	}
	public String getPd_image() {
		return pd_image;
	}
	public void setPd_image(String pd_image) {
		this.pd_image = pd_image;
	}
	
	
	
}

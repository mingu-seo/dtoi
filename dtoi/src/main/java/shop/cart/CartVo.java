package shop.cart;


public class CartVo {
	
	
	private int cart_no;
	private int pd_no;
	private int cst_no;
	private String pd_price;
	private String ct_count;
	private String ct_price;
	
	private String pd_image;
	private String pd_name;
	private String[] cartNos;
	
	
	public String[] getCartNos() {
		return cartNos;
	}
	public void setCartNos(String[] cartNos) {
		this.cartNos = cartNos;
	}
	
	
	public String getPd_image() {
		return pd_image;
	}
	public void setPd_image(String pd_image) {
		this.pd_image = pd_image;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public int getCst_no() {
		return cst_no;
	}
	public void setCst_no(int cst_no) {
		this.cst_no = cst_no;
	}
	
	public String getPd_price() {
		return pd_price;
	}
	public void setPd_price(String pd_price) {
		this.pd_price = pd_price;
	}
	public String getCt_count() {
		return ct_count;
	}
	public void setCt_count(String ct_count) {
		this.ct_count = ct_count;
	}
	public String getCt_price() {
		return ct_price;
	}
	public void setCt_price(String ct_price) {
		this.ct_price = ct_price;
	}
	
	
	
}

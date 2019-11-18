package jsp.bean;

public class ProductBean {
	private String pid;
	private String name;
	private String img;
	private String price;
	private int realPrice;
	
	public int getRealPrice() {
		return realPrice;
	}
	public void setRealPrice(int realPrice) {
		this.realPrice = realPrice;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}	
}

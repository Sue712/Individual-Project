package my.shop;

public class ProductDto {
 
	private int pnum;
	private String pname;
	private String pcategory_fk;
	private String ppublisher;
	private String pimage;
	private int pqty;
	private int price;
	private String pspec;
	private String pcontents;
	private int point;
	private String pinputdate;
	private int totalPrice;
	private int salePrice;
	private int totalPoint;
	
	public ProductDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}

	public ProductDto(int pnum, String pname, String pcategory_fk, String ppublisher, String pimage, int pqty,
			int price, String pspec, String pcontents, int point, String pinputdate, int totalPrice, int salePrice) {
		super();
		this.pnum = pnum;
		this.pname = pname;
		this.pcategory_fk = pcategory_fk;
		this.ppublisher = ppublisher;
		this.pimage = pimage;
		this.pqty = pqty;
		this.price = price;
		this.pspec = pspec;
		this.pcontents = pcontents;
		this.point = point;
		this.pinputdate = pinputdate;
		this.totalPrice =  totalPrice;
		this.salePrice = salePrice;
		
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPcategory_fk() {
		return pcategory_fk;
	}

	public void setPcategory_fk(String pcategory_fk) {
		this.pcategory_fk = pcategory_fk;
	}

	public String getPpublisher() {
		return ppublisher;
	}

	public void setPpublisher(String ppublisher) {
		this.ppublisher = ppublisher;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public int getPqty() {
		return pqty;
	}

	public void setPqty(int pqty) {
		this.pqty = pqty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPspec() {
		return pspec;
	}

	public void setPspec(String pspec) {
		this.pspec = pspec;
	}

	public String getPcontents() {
		return pcontents;
	}

	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getPinputdate() {
		return pinputdate;
	}

	public void setPinputdate(String pinputdate) {
		this.pinputdate = pinputdate;
	}
	
	
}

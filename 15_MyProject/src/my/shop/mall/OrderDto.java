package my.shop.mall;

public class OrderDto {
private String mname;
private String memId;
private String pname;
private int qty;
private int amount;


public OrderDto() {
	super();
}


public OrderDto(String mname, String memId, String pname, int qty, int amount) {
	super();
	this.mname = mname;
	this.memId = memId;
	this.pname = pname;
	this.qty = qty;
	this.amount = amount;
}


public String getMname() {
	return mname;
}


public void setMname(String mname) {
	this.mname = mname;
}


public String getMemId() {
	return memId;
}


public void setMemId(String memId) {
	this.memId = memId;
}


public String getPname() {
	return pname;
}


public void setPname(String pname) {
	this.pname = pname;
}


public int getQty() {
	return qty;
}


public void setQty(int qty) {
	this.qty = qty;
}


public int getAmount() {
	return amount;
}


public void setAmount(int amount) {
	this.amount = amount;
}

}

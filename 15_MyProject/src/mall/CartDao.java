package mall;

import java.sql.SQLException;
import java.util.Vector;

import my.shop.ProductDa;
import my.shop.ProductBean;

public class CartDao {

	private Vector<ProductBean> clist;

	public CartDao() {

		clist = new Vector<ProductBean>();

	}

	public void addProduct(String pnum, String oqty) throws SQLException {

		int oqty_new = Integer.parseInt(oqty.trim());
		int pnum_new = Integer.parseInt(pnum.trim());

		ProductBean newPd = null;
		ProductDa pdao = ProductDa.getInstance();
		newPd = pdao.selectByPnum(pnum);

		for (int i = 0; i < clist.size(); i++) {

			int cPnum = clist.get(i).getPnum();

			if (cPnum == pnum_new) {
				System.out.println(cPnum + ":번호 같음:");

				int cPqty = clist.get(i).getPqty();
				clist.get(i).setPqty(cPqty + oqty_new);
				clist.get(i).setTotalPrice(clist.get(i).getPrice() * (cPqty + oqty_new));
				clist.get(i).setTotalPoint(clist.get(i).getPoint() * (cPqty + oqty_new));
				return;
			}
		} // for

		newPd.setPqty(oqty_new);
		int totalPrice = oqty_new * newPd.getPrice();
		int totalPoint = oqty_new * newPd.getPoint();
		newPd.setTotalPrice(totalPrice);
		newPd.setTotalPoint(totalPoint);

		clist.add(newPd);
		System.out.println(newPd.getTotalPoint());
		System.out.println(newPd.getTotalPrice());

		for (int j = 0; j < clist.size(); j++) {
			System.out.println(clist.get(j).getPnum() + " : " + clist.get(j).getPname());
			System.out.println("clist.size() : " + clist.size());
		}

	}// addProduct()----------------

	public Vector<ProductBean> getAllProducts() {
		return clist;
	}

public void setEdit(String pnum, String oqty ){
	System.out.println("setEdit" + pnum + oqty );
	
	int qty=Integer.parseInt(oqty.trim());
	
	for(ProductBean pd:clist){

		if(Integer.parseInt(pnum)==pd.getPnum()){ 
			if(qty==0){
				clist.removeElement(pd);
				System.out.println("remove");
				break;
			}else{
				pd.setPqty(qty);
				int price = pd.getPqty()*pd.getPrice();
				int point = pd.getPqty()*pd.getPoint();
				pd.setTotalPrice(price);
				pd.setTotalPoint(point);
				
				System.out.println( pd.getPnum() +"/d/" + pd.getPqty() +"//" + pd.getPrice() + ".." +  pd.getPoint());
				break;
			}
		}
	}//for------------------------
}// setEdit()--------------------------

public void removeProduct(String pnum){
	
	int pnum_new = Integer.parseInt(pnum) ;
	
	for(ProductBean pd : clist){			
		if(pnum_new == pd.getPnum()){			
			clist.removeElement(pd);
			break; 
		}
	}//for---
}//removeProduct()-----------------

public void removeProduct(){
	clist.removeAllElements();
}
}

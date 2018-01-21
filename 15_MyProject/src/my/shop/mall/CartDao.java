package my.shop.mall;

import java.sql.SQLException;
import java.util.Vector;

import my.shop.ProductDao;
import my.shop.ProductDto;

public class CartDao {

	private Vector<ProductDto> clist;
	
	
	public CartDao() {
		
		clist = new Vector<ProductDto>();
		
	}
	
	
	
	
	
	
	public void addProduct(String pnum, String oqty) throws SQLException{

		int oqty_new = Integer.parseInt(oqty.trim());
		int pnum_new = Integer.parseInt(pnum.trim());
		
		
		ProductDto newPd =null;
		ProductDao pdao = ProductDao.getInstance();
		
		newPd = pdao.selectByPnum(pnum);
		
		for(int i=0; i<clist.size(); i++) {
			
			int cPnum =clist.get(i).getPnum();
			if(cPnum == pnum_new) {
				
				System.out.println(cPnum  + ":번호 같음");
				
				int cPqty = clist.get(i).getPqty();
				clist.get(i).setPqty(cPqty + oqty_new);
				clist.get(i).setTotalPrice(clist.get(i).getPrice()*(cPqty+oqty_new));
				clist.get(i).setTotalPoint(clist.get(i).getPoint()*(cPqty+oqty_new));
				
				return;
			}
		}
		
		
		newPd.setPqty(oqty_new);
		int totalPrice = oqty_new * newPd.getPrice();
		int totalPoint =oqty_new * newPd.getPoint();
		
		newPd.setTotalPrice(totalPrice);
		newPd.setTotalPoint(totalPoint);
		
		
		clist.add(newPd);
		
		for(int j=0; j<clist.size(); j++) {
			
			System.out.println(clist.get(j).getPnum() + ":" +clist.get(j).getPname() );
		}
	}
	
	
	
	public Vector<ProductDto>  getAllProducts(){
		
		return clist;
		
	}
	
}

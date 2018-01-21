package my.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderDao {
	
 private static DataSource dataFactory;
 Connection conn;
 

public OrderDao() {

	
	try {
		
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		dataFactory = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn=dataFactory.getConnection();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	 
	 
 }

public Vector<OrderDto> getOrderList(String memid) throws SQLException{
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Vector<OrderDto> lists = new Vector<OrderDto>();
	
	
	String sql ="select m.name mname, m.id mid, p.pname, o.qty, o.amount ";
	sql += "from (members m join orders o on m.no = o.memno) join  product p on o.pnum = p.pnuum "; 
	sql += " where m.id =? ";
			
	
	pstmt  = conn.prepareStatement(sql);
	pstmt.setString(1, memid);
	rs= pstmt.executeQuery();
	
	lists = this.makeVector(rs);
	
	
	rs.close();
	pstmt.close();
			
	return lists;
	
}
 
public Vector<OrderDto> makeVector(ResultSet rs) throws SQLException{
	
	Vector<OrderDto> lists = new Vector<OrderDto>();
	
	
	
	while(rs.next()) {
	OrderDto odto= new OrderDto();
	
	odto.setMname(rs.getString("mname"));
	odto.setMemId(rs.getString("mid"));
	odto.setPname(rs.getString("pname"));
	odto.setQty(rs.getInt("qty"));
	odto.setAmount(rs.getInt("amount"));
	
	
	
	lists.add(odto);
	
	
	}
	return  lists;
	
	
	
}



 
}

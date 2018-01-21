package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductDa {
	private DataSource ds;
	Connection conn = null;

	private static ProductDa instance = new ProductDa();

	public static ProductDa getInstance() {

		return instance;
	}

	private ProductDa() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int insertProduct(MultipartRequest mr) throws SQLException {

		PreparedStatement pstmt = null;

		conn.setAutoCommit(false);

		String sql = "insert into product values(catprod.nextval,?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);

		String pname = mr.getParameter("pname");
		String pcategory_fk = mr.getParameter("pcategory_fk");

		pcategory_fk += mr.getParameter("pcode");
		// pcategory_fk에는 카테고리 코드(code)와 상품코드(pcode)가 연결되서 들어간다.
				// pcategory_fk = mangray

		String ppublisher = mr.getParameter("ppublisher");
		String pimage = mr.getFilesystemName("pimage");
		// System.out.println(pimage); // �ߺ��� ȭ���̶�� ȭ���̸��ڿ� ���ڰ� �پ ���´�.
		// mr.getParamter("pimage");

		String pqty = mr.getParameter("pqty");
		String price = mr.getParameter("price");
		String pspec = mr.getParameter("pspec");
		String pcontents = mr.getParameter("pcontents");
		String point = mr.getParameter("point");

		pstmt.setString(1, pname);
		pstmt.setString(2, pcategory_fk);
		pstmt.setString(3, ppublisher);
		pstmt.setString(4, pimage);
		pstmt.setString(5, pqty);
		pstmt.setString(6, price);
		pstmt.setString(7, pspec);
		pstmt.setString(8, pcontents);
		pstmt.setString(9, point);

		java.util.Date date = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		pstmt.setString(10, today); // 2017-10-24
		int cnt = -1;
		cnt = pstmt.executeUpdate();
System.out.println(ppublisher);
		conn.commit();
		pstmt.close();
		// conn.close() ;

		return cnt;

	}

	public ArrayList<ProductBean> productAll() throws Exception {
		System.out.println("productAll()");

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product order by pnum";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		ArrayList<ProductBean> list = this.makeArrayList(rs);

		rs.close();
		pstmt.close();

		return list;

	}

	private ArrayList<ProductBean> makeArrayList(ResultSet rs) throws SQLException {

		ArrayList<ProductBean> list = new ArrayList<ProductBean>();

		while (rs.next()) {
			int pnum = rs.getInt(1);
			String pname = rs.getString(2);
			String pcategory_fk = rs.getString(3);
			String ppublisher = rs.getString(4);
			String pimage = rs.getString(5);
			int pqty = rs.getInt(6);
			int price = rs.getInt(7);
			String pspec = rs.getString(8);
			String pcontents = rs.getString(9);
			int point = rs.getInt(10);
			String pinputdate = rs.getString(11);
			ProductBean dto = new ProductBean(pnum, pname, pcategory_fk, ppublisher, pimage, pqty, price, pspec,
					pcontents, point, pinputdate, 0, 0);
			
			list.add(dto);
			
		}
		return list;
	}

	public ProductBean selectByPnum(String pnum) throws SQLException {
		System.out.println("selectByPnum()");

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product where pnum =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pnum);
		rs = pstmt.executeQuery();
		ArrayList<ProductBean> list = this.makeArrayList(rs);

		ProductBean product = null;
		if (list.size() != 0) {
			product = list.get(0);
        System.out.println(list.get(0).getPqty());
			rs.close();
			pstmt.close();
		}
		return product;
	}

	public int updateProduct(MultipartRequest mr) throws SQLException {
		System.out.println("updateProduct");
		PreparedStatement pstmt = null;

		conn.setAutoCommit(false);

		String sql = "update product set pname=?,pcategory_fk=?, ppublisher=?, pimage=?, pqty=?, price=?, pspec=?, pcontents=?, point=? where pnum=?";
		pstmt = conn.prepareStatement(sql);

		String pname = mr.getParameter("pname");
		String pcategory_fk = mr.getParameter("pcategory_fk");
		String ppublisher = mr.getParameter("ppublisher");
		String pimage = mr.getFilesystemName("pimage");

		if (pimage == null) {
			pimage = mr.getParameter("pimage2");
		}

		String pqty = mr.getParameter("pqty");
		String price = mr.getParameter("price");
		String pspec = mr.getParameter("pspec");
		String pcontents = mr.getParameter("pcontents");
		String point = mr.getParameter("point");
		String pnum = mr.getParameter("pnum");

		pstmt.setString(1, pname);
		pstmt.setString(2, pcategory_fk);
		pstmt.setString(3, ppublisher);
		pstmt.setString(4, pimage);
		pstmt.setInt(5, Integer.parseInt(pqty));
		pstmt.setInt(6, Integer.parseInt(price));
		pstmt.setString(7, pspec);
		pstmt.setString(8, pcontents);
		pstmt.setInt(9, Integer.parseInt(point));
		pstmt.setInt(10, Integer.parseInt(pnum));

		int cnt = -1;
		cnt = pstmt.executeUpdate();

		conn.commit();
		pstmt.close();
		// conn.close() ;

		return cnt;

	}

	public int deleteProduct(String pnum) throws SQLException {
		int cnt = -1;

		PreparedStatement pstmt = null;
		String sql = "delete from product where pnum=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pnum);
		cnt = pstmt.executeUpdate();

		pstmt.close();

		return cnt;

	}

	public ArrayList<ProductBean> selectByPspec(String spec) throws SQLException {

		System.out.println("selectByPspec(spec[i])");

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product where Pspec=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, spec);

		rs = pstmt.executeQuery();

		ArrayList<ProductBean> list = this.makeArrayList(rs);

		rs.close();
		pstmt.close();

		return list;
	}

	
	public ArrayList<ProductBean> selectByCategory(String code) throws SQLException{
		System.out.println("selectByCategory()");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		String sql = "select * from product where pcategory_fk like ?";
		
		
		pstmt = conn.prepareStatement(sql);
		
		
			pstmt.setString(1, code + "%"); //(man%) man���� �����ϴ� �͵��� �����Ͷ�
		
	
		
		rs = pstmt.executeQuery();

		ArrayList<ProductBean> list = this.makeArrayList(rs);
		
		
		rs.close();
		pstmt.close();
		
	
		// conn.close() ;
		return list ;
		
	}
	
public  ArrayList<ProductBean>  selectProd(String pname) throws SQLException{
	System.out.println("selectProd()");
	pname= pname.trim();
	System.out.println(pname);

	ProductBean product = new ProductBean();

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from product where pname like ?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, "%"+pname+"%");
	rs=pstmt.executeQuery();
	
	
	ArrayList<ProductBean> list = this.makeArrayList(rs);

	for(int i=0; i<list.size(); i++){
		int pnum = list.get(i).getPnum();
		System.out.println(pnum);
	}
	
	return list;

		
	}
	
	
}

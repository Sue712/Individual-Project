package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import my.member.MemberDto;

public class CategoryDao {

	private DataSource ds;
	Connection conn = null;

	private static CategoryDao instance;

	public static CategoryDao getInstance() throws Exception {
		if (instance == null) {
			instance = new CategoryDao();
		}
		return instance;
	}

	private CategoryDao() throws Exception {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		ds = (DataSource) envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();

	}

	public int insertCategory(CategoryDto cdto) throws Exception {
		System.out.println("insertCategory()");
		PreparedStatement pstmt = null;
		int cnt = -1;
		String sql = "insert into category values(catseq.nextval,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cdto.getCode());
		pstmt.setString(2, cdto.getCname());
		cnt = pstmt.executeUpdate();
		return cnt;
	}

	public ArrayList<CategoryDto> getCategoryAll() throws Exception {
		System.out.println("getCategorybean()");

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from category ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		ArrayList<CategoryDto> list = new ArrayList<CategoryDto>();
		
		while (rs.next()) {
			
			CategoryDto member = new CategoryDto();
			member.setCnum(rs.getInt("cnum"));
			member.setCode(rs.getString("code"));
			member.setCname(rs.getString("cname"));
			System.out.println(member.getCnum()+"/" + member.getCode() + "/" + member.getCname());

			list.add(member);
		
		}
		rs.close();
		pstmt.close();

		return list;

	}
	public int deleteCategory(String cnum) throws Exception{
		System.out.println("deleteCategory()");
		
		int cnt =-1;
		
		PreparedStatement pstmt = null;

		String sql = "delete from category where cnum=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cnum);
		cnt = pstmt.executeUpdate();
		
		pstmt.close();
		
		return cnt ;
	}
}

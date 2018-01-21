package my.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {

	Connection conn = null;

	private static MemberDao dao = new MemberDao();

	public static MemberDao getInstance() {
		System.out.println("dao2");
		return dao;
		

	}

	private MemberDao() {
		System.out.println("dao1Ω√¿€");
	}

	private Connection getConnection() throws Exception {
		System.out.println("dao3");
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		return conn;

	}

	public MemberDto getMemberInfo(String id, String password) throws Exception {

		MemberDto member =null;
		System.out.println("getMemberInfo :" + id + "/" + password);

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from members where id=? and password =? ";
	
		conn = getConnection();
	
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		System.out.println("rs");
	    rs= pstmt.executeQuery();
		
		while (rs.next()) {
			member = getMemberBean(rs);
		}

		return member;

	}

	private MemberDto getMemberBean(ResultSet rs) throws SQLException {
		MemberDto member = new MemberDto();

		member.setNo(rs.getInt("no"));
		member.setName(rs.getString("name"));
		member.setId(rs.getString("id"));
		member.setPassword(rs.getString("password"));
		member.setSsn1(rs.getString("ssn1"));
		member.setSsn2(rs.getString("ssn2"));
		member.setEmail(rs.getString("email"));
		member.setHp1(rs.getString("hp1"));
		member.setHp2(rs.getString("hp2"));
		member.setHp3(rs.getString("hp3"));
		member.setJoindate(rs.getString("joindate"));

		return member;
	}

	public int insertData(MemberDto dto) throws Exception {
		System.out.println("insertData");
		int cnt = -1;
		

		PreparedStatement pstmt = null;
		String sql = "insert into members(no, name, id, password, ssn1, ssn2, email, hp1, hp2, hp3, joindate) "
		+ " values(memseq.nextval, ?, ?, ?, ?, ?,?,?,?,?,?) ";
		conn = getConnection();

		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getId());
		pstmt.setString(3, dto.getPassword());
		pstmt.setString(4, dto.getSsn1());
		pstmt.setString(5, dto.getSsn2());
		pstmt.setString(6, dto.getEmail());
		pstmt.setString(7, dto.getHp1());
		pstmt.setString(8, dto.getHp2());
		pstmt.setString(9, dto.getHp3());
		pstmt.setString(10, dto.getJoindate());

		cnt =pstmt.executeUpdate();
		
		return cnt;

	}
	
	
	public boolean searchID(String userid) throws Exception{
		
		System.out.println("userid : " + userid);
		boolean isCheck = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select id from members where id=? ";
		conn = getConnection();

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			isCheck = true;	
		}
		
		return isCheck;
		
	}
	
	public MemberDto getMemberByHp(String name, String hp1, String hp2, String hp3) throws Exception{
		System.out.println("getMemberByHp(): " + name +"/" +hp1+"-"+hp2+"-" +hp3);

		MemberDto dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from members where name=? and hp1=? and hp2=? and hp3=? ";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, hp1);
		pstmt.setString(3, hp2);
		pstmt.setString(4, hp3);
		
		rs = pstmt.executeQuery();
	
		while(rs.next()) {
			dto = getMemberBean(rs);
			
		}	System.out.println(name);
		
		return dto;
	
	}

}

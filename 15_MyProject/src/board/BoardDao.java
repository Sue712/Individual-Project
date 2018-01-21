package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import my.shop.ProductBean;

public class BoardDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbid = "jsp";
	String dbpw = "jsppw";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private static BoardDao instance = new BoardDao();

	public static BoardDao getIstance() {
		return instance;

	}

	private BoardDao() {
		System.out.println("객체 생성");
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (Exception e) {

		}

	}
	
	
	public int getArticleCount(){
		
		
		
		String sql = "select count(*) as cnt from board";
		int count =-1;
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				
				count=rs.getInt("cnt");
			}
		} catch (Exception e) {
		e.printStackTrace();
		}finally{
			
		}
		
		return count;
	}
	
	
	public  List<BoardBean> getArticles(int startRow, int endRow){
		System.out.println("startRow / endRow : " + startRow + "/" +endRow); 
		List<BoardBean> articleList =null;
		
		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql +="from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip  ";
		sql +="from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql +="from board ";
		sql +="order by ref desc, re_step asc)) ";
		sql +="where rank between ? and ? ";
		
		
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				articleList = new ArrayList<BoardBean>();
				
				do{
					
					BoardBean article = new BoardBean();
					
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					
					articleList.add(article);
					
				}while(rs.next());
				
			}
			
		} catch (Exception e) {
		}
		
		return articleList;
	}
	
public void insertArticle(BoardBean bean){
	System.out.println("insertArticle()");
	
	
	try {
		String sql = "insert into board(num, writer,email,subject,passwd,reg_date,"
				+ "ref,re_step,re_level,content,ip) "
				+"values(board_seq.nextval, ?,?,?,?,?,board_seq.nextval,?,?,?,?)";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bean.getWriter());
		pstmt.setString(2, bean.getEmail());
		pstmt.setString(3, bean.getSubject());
		pstmt.setString(4, bean.getPasswd());
		pstmt.setTimestamp(5, bean.getReg_date());
		// ref 번호랑 똑같은 걸
		pstmt.setInt(6, 0); // re_step ?
		pstmt.setInt(7, 0); // re_level 원글 0 답글이면 1 답글 답글 2
		pstmt.setString(8, bean.getContent());
		pstmt.setString(9, bean.getIp());

		pstmt.executeUpdate();

	} catch (Exception e) {
	e.printStackTrace();
	}finally{
		
	}
	
}


public BoardBean getArticle(int num){
	System.out.println("getArticle()" + num);
	BoardBean article =null;
	
	String sql = "update board set readcount=readcount+1 where num=?";
	String sql2 = "select * from board where num=?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
		
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()){
			article = new BoardBean();
			
			article.setNum(rs.getInt("num"));
			article.setWriter(rs.getString("writer"));
			article.setEmail(rs.getString("email"));
			article.setSubject(rs.getString("subject"));
			article.setPasswd(rs.getString("passwd"));
			article.setReg_date(rs.getTimestamp("reg_date"));
			article.setReadcount(rs.getInt("readcount"));
			article.setRef(rs.getInt("ref"));
			article.setRe_step(rs.getInt("re_step"));
			article.setRe_level(rs.getInt("re_level"));
			article.setContent(rs.getString("content"));
			article.setIp(rs.getString("ip"));

		}
	} catch (Exception e) {
	e.printStackTrace();
	}finally{
		
	}
	
	return article;
	
}


public BoardBean updateGetArticle(int num){
	System.out.println("updateGetArticle()");
	BoardBean article =null;
	
	String sql = "select * from board where num=?";
	
	try {
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()){
		article = new BoardBean();
			
			article.setNum(rs.getInt("num"));
			article.setWriter(rs.getString("writer"));
			article.setEmail(rs.getString("email"));
			article.setSubject(rs.getString("subject"));
			article.setPasswd(rs.getString("passwd"));
			article.setReg_date(rs.getTimestamp("reg_date"));
			article.setReadcount(rs.getInt("readcount"));
			article.setRef(rs.getInt("ref"));
			article.setRe_step(rs.getInt("re_step"));
			article.setRe_level(rs.getInt("re_level"));
			article.setContent(rs.getString("content"));
			article.setIp(rs.getString("ip"));

		}
	} catch (Exception e) {
	}
	return article;
	
}

public int updateAticles(BoardBean article){
	
	System.out.println("updateAticles()");
	String dbpasswd = "";
	int cnt =-1;
	String sql ="select passwd from board where num=?";
	String sql2 ="update board set writer=?,email=?, subject=?, passwd=?, content=? where num=? ";
	
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, article.getNum());
		rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			dbpasswd=rs.getString("passwd");
			if(dbpasswd.equals(article.getPasswd())){
				pstmt = conn.prepareStatement(sql2);
				
				pstmt.setString(1, article.getWriter());
				pstmt.setString(2, article.getEmail());
				pstmt.setString(3, article.getSubject());
				pstmt.setString(4, article.getPasswd());
				pstmt.setString(5, article.getContent());
				pstmt.setInt(6, article.getNum());
				
				cnt = pstmt.executeUpdate();
			}
		}
	} catch (Exception e) {
	}
	System.out.println("updateArticle cnt :" +cnt);
	return cnt;
}


public int deleteArticle(int num, String passwd){
	System.out.println("deleteArticle()");
	String dbpasswd = "";
	int cnt = -1;
	String sql = "select passwd from board where num=?";
	String sql2 = "delete from board where num=?";

	try {

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			dbpasswd = rs.getString("passwd");
			if (dbpasswd.equals(passwd)) {

				pstmt = conn.prepareStatement(sql2);

				pstmt.setInt(1, num);

				cnt = pstmt.executeUpdate();
			}
		}
	} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
	}
	System.out.println("deleteArticle cnt :" + cnt);
	return cnt;
}


public void replyArticle(BoardBean article) {

	int num=article.getNum();
	int ref=article.getRef();
	int re_step=article.getRe_step();
	int re_level=article.getRe_level();
	
	System.out.println("num:"+num);
	System.out.println("subject:"+article.getSubject());
	System.out.println("ref:"+ref);
	System.out.println("re_step:"+re_step);
	System.out.println("re_level:"+re_level);
	
	String sql2 = "update board set re_step = re_step+1 where ref= ? and re_step > ?" ;

	try {
		
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, ref);
		pstmt.setInt(2, re_step);
		pstmt.executeUpdate();
		re_step=re_step+1;
		re_level=re_level+1;
		
		System.out.println("re_step : "+ re_step+"/" +re_level);

		String sql3 = "insert into board(num, writer,email,subject,passwd,reg_date, readcount,";
		sql3 += " ref,re_step,re_level,content,ip) values(board_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";

		pstmt = conn.prepareStatement( sql3 );
		pstmt.setString(1, article.getWriter());
		pstmt.setString(2, article.getEmail());
		pstmt.setString(3, article.getSubject());
		pstmt.setString(4, article.getPasswd());
		pstmt.setTimestamp(5, article.getReg_date());
		pstmt.setInt(6, article.getReadcount());
		pstmt.setInt(7, ref);
		pstmt.setInt(8, re_step);
		pstmt.setInt(9, re_level);
		pstmt.setString(10, article.getContent());
		pstmt.setString(11, article.getIp());
		
		pstmt.executeUpdate();
	} catch(Exception ex) {
		ex.printStackTrace();
	} finally {
		//close();
	}
}   	


public ArrayList<BoardBean> getBoardBySubject(String subject) throws SQLException{
	System.out.println("getBoardBySubjectAndWriter()");
	subject= subject.trim();
	System.out.println(subject + "/");

	

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from board where subject like ? ";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, "%"+subject+"%");
	rs=pstmt.executeQuery();
	ArrayList<BoardBean> list  = new ArrayList<BoardBean>();
	if(rs.next()){
		BoardBean bean = new BoardBean();
			
			bean.setNum(rs.getInt("num"));
			bean.setWriter(rs.getString("writer"));
			bean.setEmail(rs.getString("email"));
			bean.setSubject(rs.getString("subject"));
			bean.setPasswd(rs.getString("passwd"));
			bean.setReg_date(rs.getTimestamp("reg_date"));
			bean.setReadcount(rs.getInt("readcount"));
			bean.setRef(rs.getInt("ref"));
			bean.setRe_step(rs.getInt("re_step"));
			bean.setRe_level(rs.getInt("re_level"));
			bean.setContent(rs.getString("content"));
			bean.setIp(rs.getString("ip"));
			 list.add(bean);
		}
	  
	return list;
	
}
}

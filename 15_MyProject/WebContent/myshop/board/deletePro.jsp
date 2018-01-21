<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "board.BoardDao" %>
<%@ page import = "board.BoardBean" %> 

<%

request.setCharacterEncoding("UTF-8");


int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");	
	String passwd = request.getParameter("passwd");

System.out.println(num+"/" + pageNum);

BoardDao bdao = BoardDao.getIstance();
int cnt = -1;
cnt  = bdao.deleteArticle(num, passwd);

String str="", url="";

if(cnt==1){
	int count = bdao.getArticleCount();
	int pn = Integer.parseInt(pageNum);
	int pageCount= count /10 + (count %10==0?0:1);
	
	if(pageCount <pn){
		response.sendRedirect("List.jsp?pageNum=" + (pn-1));
		
	}else{
		response.sendRedirect("List.jsp?pageNum=" + pn);
	}	
	}else{
		
		%>
	<Script type="text/javascript">
	alert("비밀버호가 맞지 않습니다.");
	history.go(-1);
	</Script>	
		
		
		<%
	}
	
%>
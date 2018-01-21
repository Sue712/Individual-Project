<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "board.BoardDao" %>
<%@ page import = "board.BoardBean" %> 
<%@ page import = "java.text.SimpleDateFormat" %>

<%@include file="mall_top2.jsp"%>
<html>  
<head> 
<title>게시판</title>
<style type="text/css">
body {
    width: 100%;
    text-align : center;
}
table {
    margin: 0 auto;
}
</style>
<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap_display.css">
</head> 
 
<%
	System.out.println("content.jsp");
  	int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
  
	BoardDao dbPro = BoardDao.getIstance();
    BoardBean article =  dbPro.getArticle(num);  
 
    int ref=article.getRef();
    int re_step=article.getRe_step();
    int re_level=article.getRe_level();
   	System.out.println(num+","+ref+","+re_step+","+re_level);
%>

<body>  
<b>글내용 보기</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0"  
	align="center">  
		
  <tr height="30">
    <td align="center" width="125" >글번호</td>
    <td align="center" width="125">   <%=article.getNum()%></td>
    <td align="center" width="125">조회수</td>
    <td align="center" width="125">   <%=article.getReadcount()%></td>
  </tr>
  
  
  <tr height="30">
    <td align="center" width="125" >작성자</td>
    <td align="center" width="125">   <%=article.getWriter()%></td>
    <td align="center" width="125"  >작성일</td>
    <td align="center" width="125">   <%= sdf.format(article.getReg_date())%></td>
  </tr>
  
  
  <tr height="30">
    <td align="center" width="125">글제목</td>
    <td align="center" width="375" colspan="3"> <%=article.getSubject()%></td>
  </tr>
  <tr>
    <td align="center" width="125" >글내용</td>
    <td align="left" width="375" colspan="3"> <pre><%=article.getContent()%> 
    </pre></td>
  </tr>
  
  <tr height="30">      
    <td colspan="4"  align="right" > 
    
	  <input type="button" value="글수정" 
       onclick="document.location.href=
       'updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  
	  <input type="button" value="글삭제" 
       onclick="document.location.href=
       'deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
      
      <input type="button" value="답글쓰기" 
       onclick="document.location.href=
       'replyForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
      
       <input type="button" value="글목록" 
       onclick="document.location.href='List.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>    
</form>
</body>
</html>      
<%@include file="mall_bottom.jsp"%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "board.BoardDao" %>
<%@ page import = "board.BoardBean" %>
<%@include file="mall_top2.jsp"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<html> 
<head>
<title>게시판</title>
<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap_display.css">
<style type="text/css">
body{ 
	align:center;
	text-align: center;
}
</style>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
</head>

<%
	int num = Integer.parseInt(request.getParameter("num"));
  	String pageNum = request.getParameter("pageNum");
  
    BoardDao dbPro = BoardDao.getIstance();
    BoardBean article =  dbPro.updateGetArticle(num);
%>

<body>  
<center><b>글수정</b> </center>
<br>
<form method="post" name="writeform" action="updatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave();">
<table width="400" align="center">
  <tr>
    <td  width="70"   align="center">이 름</td>
    <td align="left" width="330">
       <input type="text" size="30" maxlength="10" name="writer" value="<%=article.getWriter()%>">
	   <input type="hidden" name="num" value="<%=article.getNum()%>"></td>
  </tr>
  <tr>
    <td  width="70"  align="center" >제 목</td>
    <td align="left" width="330">
       <input type="text" size="50" maxlength="50" name="subject" value="<%=article.getSubject()%>"></td>
  </tr>
  <tr>
    <td  width="70" align="center">Email</td>
    <td align="left" width="330">
       <input type="text" size="50" maxlength="30" name="email" value="<%=article.getEmail()%>"></td>
  </tr>
  <tr>
    <td  width="70"   align="center" >내 용</td>
    <td align="left" width="330">
     <textarea name="content" rows="13" cols="50"><%=article.getContent()%></textarea></td>
  </tr>
  <tr>
    <td  width="70"  align="center" >비밀번호</td>
    <td align="left" width="330" >
     <input type="password" size="10" maxlength="12" name="passwd">
     
	 </td>
  </tr>
  <tr>      
   <td colspan=2 align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='List.jsp?pageNum=<%=pageNum%>'">
   </td>
 </tr> 
 </table>
</form>
      
</body>
</html>      
<%@ include file="../display/mall_bottom.jsp" %>
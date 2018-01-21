<%@ page contentType = "text/html; charset=UTF-8" %>
<%@include file="mall_top2.jsp"%>
<%
  	int num = Integer.parseInt(request.getParameter("num"));
  	String pageNum = request.getParameter("pageNum");	
%>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap_display.css">
	
<script type="text/javascript">
    
  function deleteSave(){	
	if(document.delForm.passwd.value==''){
		alert("비밀번호를 입력하십시요.");
		document.delForm.passwd.focus();
		return false;
 	}
  }    
     
</script>
</head>

<body>
<center><b>글삭제</b></center>
<br>
<form method="POST" name="delForm"  action="deletePro.jsp?pageNum=<%=pageNum%>" 
   onsubmit="return deleteSave()"> 
   
 <table align="center"  width="360">
 
	  <tr height="30">
	     <td align=center>
	       <b>비밀번호를 입력해 주세요.</b></td>
	  </tr>

	  <tr height="30">
	     <td align=center >비밀번호 :   
	       <input type="password" name="passwd" size="8" maxlength="12">
		   <input type="hidden" name="num" value="<%=num%>"></td>
	 </tr>

	 <tr height="30">
	    <td align=center>
	      <input type="submit" value="글삭제" >
	      <input type="button" value="글목록" 
	       onclick="document.location.href='List.jsp?pageNum=<%=pageNum%>'">     
	   </td>
	 </tr>  
</table> 
</form>
</body>
</html> 
<%@ include file="mall_bottom.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href="../Resources/css/bootstrap.css">
<!--<link rel="stylesheet" type="text/css" href="style.css">-->

<style type="text/css">

form{
margin-top : 150px;

}
.table-bordered {
  border: 1px solid #ddd;
}


</style>



</head>
<body>
<form action ="loginPro.jsp" method = "post" >
<table height = 150 width = 300 align=center>

<tr>
<td class=table-bordered align="center">ID
<input type="text" name ="id" value="admin"></td>
</tr>


<tr>
<td class=table-bordered  align="center">PW
<input type="password" name ="password" value="1234"></td>
</tr>




<tr>
<td colspan=2 bgcolor="#ffe6e6" align = center >
<input type="submit" name ="login" value="로그인">
<input type="button" value="회원 가입" onclick="location.href ='<%=request.getContextPath()%>/myshop/member/register.jsp'">
<input type="button" value="ID찾기" onclick="location.href ='<%=request.getContextPath()%>/findid.jsp'">
<input type="button" value="PW찾기" onclick="location.href ='<%=request.getContextPath()%>/findpwd.jsp'">


</td>
</tr>



</table>

</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap.css">

<%
request.setCharacterEncoding("UTF-8");
	String context = request.getContextPath();
%>
   <%@ include file = "top.jsp"%>
<td colspan=6>
<form action="cate_input_proc.jsp" method="post" name="f">
	<table align=center>
		<caption>
			카테고리 등록<br> <br> <br>
		</caption>
		
		<tr>
			<td align=center>카테고리 이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="text" name="cname" maxlength=10 >
			</td>
		</tr>
<tr>
			<td align=center>카테고리 코드 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="text" name="code" maxlength=10 ><br><BR>
			</td>
		</tr>
		
		<Tr align=center>
			<Td colspan=2 ><input type="submit" value="등록"  >&nbsp;&nbsp; <input
				type="reset" value="취소"  ></Td>
		</Tr>

	</table>

</form>
</td>
<%@ include file = "bottom.jsp"%>
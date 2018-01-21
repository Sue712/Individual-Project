<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css">

<%
	String context = request.getContextPath();
%>
<form action="findid_proc.jsp" method="post" name="f">
	<table align=center>
		<caption>
			ID찾기<br> <br> <br>
		</caption>
		<tr>
			<td>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="text" name="name" maxlength=10 size=30>
			</td>
		</tr>

		<tr>
			<td>휴대전화 &nbsp;&nbsp;<select name="hp1">
					<option value="010" selected>010</option>
					<option value="011">011</option>
			</select>&nbsp;&nbsp;- <input type="text" name="hp2" maxlength=4 size=4>
				- <input type="text" name="hp3" maxlength=4 size=4><br>
				<Br><Br></td>
		</tr>

		<Tr align=center>
			<Td><input type="submit" value="ID찾기"> &nbsp;&nbsp; <input
				type="reset" value="취소"
				onclick="location.href ='<%=context%>/main.jsp'"></Td>
		</Tr>

	</table>



</form>
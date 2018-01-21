<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="mall_top2.jsp"%>
<%
	int num, ref, re_step , re_level;

	num = Integer.parseInt(request.getParameter("num"));
	ref = Integer.parseInt(request.getParameter("ref"));
	re_step = Integer.parseInt(request.getParameter("re_step"));
	re_level = Integer.parseInt(request.getParameter("re_level"));
	System.out.println(num +"/" + ref +"/"+ re_step +"/"+ re_level);
	
%>
<html>
<head>  
<title>게시판</title>
<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap_display.css">
	
	
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
body{
	align:center;
	text-align: center;
}
</style>
</head>

<body>
		<b>글쓰기</b> <br>
		<form method="post" name="writeform" action="replyPro.jsp" onsubmit="return writeSave()">
		
			<input type="hidden" name="num" value="<%=num%>"> 
			<input type="hidden" name="ref" value="<%=ref%>"> 
			<input type="hidden" name="re_step" value="<%=re_step%>"> 
			<input type="hidden" name="re_level" value="<%=re_level%>"> 	
	

			<table width="400" align="center">
				<tr>
					<td align="right" colspan="2" ><a
						href="List.jsp"> 글목록</a></td>
				</tr>
				<tr>
					<td width="70"  align="center">이 름</td>
					<td width="330" align="left">
					<input type="text" size="30" maxlength="10"	name="writer" ></td>
				</tr>
				<tr>
					<td width="70" align="center">제 목</td>
					<td width="330" align="left">
						<input type="text" size="50" maxlength="50" name="subject"	value="[답변]">    
					</td>
				</tr>
				<tr>
					<td width="70"  align="center">Email</td>
					<td width="330" align="left">
					<input type="text" size="50" maxlength="30"	name="email" ></td>
				</tr>
				<tr>
					<td width="70"  align="center">내 용</td>
					<td width="330" align="left">
						<textarea name="content" rows="13" cols="50"></textarea>
					</td>
				</tr>
				<tr>
					<td width="70" align="center">비밀번호</td>
					<td width="330" align="left">
						<input type="password" size="10" maxlength="12"	name="passwd" >
					</td>
				</tr>
				<tr>
					<td colspan=2  align="center">
						<input	type="submit" value="답글 쓰기"> 
						<input type="reset"	value="다시 작성"> 
						<input type="button" value="목록 보기"	OnClick="window.location='List.jsp'">
					</td>
				</tr>
			</table>			
		</form>
</body>
</html>
<%@include file="mall_bottom.jsp"%>
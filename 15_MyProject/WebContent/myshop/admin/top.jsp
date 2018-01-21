<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap.css">

<style>
body {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 1.42857143;
	color: #333;
}

table {
	border-collapse: collapse !important;
	text-align: center;
	margin: 0 auto;
	background-color: #f2e6ff;
}

table td, table th {
	background-color: #fff !important;
	border: 1px solid #ddd !important;
}

tr {
	width: 20;
}

h1 {
	orphans: 3;
	widows: 3;
}
</style>

<body>
	<h1>
		<font size=6 color="black"> 외국어 도서 사이트</font><br>
	</h1>
	<a href="main.jsp"><font size=3 color=green>쇼핑몰 홈</font></a> |
	<a href="<%=request.getContextPath()%>/main.jsp"><font color=green
		size=3>메인 홈</font></a> |
	<a href="<%=request.getContextPath()%>/logout.jsp"><font size=3
		color=red>로그아웃</font></a>
	<br>
	<Br>
	<panel>
	<table border=1 width=800 height=400>
		<tr height=40>

			<td align=center><a
				href="<%=request.getContextPath()%>/myshop/admin/cate_input.jsp">카테고리
					등록</a></td>

			<td align=center><a
				href="<%=request.getContextPath()%>/myshop/admin/cate_list.jsp">카테고리
					목록</a></td>

			<td align=center><a
				href="<%=request.getContextPath()%>/myshop/admin/prod_input.jsp">상품
					등록</a></td>

			<td align=center><a
				href="<%=request.getContextPath()%>/myshop/admin/prod_list.jsp">상품
					목록</a></td>

			<td align=center><a
				href="<%=request.getContextPath()%>/myshop/admin/shopping_list.jsp">쇼핑
					내역</a></td>

			<td align=center><a
				href="<%=request.getContextPath()%>/myshop/display/mall.jsp">사용자
					홈</a></td>
		</tr>
		</panel>
		<tr height=200>
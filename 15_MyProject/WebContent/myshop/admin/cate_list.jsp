<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@page import="my.shop.CategoryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap.css">
    <%
request.setCharacterEncoding("UTF-8");
%>
    
      <%@ include file = "top.jsp"%>

<td colspan =6>
<table class="table table-bordered" align=center>
<caption>카테고리 목록</caption>

<tr>
<td>번호</td>
<td>카테고리 코드</td>
<td>카테고리 명</td>
<td>삭제</td>
</tr>

<%
CategoryDao cdao = CategoryDao.getInstance();
ArrayList<CategoryDto> list =cdao.getCategoryAll();

if(list.size()==0){
	out.println("<tr><td colsapn=4 align='center'>데이터가 없습니다.");
}

for(int i =0; i<list.size(); i++){
	
	CategoryDto data = list.get(i);
	%>
	
	<tr>
	<td><%=data.getCnum()%></td>
	<td><%=data.getCode()%></td>
	<td><%=data.getCname()%></td>
	<td><a href ="cate_delete.jsp?cnum=<%=data.getCnum()%>">삭제</a></td>
	</tr>
	
	<% 
}
%>


</table>
</td>
   <%@ include file = "bottom.jsp"%>
   
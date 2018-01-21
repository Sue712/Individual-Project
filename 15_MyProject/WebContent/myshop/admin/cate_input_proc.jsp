<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="cdto" class="my.shop.CategoryDto"/>
<jsp:setProperty property="*" name="cdto"/>


<%
CategoryDao cdao = CategoryDao.getInstance();
System.out.println(cdto.getCode() + cdto.getCname());
int cnt = -1;
cnt = cdao.insertCategory(cdto);

String str="",url="";

if(cnt>0){
	str="등록 성공";
	
}else{
	str= "등록 실패";
}


%>

<script type="text/javascript">

alert("<%=str%>");
location.href="<%=request.getContextPath()%>" + "/myshop/admin/cate_input.jsp";
</script>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDa"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
%>


<% 
String pname =request.getParameter("pname");
System.out.println(pname);
ProductDa pdao=ProductDa.getInstance();

ArrayList<ProductBean> list= pdao.selectProd(pname.trim());

System.out.println(list.size());

if(list.size()!=0){
for(ProductBean bean : list){
	System.out.println(bean.getPnum());
	%>
	
	<Script type="text/javascript">
	location.href ="<%=request.getContextPath()%>" +"/myshop/display/mall_prodView.jsp?pnum="+<%=bean.getPnum()%> ;
	</Script>
	<%
		
 }
}else{
	%>
<script type="text/javascript">
alert("해당 상품이 없습니다.");
history.go(-1);
</script>
<%
}


%>
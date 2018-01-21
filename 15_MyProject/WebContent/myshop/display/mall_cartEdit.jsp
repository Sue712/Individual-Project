<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class = "mall.CartDao" scope = "session"/>

<%
String pnum = request.getParameter("pnum");
String oqty = request.getParameter("oqty");

try{
	
cart.setEdit(pnum, oqty);


%>


<script type ="text/javascript">

alert("수정되었습니다.");

</script>

<% 

response.sendRedirect("mall_cartList.jsp");
}catch(NumberFormatException e){
%>


<script type="text/javascript">

alert("숫자로 입력해야 합니다.");
history.back();
</script>
<%	
}%>
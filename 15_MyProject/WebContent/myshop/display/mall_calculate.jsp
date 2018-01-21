<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="my.shop.*"%>
    
<jsp:useBean id="order" class="mall.OrderDao" scope = "session"/>
<jsp:useBean id="cart" class="mall.CartDao" scope = "session"/>


<% 

String msg;
String url;

if(session.getAttribute("memno")==null){
	
	out.println("memno가 세션에 없어요.<br>");
}

int no = (Integer)(session.getAttribute("memno"));
String id = (String)session.getAttribute("memid");
System.out.println("mall_calculate.jsp의 세션no:" + no + "세션id:" + id);


Vector<ProductBean> cv = cart.getAllProducts();
int cnt =-1;
cnt = order.insertOrders(no, cv);


if(cnt!=-1){
	
	
	msg = "주문 완료했습니다.";
	url = request.getContextPath() + "/myshop/display/mall.jsp";
	
	cart.removeProduct();

%>

<script type="text/javascript">

alert("<%=msg%>");

var resp = confirm("계속하시겠습니까?");

if(resp){
	
	location.href = "<%=request.getContextPath()%>/myshop/display/mall.jsp";
}else{
	location.href = "<%=request.getContextPath()%>/logout.jsp";
	
}
</script>


<%

}else{
	msg="주문 실패";
	url = request.getContextPath() + "/myshop/display/mall.jsp";
	
}

%>

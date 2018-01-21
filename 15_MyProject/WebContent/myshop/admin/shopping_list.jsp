<%@page import="my.shop.*, mall.*"%>
<%@page import="java.util.Vector"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<jsp:useBean id="order" class="mall.OrderDao" scope="session"/>
	<jsp:useBean id="odto" class ="mall.OrderDto" />
	
	<%
	DecimalFormat df = new DecimalFormat("###,###");
	String memid = request.getParameter("memid") ; 
	System.out.println("memid:"+memid);
	
	Vector<OrderDto> lists = null ;
	if(memid != null){
		lists = order.getOrderList(memid) ;	
	}
	int list_total=0;
	%>
	   <%@ include file = "top.jsp"%>
	   
	   <td colspan =6>
	   <form name = "f" align=center action="shopping_list.jsp" method="post">
	   
	   <table>
	   
	   <tr rowspan =2 >
	   <td colspan =5>
	   
	   조회할 회원 아이디 입력 : <input type="text" name ="memid">&nbsp; <input type="submit"  value ="내역조회" >
	   </td></tr>
	   
	   
	   <tr>
	   <td>고객명</td>
	   <td>아이디</td>
	   <td>상품명</td>
	   <td>수량</td>
	   <td>금액</td>
	   </tr>
	   
	   
	   <%
	   if(lists!=null){
	   for(int i=0; i<lists.size(); i++){
		   OrderDto bean =lists.get(i);
		   %>
		   <tr>
		   <td><%=bean.getMname()%></td>
		   <td><%=bean.getMemId()%></td>
		   <td><%=bean.getPname()%></td>
		   <td><%=bean.getQty()%></td>
		   <td>￦<%=df.format(bean.getAmount())%></td>
		   
		   </tr>
		   <%
		   
		   list_total +=bean.getAmount();
	   }
	   }
	   
	   %>
	   
	   <tr>
		<td colspan=4 align="center">총 합</td>
		<td align="right">￦<%=df.format(list_total)%></td>
	</tr>
	   
	   </table>
	   
	   
	   
	   
	   </form>
	   
	   </td>
	   
	      <%@ include file = "bottom.jsp"%>
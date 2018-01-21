<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.shop.*"%>
    
<% 

String pnum = request.getParameter("pnum");



%>

    <jsp:useBean id="cart" class="mall.CartDao" scope="session"/>
<%
cart.removeProduct(pnum.trim());
response.sendRedirect("mall_cartList.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="my.shop.*, java.util.*,java.text.*" %>
<%@page import="mall.CartDao"%>
    
    <jsp:useBean id="cart" class="mall.CartDao" scope ="session"/>
    
   <%  
	String pnum=request.getParameter("pnum");
	String oqty=request.getParameter("oqty"); // 상품갯수

	System.out.println("상품번호 / 갯수:" + pnum+"/"+oqty);
	
	
	if(pnum==null || oqty==null || oqty == "" || Integer.parseInt(oqty) < 1 ){
		response.sendRedirect("mall.jsp"); 
		return; 				
	}

	
	ProductBean bean ; 
	ProductDa pdao = ProductDa.getInstance();
	bean = pdao.selectByPnum(pnum);
	
	if(bean.getPqty() < Integer.parseInt(oqty.trim())){
%>
		<script type="text/javascript">
			alert("수량 초과");
			location.href = "mall.jsp";
		</script>
		
	<%
			return;
	}

	pnum=pnum.trim();
	oqty=oqty.trim();
	
	cart.addProduct(pnum, oqty); 
	response.sendRedirect("mall_cartList.jsp");
	
%>


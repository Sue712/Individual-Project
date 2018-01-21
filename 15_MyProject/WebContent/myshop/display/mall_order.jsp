<%@page import="java.util.Vector"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="my.shop.*,java.text.*,java.util.*,mall.*"%>
    
    
    <%
    
    request.setCharacterEncoding("UTF-8");
    %>
<style type="text/css">
table {
	border-collapse: collapse;
	border-spacing: 0;
	display: table;
	border-collapse: separate;
	border-spacing: 2px;
	border-color: grey;
}

.table-striped>tbody>tr:nth-of-type(odd) {
	background-color: #f9f9f9;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

.table-hover>tbody>tr:hover {
	background-color: #f5f5f5;
}

.danger {
	color: #b94a48;
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

.table-warning, .table-warning > th, .table-warning > td {
    background-color: #e3cbe4;
}
</style>
    
    
    
<%@ include file ="mall_top.jsp"%>


<%

if(memid.equals("admin")){
	
	%>
	
	
	<script type="text/javascript">
	
	alert("관리자는 주문할 수 없습니다.");
	history.back();
	
	</script>
	
	<%
	
}
%>

<jsp:useBean id="cart" class="mall.CartDao" scope="session"/>

<table width = 90% class="outline" align=center >

<tr>
<td colspan=6 align= center class="table-warning"><h4>결제 내역서 보기</h4></td>
</tr>

<tr class="danger">
<th width = "40%">상품명</th>
<th width = "20%">수량</th>
<th width = "40%">금액
</th> 
</tr>
<Tr rowspan=2></Tr>
<%

String pnum = request.getParameter("pnum");
String oqty = request.getParameter("oqty");

System.out.println("상품번호 /수량 = " + pnum +"/" +oqty);

//상세보기에서 넘어왔으면
if(!pnum.equals("00")&& !oqty.equals("00")){
	
	if(pnum==null || pnum.trim().equals("")|| oqty==null||oqty.trim().equals("")||Integer.parseInt(oqty)<1){
		
	response.sendRedirect("mall.jsp");
	return;
		
	}
	
	pnum = pnum.trim();
	oqty = oqty.trim();
	
	 cart.addProduct(pnum, oqty);
}


DecimalFormat df  = new DecimalFormat("###,###");
int totalPrice=0;
Vector<ProductBean> cv = cart.getAllProducts(); //장바구니의 모든 상품을 반환

for(ProductBean pd : cv){
	%>
	
	<tr>
	<td align="center"><%=pd.getPname()%></td>
	<td align="right"><%=pd.getPqty()%>개</td>
	<td align="right"><%=df.format(pd.getTotalPrice())%>원</td>
	
	
	</tr>

	<%
	totalPrice +=pd.getTotalPrice();
}
 %>

<Tr></Tr>

<hr />
<tr class = m1>

<td colspan =3 rowspan=3 align=center><b>결제하실 총액은</b>:
<font color=red><%=df.format(totalPrice) %>원</font>
</td>
</tr>
</table>
<br><Br>
<input type="button" value='결제하기' onclick="location.href ='<%=request.getContextPath()%>/myshop/display/mall_calculate.jsp'">
 
<%@include file ="mall_bottom.jsp"%>



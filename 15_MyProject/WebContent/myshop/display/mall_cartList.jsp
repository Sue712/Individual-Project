<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "mall_top.jsp"%>

 <jsp:useBean id="cart" class = "mall.CartDao" scope ="session"/>
 
 
<style type="text/css">
.bs-component {
	position: relative;
}

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


    
.alert-danger {
    background-color: #f2dede;
    border-color: #eed3d7;
    color: black;
}

.alert-dismissable, .alert-dismissible {
    padding-right: 35px;
}


.alert {
    padding: 15px;
    margin-bottom: 18px;
    border: 1px solid transparent;
    border-radius: 4px;
}


.btn {
    display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 1px solid transparent;
    padding: 0.375rem 0.75rem;
    font-size: 0.8125rem;
    line-height: 1.5;
    border-radius: 0.25rem;
    -webkit-transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    -o-transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
}
.btn-outline-danger {
    color: #D9831F;
    background-color: transparent;
    background-image: none;
    border-color: #D9831F;
}
 .btn-outline-info {
    color: #029ACF;
    background-color: transparent;
    background-image: none;
    border-color: #029ACF;
}

button, select {
    text-transform: none;
}
bootstrap.css:340
button, input {
    overflow: visible;
}
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}


.btn-secondary:focus, .btn-secondary:not([disabled]):not(.disabled):active, .btn-secondary:not([disabled]):not(.disabled).active {
    -webkit-box-shadow: 0 0 0 0.2rem rgba(221, 221, 221, 0.5);
    box-shadow: 0 0 0 0.2rem rgba(221, 221, 221, 0.5);
}
bootstrap.css:2691
.btn-secondary:focus, .btn-secondary.focus {
    -webkit-box-shadow: 0 0 0 0.2rem rgba(255, 255, 255, 0.5);
    box-shadow: 0 0 0 0.2rem rgba(255, 255, 255, 0.5);
}

</style>

<script type="text/javascript">

	function goCart(pnum){
		document.f.action
		="<%=request.getContextPath()%>/myshop/display/mall_cartAdd.jsp?pnum="+pnum;
		document.f.submit();	
	}   
	
	function goOrder(pnum){
		document.f.action
		="<%=request.getContextPath()%>/myshop/display/mall_order.jsp?pnum="+pnum;
		document.f.submit();
	}
	
</script>


 <div class="bs-component">
 <table  class="table table-striped table-hover "  width = 100%  align= center>
 
 <tr class="danger">
 <td colspan = 6 align = center>
 <h4>장바구니 보기</h4>
 </td>
 </tr>
 
 
 <tr>
 <th width = "10%">번호 </th>
 <th width = "25%">상품평 </th>
 <th width = "15%">수량</th>
 <th width = "20%">단가 </th>
 <th width = "20%">금액 </th>
 <th width = "10%">삭제 </th>
 </tr>
 
 
 <%
 DecimalFormat df = new DecimalFormat("###,###");
 int cartTotalPrice = 0; //장바구니의 총액
 int cartTotalPoint = 0; //누적 포인트
 
 
 //카트빈으로부터 장바구니 모든 상품 가져오기
 Vector<ProductBean> cv = cart.getAllProducts();
 System.out.println("getAllProducts() : " + cv.size());
 
 
 if(cv.size()==0){
	 out.println("<tr><td colspan=6 align=center><b>");
	 out.println("선택된 상품이 없어요.");
	 out.println("</b></td></tr></table>");
	 
 }else{
	 for(ProductBean bean :cv){
		 
	 System.out.println("cv");
	String imgpath = request.getContextPath() + "/myshop/images/"+bean.getPimage();
	 
 %>
  
 <tr >
 
 <td align=center><%=bean.getPnum() %></td>
 
 <td  align=center><img src ="<%=imgpath%>" width = 40 height =40><br><%=bean.getPname()%></td>
 
 
 <td align=center>
 
 <form name = "f" method= "post" action = "mall_cartEdit.jsp">
 <input type="text" size ="1" name ="oqty" value ="<%=bean.getPqty()%>">개
 <input type="hidden" name ="pnum" value ="<%=bean.getPnum()%>">
 <input type="submit"  value ="수정">
 </form>
 </td>
 
 <td align=right>
 
 <b>
 
 <%=df.format(bean.getPrice())%>원<br>
 <%=df.format(bean.getPoint())%>point
 
 </b>
 </td>
 
 
 
 <td align=right>
<font color=red> 
<B>장바구니 총액 :<%=df.format(bean.getTotalPrice())%>원 <br>
[<%=bean.getTotalPoint()%>]point
</B>
</font>
</td>


 <td align=center>
 <button type="button" class="btn btn-secondary"> <a href ="mall_cartDel.jsp?pnum=<%=bean.getPnum()%>">삭제</a></button>

 </td>
 </tr>
 
 <%
 cartTotalPrice +=bean.getTotalPrice();
 cartTotalPoint +=bean.getTotalPoint();
	 }
 %>
 
 
 
 <Tr>
 <td colspan=4><b>장바구니 총액</b> :
 <font color = red>
 
 <%=df.format(cartTotalPrice)%>원<br>
 
 </font>
 
 <font color =green>
 총 적립 포인트 : [<%=df.format(cartTotalPoint)%>] point
 </font>
 
 </td>
 
	<td align= center>
				<a href="mall_order.jsp?pnum=00&oqty=00;" class="btn-outline-danger">
				주문
				</a>
			</td>
			<td align= center>
				<a href="mall.jsp;"  class="btn-outline-info">
				쇼핑
				</a>
			</td>
 </Tr>

 </table>
 </div>
	
 <%
	
	 } %>
<%@include file ="mall_bottom.jsp"%>
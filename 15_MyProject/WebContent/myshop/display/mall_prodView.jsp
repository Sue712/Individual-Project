<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.shop.*, java.text.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- mall_prodView.jsp -->
    
<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap_display.css">
	
	
	<%@include file="mall_top.jsp"%>

	<style type="text/css">
    
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

.btn-success {
    background-image: -webkit-linear-gradient(#4da309, #469408 6%, #3f8507);
    background-image: -o-linear-gradient(#4da309, #469408 6%, #3f8507);
    background-image: -webkit-gradient(linear, left top, left bottom, from(#4da309), color-stop(6%, #469408), to(#3f8507));
    background-image: linear-gradient(#4da309, #469408 6%, #3f8507);
    background-repeat: no-repeat;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff4da309', endColorstr='#ff3f8507', GradientType=0);
    -webkit-filter: none;
    filter: none;
    border: 1px solid #2f6405;
        color: #ffffff;
    background-color: #469408;
    
}


.btn-danger {
    background-image: -webkit-linear-gradient(#e08b27, #d9831f 6%, #cc7b1d);
    background-image: -o-linear-gradient(#e08b27, #d9831f 6%, #cc7b1d);
    background-image: -webkit-gradient(linear, left top, left bottom, from(#e08b27), color-stop(6%, #d9831f), to(#cc7b1d));
    background-image: linear-gradient(#e08b27, #d9831f 6%, #cc7b1d);
    background-repeat: no-repeat;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffe08b27', endColorstr='#ffcc7b1d', GradientType=0);
    -webkit-filter: none;
    filter: none;
    border: 1px solid #ac6819;
        color: #ffffff;
    background-color: #d9831f;
}
.btn {
    font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
     display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    padding: 8px 12px;
    font-size: 13px;
    line-height: 1.42857143;
    border-radius: 4px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
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
<% 
	String pnum=request.getParameter("pnum");
	System.out.println("하하");
	ProductDa pdao = ProductDa.getInstance();
	my.shop.ProductBean bean = pdao.selectByPnum(pnum);  
	
	DecimalFormat df=new DecimalFormat("###,###");
	
	if(bean==null){
		out.println("<b>["+pnum+"]해당 상품 정보가 없어요</b>");
	} 
%>

<br><br>
<%
	String pimage=bean.getPimage();
	String imgpath=request.getContextPath()+"/myshop/images/"+pimage; 
%>
<table width=100% border=0 class=outline>
<tr class="m1">
	<td colspan=2 align=center><div class="alert alert-dismissible alert-danger">
		<b>[<%=bean.getPname()%>] 상품 정보</b></div>
		</font>
	</td>
</tr>
<tr>
	<td align=center class=m3>
		<img src="<%=imgpath%>" width=200 height=300>
	</td>
	
	<td class=m3>
	
	<form name="f" method="POST"> 
	
	상품번호: <%=pnum%> <br>
	상품이름: <%=bean.getPname()%> <br>
	상품가격: <font color=red><b>
				<%=df.format(bean.getPrice())%></b></font>원    
	<br>
	상품포인트:<font color=red><b>
			[<%=bean.getPoint()%>]
			</b></font> point<br>
	상품갯수: 
	<input type=text name="oqty" size=2 value="1">개<br>	
	<BR>
	<hr>
		<b>상품 상세 설명</b><br>
		<%=bean.getPcontents()%>

<br><br><br><br>
	<table border=0 width=90% align=center> 
		<tr>
			<td>
				<a href="javascript:goCart('<%=pnum%>');" class="btn btn-success">
				장바구니 담기
				</a>
			</td>
			<td>
				<a href="javascript:goOrder('<%=pnum%>');"  class="btn btn-danger">
				즉시 구매하기
				</a>
			</td>
		</tr>
	</table>
	</form>
	</td>
</tr>

</table>

<%@ include file="mall_bottom.jsp" %> 




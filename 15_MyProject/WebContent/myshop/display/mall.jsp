<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDa"%>

<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap_display.css">



	<%@include file="mall_top.jsp"%>
<Br>

<%
	ProductDa pdao = ProductDa.getInstance();

	DecimalFormat df = new DecimalFormat("###,###");

	String[] spec = { "HOT",  "BEST","NEW", "USED" };
	for (int i = 0; i < spec.length; i++) {
		ArrayList<ProductBean> list = pdao.selectByPspec(spec[i]);
%>

<font color=red size=3><strong><%=spec[i]%></strong></font>
<hr color=PINK width=80%>


<%
	if (list.size() == 0) {
			out.println("<b>" + spec[i] + "상품이 없습니다.</b><br><br><br><br>");
		} else {
%>


<br>
<table width=100% border=0 align=center>
	<tr>
		<%
			int count = 0;
					for (ProductBean bean : list) {
						count++;

						String pimage = bean.getPimage();
						int pnum = bean.getPnum();
						String pname = bean.getPname();
						int price = bean.getPrice();
						int point = bean.getPoint();

						String imgpath = request.getContextPath() + "/myshop/images/" + bean.getPimage();
		%>


		<td align=center><a href="mall_prodView.jsp?pnum=<%=pnum%>"><img
				src="<%=imgpath%>" width=80 height=60 border=0> </a><br> <%=pname%><br>

			<font color=red><%=df.format(price)%></font>원<br> <font
			color=blue>[<%=point%>]
		</font>point</td>

		<%
			if (count % 3 == 0) {
							out.println("</tr><tr>");//한 테이블에 두줄 만들어줌
						}
					}
		%>
	</tr>
</table>
<%
	}
	}
%>


<%@include file="mall_bottom.jsp"%>
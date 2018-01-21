<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.shop.*"%>

<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap.css">
<%@ include file="top.jsp" %>   

<%    
	String pnum=request.getParameter("pnum");
	
	ProductDa pdao = ProductDa.getInstance();
	ProductBean pdto = pdao.selectByPnum(pnum); 
%>
<td  align=center valign=top colspan=6>
<form name="f" action="prod_list.jsp" method="post"> 
<table border=0 class=outline width=600>
<caption align="top"><br>상품상세보기<br><Br></caption>
	<tr>
		<th width ="15%" class="m2">카테고리</th>
		<td width ="35%" align=left><b><%=pdto.getPcategory_fk()%></b>	</td>
		<th width ="15%" class="m2">상품번호</th>
		<td width ="35%" align=left><b><%=pdto.getPnum()%></b></td>
	</tr>
	<tr>
		<th class="m2">상품명</th>
		<td align=left><b><%=pdto.getPname()%></b></td>
		<th class="m2">제조회사</th>
		<td align=left><b><%=pdto.getPpublisher()%></b></td>
	</tr>
	<tr>
		<th class="m2">상품이미지</th>
		<td colspan =3 align=center>
			<%
				String imgpath = "/myshop/images/" + pdto.getPimage() ;
				String pimage=request.getContextPath()+imgpath; 
			%>
				<img src="<%=pimage%>" width=100 height=100>
		</td>
	</tr>
	<tr>
		<th class="m2">상품 수량</th>
		<td align=left><b><%=pdto.getPqty()%></b></td>
		<th class="m2">상품 가격</th>
		<td align=left><b><%=pdto.getPrice()%></b></td>
	</tr>
	<tr>
		<th class="m2">상품 스펙</th>
		<td align=left><b><%=pdto.getPspec()%></b></td>
		<th class="m2">상품 포인트</th>
		<td align=left><b><%=pdto.getPoint()%></b></td>
	</tr>
	<tr>
		<th class="m2">상품 소개</th>
		<td colspan=3 align=left>
		<textarea name="pcontents" style="resize:none"
			 rows=5 cols=50 disabled><%=pdto.getPcontents()%></textarea>
		</td>
	</tr>
	<tr>
	</tr>
	<tr>	
		<td colspan=4 class="m1" align="center">
		<input type=submit value="돌아가기">
		</td>
	</tr>
</table>
</form>
</td>
<%@ include file="bottom.jsp" %>  

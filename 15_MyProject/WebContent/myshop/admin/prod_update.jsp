<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.shop.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap.css">
<%@ include file="top.jsp"%>
<td colspan=6 align=center valign=top>
<jsp:useBean id="product" class = "my.shop.ProductBean"/>
		<%
		String pnum = request.getParameter("pnum");
		ProductDa pdao = ProductDa.getInstance();
		
	product  = pdao.selectByPnum(pnum); 
  	
  if(product==null){ 
	  %>
  		<script type="text/javascript">
  		
  		alert("<%=pnum%>번에 해당하는 상품이 없어요");
  		history.back(); 
  		</script>
			<% 
			return;
			}//for---------
				%>	
				
<form name="f" action="prod_update_proc.jsp" method="POST" enctype="multipart/form-data">
<table border=0 class=outline width="600">
<CAPTION ALIGN="TOP">상품 수정</CAPTION>
	<tr>
		<th class="m2">카테고리</th>
		<td align=left>
		<input type="text" name = "pcategory_fk" value="<%=product.getPcategory_fk()%>" readonly = "readonly">
		<%-- <input type="hidden" name = "pcategory_fk" value="<%=product.getPcategory_fk()%>"> --%>
		</td>
	<tr>
		<th class="m2">상품번호</th>
		<td align=left><b><%=product.getPnum()%></b>
		<input type=hidden name="pnum" value="<%=product.getPnum()%>" >
		</td>
	</tr>
	
	<tr>
		<th class="m2">상품명</th>
		<td align=left>
		<input type=text name="pname" value="<%=product.getPname()%>" >
		</td>
	</tr>
	
		<tr>
		<th class="m2">제조회사</th>
		<td align=left>
		<input type=text name="ppublisher" value="<%=product.getPpublisher()%>">
		</td>
	</tr>
	
	

	<tr>
		<th class="m2">상품이미지</th>
		<td align=left>
		
		<%
		
		String pimage = request.getContextPath() +"/myshop/images";
		%>
		<img src ="<%=pimage%>/<%=product.getPimage()%>" width = 100 height=100>
		<input type=file name="pimage"><!--새 이미지  -->
		
		<input type=hidden name="pimage2" value="<%=product.getPimage()%>"><!--이전 이미지  -->
		
		
		</td>
	</tr>
	<tr>
		<th class="m2">상품 수량</th>
		<td align=left>
		<input type=text name="pqty" maxlength=8 value="3" value="<%=product.getPqty()%>">
		</td>
	</tr>
	<tr>
		<th class="m2">상품 가격</th>
		<td align=left>
		<input type=text name="price" maxlength=8  value="<%=product.getPrice()%>">
		</td>
	</tr>
	<tr>
		<th class="m2">상품 스펙</th>
		<td align=left>
			<select name="pspec">
		
			<option value="HOT" <%if((product.getPspec()).equals("HOT")){%>  SELECTED <%}%>>::HOT::</option>
				<option value="BEST" <%if((product.getPspec()).equals("BEST")){%>  SELECTED <%}%>>BEST</option>
			<option value="NEW" <%if((product.getPspec()).equals("NEW")){%>  SELECTED <%}%>>NEW</option>
						<option value="USED" <%if((product.getPspec()).equals("USED")){%>  SELECTED <%}%>>USED</option>
			</select>
		</td>
	</tr>
	<tr>
		<th class="m2">상품 소개</th>
		<td align=left>
		<textarea name="pcontents" rows=5 cols=50 style="resize: none;"><%=product.getPcontents()%></textarea>
		</td>
	</tr>
	<tr>
		<th class="m2">상품 포인트</th>
		<td align=left><input type=text name="point" value="<%=product.getPoint()%>"></td>
	</tr>
	<tr>	
		<td colspan=2 class="m1" align="center">
		<input type=submit value="수정">
		<input type=reset value="취 소">
		</td>
	</tr>
</table>
</form>
</td>
<%@ include file="bottom.jsp"%>





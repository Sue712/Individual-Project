<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.shop.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap.css"> 
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ include file="top.jsp"%>
<td colspan=6 align=center>

<form name="f" action="prod_input_proc.jsp" method="POST" enctype="multipart/form-data">
<table border=0 class=outline width="600">
<CAPTION ALIGN="TOP">상품등록카테고리</CAPTION>
	<tr>
		<th class="m2">카테고리</th>
		<td align=left>
		
		<!-- 카테고리 목록 가져오기---------- -->		
		<select name="pcategory_fk"> <!-- pcategory_fk = man or woman -->
		<%
		CategoryDao cdao = CategoryDao.getInstance();
		java.util.ArrayList<CategoryDto> arr = cdao.getCategoryAll()
				;
		if(arr.size()==0){  
		%>
			<option value="">카테고리 없음</option>
		<%
		}else{
			for(CategoryDto cate : arr){
				String cname=cate.getCname(); 
				String code=cate.getCode(); 
			%>
			<option value="<%=code%>">
				<%=cname%> [<%=code%>]
			</option>
			<% 
			}//for---------
		}
		%>	
		</select>
		<!-- -------------------------------- -->
		</td>
	</tr>
	
	<tr>
		<th class="m2">상품명</th>
		<td align=left>
		<input type=text name="pname">
		</td>
	</tr>
	
	<tr>
		<th class="m2">상품코드</th>
		<td align=left>
		<input type=text name="pcode" > <!-- pcode = gray -->
		<!-- pcode는 bean에도 없고, 테이블에도 없다.
		카테고리 코드(code)와 pcode에 작성하는 내용을 더해서 pcategory_fk에 넣을것이다. -->
		</td>
	</tr>
	
	<tr>
		<th class="m2">제조회사</th>
		<td align=left>
		<input type=text name="ppublisher">
		</td>
	</tr>
	<tr>
		<th class="m2">상품이미지</th>
		<td align=left>
		<input type=file name="pimage"> <!-- pimage = "Koala.jpg" -->
		</td>
	</tr>
	<tr>
		<th class="m2">상품 수량</th>
		<td align=left>
		<input type=text name="pqty" maxlength=8 value="3">
		</td>
	</tr>
	<tr>
		<th class="m2">상품 가격</th>
		<td align=left>
		<input type=text name="price" maxlength=8 value="100">
		</td>
	</tr>
	<tr>
		<th class="m2">상품 스펙</th>
		<td align=left>
			<select name="pspec">
				<option value="HOT" SELECTED>HOT</option>
				<option value="BEST">BEST</option>
				<option value="NEW">NEW</option>
			<option value="USED">USED</option>
			
		
			</select>
		</td>
	</tr>
	<tr>
		<th class="m2">상품 소개</th>
		<td align=left>
		<textarea name="pcontents" rows=5 cols=50 style="resize: none;">설명</textarea>
		</td>
	</tr>
	<tr>
		<th class="m2">상품 포인트</th>
		<td align=left><input type=text name="point" value="222"></td>
	</tr>
	<tr>	
		<td colspan=2  align="center">
		<input type=submit value="상품 등록">
		<input type=reset value="취 소">
		</td>
	</tr>
</table>
</form>
</td>
<%@ include file="bottom.jsp"%>





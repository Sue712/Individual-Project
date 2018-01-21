<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,my.shop.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap.css">
<script type="text/javascript">
	function checkDel(pnum, pimage) {
		var isdel = window.confirm("정말 삭제하시겠습니까?");
		if (isdel) {
			location.href = "prod_delete.jsp?pnum=" + pnum + "&pimage="
					+ pimage;
		}
	}
</script>
<%@ include file="top.jsp"%>
<td colspan=6 align=center valign=top>
	<table width=99% border=0 class=outline>
		<CAPTION ALIGN="TOP">상품목록</CAPTION>
		<tr class=m2>
			<th>번호</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>이미지</th>
			<th>가격</th>
			<th>제조사</th>
			<th>수량</th>
			<th>수정|삭제</th>
		</tr>

		<%
			ProductDa pdao = ProductDa.getInstance();
			ArrayList<ProductBean> lst = pdao.productAll();

			if (lst.size() == 0) {
				out.println("<tr><td colspan=8>");
				out.println("데이터가 없습니다.");
			} //if---------

			for (ProductBean prod : lst) {
		%>
		<tr>
			<td><%=prod.getPnum()%></td>
			<td align="center"><%=prod.getPcategory_fk()%></td>
			<td align="center"><%=prod.getPname()%></td>
			<td align="center">
				<%
					String imgpath = request.getContextPath() + "/myshop/images/" + prod.getPimage();
						System.out.println("imgpath:" + imgpath);
				%> 
				<a href="prod_view.jsp?pnum=<%=prod.getPnum()%>"> <img
					src="<%=imgpath%>" border=0 width=40 height=40>
			</a>
			</td>
			<td align=right><%=prod.getPrice()%></td>
		<td align=center><%=prod.getPpublisher()%></td>
			<td align=right><%=prod.getPqty()%></td>
			
			<td align=center><a
				href="prod_update.jsp?pnum=<%=prod.getPnum()%>">수정</a>| <a
				href="javascript:checkDel('<%=prod.getPnum()%>','<%=prod.getPimage()%>');">삭제</a>
			</td>
		</tr>
		<%
			} //for-----------------
		%>

	</table>
</td>
<%@ include file="bottom.jsp"%>



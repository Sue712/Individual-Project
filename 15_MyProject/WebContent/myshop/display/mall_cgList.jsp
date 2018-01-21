<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="my.shop.*, java.util.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="mall_top.jsp" %>       		 

<h3>Welcome to My Mall</h3>
<% 
	ProductDa pdao = ProductDa.getInstance();

	String code=request.getParameter("code"); // 카테고리코드
	String cgname=request.getParameter("cgname"); // 카테고리명
	System.out.println(code +","+cgname); // man, 남성복
	
	DecimalFormat df=new DecimalFormat("###,###");
	%>
	
	<hr color=green width=80%>
	<font color=red size=3><strong><%=cgname %></strong></font>
	<hr color=green width=80%>
	
	<%
	ArrayList<ProductBean> lists = pdao.selectByCategory(code);
	
	if(lists.size()==0){ 
		out.println("<B>"+cgname+"상품 없습니다.</B>");		
		
	}else{
		
	%>
	
	<br>
	<table width=100% border=0 align=center>
	<tr>
	<% int count=0; 
		for(ProductBean bean : lists){
			count++;
			String pimage=bean.getPimage();
			int pnum=bean.getPnum();
			String pname=bean.getPname();
			int price=bean.getPrice();
			int point=bean.getPoint();	
			
			String imgpath=request.getContextPath()+"/myshop/images/"+pimage; 
	%>	
		<td align=center>
		
			<a href="mall_prodView.jsp?pnum=<%=pnum%>">
				<img src="<%=imgpath%>"	 width=130 height=130 border=0>
			</a> <br>
			<%=pname%><br>
			<font color=red><%=df.format(price)%></font>원<br>
			<font color=blue>[<%=point%>]</font>point
		</td>	
	<%
		if(count%3==0){//3개 단위로 보여주기 위해
			out.println("</tr><tr>");
		}//if-------
		
		}//for---------------
	%>
		</tr>
		</table>
	<%	
	}
%> 
<%@ include file="mall_bottom.jsp" %>



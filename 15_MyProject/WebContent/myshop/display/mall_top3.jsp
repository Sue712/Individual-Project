<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap_display.css">
	
	<style type="text/css">

user agent stylesheet
input {
    -webkit-appearance: textfield;
    background-color: white;
    -webkit-rtl-ordering: logical;
    user-select: text;
    cursor: auto;
    padding: 1px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
user agent stylesheet
input, textarea, select, button {
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    margin: 0em;
    font: 13.3333px Arial;
}

user agent stylesheet
input, textarea, select, button, meter, progress {
    -webkit-writing-mode: horizontal-tb;
}

	
	
input, button, select, textarea {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
bootstrap.css:151
input {
    line-height: normal;
}
bootstrap.css:123
button, input, optgroup, select, textarea 
{
    color: inherit;
    font: inherit;
    margin: 0;
}
.badge-light {
    color: #111;
    background-color: #e9ecef;
}
bootstrap.css:4922
.badge {
    display: inline-block;
    padding: 0.25em 0.4em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: 0.25rem;
}
bootstrap.css:106
*, *::before, *::after {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

	</style>
<%
	String contextPath = request.getContextPath();
	String memid = (String) session.getAttribute("memid");
	System.out.println("memid:" + memid);
%>

<table width=770px align=center >

 <form class="navbar-form navbar-left" role="search" method="post" action="searchProd.jsp"> 
      
        <div class="form-group">
        
          <input type="text" class="form-control" placeholder="Search" name="pname" value="교재명">
        <button type="submit" class="btn btn-default" >검색</button><br><Br>
       </div>
       
				</form>

	<tr height=50>
		<td colspan=3 align=center>
			<nav class="navbar navbar-default">
				<div class="container-fluid">

					<a class="navbar-brand" href="<%=contextPath%>/main.jsp">HOME</a> <a
						href="<%=contextPath%>/myshop/display/mall.jsp">쇼핑몰 홈 <span
						class="sr-only"></span></a> <a
						href="<%=contextPath%>/myshop/display/mall_cartList.jsp">장바구니</a>
					<a href="<%=contextPath%>/myshop/board/List.jsp">게시판</a> <a
						href="<%=contextPath%>/myshop/display/company.jsp">회사소개</a>
						
						
						<div align=right>		
						
						<span class="badge badge-light" align =right><%=memid%>님</span>				  	
		<a align =right  href="<%=contextPath%>/logout.jsp"><img src="<%=contextPath%>/myshop/images/logout1.jpg" width=50 height=20>
		</a>		
		</div>
		
				</div>
			</nav>
		</td>


	
     </tr>
 
     




<tr height= 400>
<td width = 150px align = center valign = top>
<table width =100%  align =left>

<tr>
<td>
<a href = "<%=contextPath%>/myshop/display/ceo.jsp">CEO 인사말</a>
</td>
</tr>

<tr>
<td><a href = "<%=contextPath%>/myshop/display/history.jsp">
회사 연혁</a></td>
</tr>



</table>




</td>

<td width=590px align=center>




	
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

	
<link rel="stylesheet" type="text/css"
	href="../Resources/css/bootstrap_display.css">
	
    <style type="text/css">
   .bg-dark {
    background-color: #F3969A !important;
}
bootstrap.css:9257
.navbar {
    font-family: "Montserrat", -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
}
bootstrap.css:6340
.bg-dark {
    background-color: #343a40 !important;
}
bootstrap.css:4018
.navbar {
    position: relative;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex-wrap: wrap;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding: 0.5rem 1rem;
}
bootstrap.css:125
article, aside, dialog, figcaption, figure, footer, header, hgroup, main, nav, section {
    display: block;
}
bootstrap.css:107
*, *::before, *::after {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
 .navbar-brand {
    display: inline-block;
    padding-top: 0.3125rem;
    padding-bottom: 0.3125rem;
    margin-right: 1rem;
    font-size: 1.25rem;
    line-height: inherit;
    white-space: nowrap;
}
.mb-2, .my-2 {
    margin-bottom: 0.5rem !important;
}
bootstrap.css:7808
.mt-2, .my-2 {
    margin-top: 0.5rem !important;
}
bootstrap.css:2488
.form-inline {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex-flow: row wrap;
    -ms-flex-flow: row wrap;
    flex-flow: row wrap;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
}
bootstrap.css:107
*, *::before, *::after {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
user agent stylesheet
form {
    display: block;
    margin-top: 0em;
}

@media (min-width: 576px)
bootstrap.css:8114
.mr-sm-2, .mx-sm-2 {
    margin-right: 0.5rem !important;
}
bootstrap.css:2139
.form-control {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    color: #5a5a5a;
    background-color: #fff;
    background-image: none;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.4rem;
    -webkit-transition: border-color ease-in-out 0.15s, -webkit-box-shadow ease-in-out 0.15s;
    transition: border-color ease-in-out 0.15s, -webkit-box-shadow ease-in-out 0.15s;
    -o-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
    transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
    transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s, -webkit-box-shadow ease-in-out 0.15s;
}
bootstrap.css:340
button, input {
    overflow: visible;
}
bootstrap.css:332
input, button, select, optgroup, textarea {
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
bootstrap.css:107
*, *::before, *::after {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.btn, .btn:hover {
    color: #fff;
}
bootstrap.css:9269
.btn {
    font-family: "Montserrat", -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
}
@media (min-width: 576px)
bootstrap.css:8080
.mb-sm-0, .my-sm-0 {
    margin-bottom: 0 !important;
}
@media (min-width: 576px)
bootstrap.css:8072
.mt-sm-0, .my-sm-0 {
    margin-top: 0 !important;
}
bootstrap.css:7818
.mb-2, .my-2 {
    margin-bottom: 0.5rem !important;
}
bootstrap.css:7808
.mt-2, .my-2 {
    margin-top: 0.5rem !important;
}
bootstrap.css:2679
.btn-secondary {
    color: #111;
    background-color: #F3969A;
    border-color: #F3969A;
}
bootstrap.css:2603
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
    font-size: 1rem;
    line-height: 1.5;
    border-radius: 0.4rem;
    -webkit-transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    -o-transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
}
bootstrap.css:352
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}
bootstrap.css:345
button, select {
    text-transform: none;
}
bootstrap.css:340
button, input {
    overflow: visible;
}
bootstrap.css:332
input, button, select, optgroup, textarea {
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
bootstrap.css:319
button {
    border-radius: 0;
}
bootstrap.css:293
a, area, button, [role="button"], input:not([type="range"]), label, select, summary, textarea {
    -ms-touch-action: manipulation;
    touch-action: manipulation;
}

bootstrap.css:107
*, *::before, *::after {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
    </style>

  
<% 
    int pageSize = 10 ; /* 한 페이지에 10개의 글이 보이게 하겠다. */
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

  	String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    } 

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number=0; 

    List<BoardBean> articleList = null;
    BoardDao dbPro = BoardDao.getIstance();
      
    count = dbPro.getArticleCount(); // 전체 레코드 수 리턴
    if (count > 0) {
         articleList = dbPro.getArticles(startRow, endRow);
    }
  
 	number=count-(currentPage-1)*pageSize; // 26-(2-1)*10 = 16
 %>
 	<%@include file="mall_top2.jsp"%>
 
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<form class="navbar-form navbar-left" role="search" method="post" action="searchSubject.jsp"> 
      

<center><b class="navbar-brand">글목록(전체 글:<%=count%>)</b>
  <input type="text" class="form-control" placeholder="Search" name="subject" value="제목">
          <input type="hidden" name="writer">
      <input class="btn btn-secondary my-2 my-sm-0" type="submit" value="검색"></input></center>
  </div>

	</form>
</nav>



<table align="right">
<tr>
    <td align="right">
    <a href="writeForm.jsp">글쓰기</a>
    </td>
</tr>
</table>

<%
    if (count == 0) {
%>

<table width="700" >
<tr>
    <td align="center">
    게시판에 저장된 글이 없습니다.
    </td>
</tr>
</table>

<%  } else {    %>

<table width="700" align="center"> 
    <tr height="30" > 
      <td align="center"  width="50"  >번 호</td> 
      <td align="center"  width="250" >제   목</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50"  >조 회</td> 
      <td align="center"  width="100" >IP</td>    
    </tr>
<%  
        for (int i = 0 ; i < articleList.size() ; i++) { // for(BoardBean article : articleList ){  
          BoardBean article = (BoardBean)articleList.get(i);
%>
   <tr height="30">
    <td align="center" width="50" > <%=number--%></td>
    
    <td align="left" width="250" >
	<%
	      int wid=0; 
	      if(article.getRe_level()>0){
	          wid=20*(article.getRe_level()); // 답글:1=>wid(20), 2=>wid(40), 3=>wid(60)
	%>
			  <img src="images/level.gif" width="<%=wid%>" height="16">
			  <img src="images/re.gif">
			  
		<%}else{%>
		  <img src="images/level.gif" width="<%=wid%>" height="16">
		<%}%>
           
      	<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
          	<%=article.getSubject()%></a> 
          	<% if(article.getReadcount()>=10){%>
         		<img src="images/hot.gif" border="0"  height="16"><%}%> </td>
         
         
         
    <td align="center"  width="100"> 
       <a href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
    <td align="center"  width="150"><%= sdf.format(article.getReg_date())%></td>
    <td align="center"  width="50"><%=article.getReadcount()%></td>
    <td align="center" width="100" ><%=article.getIp()%></td>
  </tr>
     <%}%> <!-- for문 끝 -->
</table>
<%}%>

<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
		int pageBlock=10; 
      	int startPage = ( (currentPage-1) / pageBlock * pageBlock ) + 1; 
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
      <br>  <a href="list.jsp?pageNum=<%= i %>" ><center>[<%= i %>]</center></a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
</body>
</html>

<%@include file="mall_bottom.jsp"%>
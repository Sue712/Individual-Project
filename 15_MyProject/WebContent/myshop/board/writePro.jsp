<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="article" class="board.BoardBean"/>
<jsp:setProperty property="*" name="article"/>

<%
BoardDao bdao=BoardDao.getIstance();

article.setReg_date(new Timestamp(System.currentTimeMillis()));

article.setIp(request.getRemoteAddr());
System.out.println("ip : " + article.getIp());
bdao.insertArticle(article);
response.sendRedirect("List.jsp");
%>

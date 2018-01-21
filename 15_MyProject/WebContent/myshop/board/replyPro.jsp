<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 

request.setCharacterEncoding("UTF-8");

%>


<jsp:useBean id="replies" class="board.BoardBean"/>
<jsp:setProperty property="*" name="replies"/>

<%
 replies.setReg_date(new Timestamp(System.currentTimeMillis()));
replies.setIp(request.getRemoteAddr());

BoardDao bdao = BoardDao.getIstance();
bdao.replyArticle(replies);

response.sendRedirect("List.jsp");
%>
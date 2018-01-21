<%@page import="board.BoardDao"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
    request.setCharacterEncoding("UTF-8");
    System.out.println("jjjjjr");
    %>
    
    <jsp:useBean id="board" class="board.BoardBean"/>
    
    <% 
    String subject  = request.getParameter("subject");
    System.out.println(subject +">...");
    
    BoardDao bdao = BoardDao.getIstance();
    
  ArrayList<BoardBean> list = bdao.getBoardBySubject(subject);
   System.out.println(list.size());

   if(list.size()!=0){
	   for(BoardBean bean : list){
		   System.out.println(bean.getSubject() + "//");
		   %>
	   <script type="text/javascript">
	   location.href = "<%=request.getContextPath()%>" + "/myshop/board/content.jsp?pnum="+ <%=bean.getNum()%>;
	   </script>
	   
	   <%
	   }
	   
	   
   }else{
		%>
		<script type="text/javascript">
		alert("해당 게시글이 없습니다.");
		history.go(-1);
		</script>
		<%
		}


		%>
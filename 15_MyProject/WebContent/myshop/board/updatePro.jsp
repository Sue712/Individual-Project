<%@ page contentType = "text/html; charset=UTF-8"  import ="board.*" %>
<% request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="article" class="board.BoardBean"/>
	<jsp:setProperty property="*" name="article"/>
	
	
	<%
	System.out.println("writer="+article.getWriter());
	

	String pageNum = request.getParameter("pageNum");
	

System.out.println(pageNum);

BoardDao bdao = BoardDao.getIstance();
int cnt =-1;    
cnt = bdao.updateAticles(article);


if(cnt==1){
	response.sendRedirect("List.jsp?pageNum=" + pageNum);
	
	}else{
	
	%>
	
	<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
	</script>




<%
}
%>




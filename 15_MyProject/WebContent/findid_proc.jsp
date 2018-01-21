<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="my.member.*" %>
	
	
	<% 
	request.setCharacterEncoding("UTF-8");

	   String name = request.getParameter("name");
	   String hp1 = request.getParameter("hp1");
	   String hp2 = request.getParameter("hp2");
	   String hp3 = request.getParameter("hp3");
	%>
	
	<jsp:useBean id="dto" class="my.member.MemberDto"/>
	<jsp:setProperty property="*" name="dto"/>

	
	<%  
	MemberDao dao = MemberDao.getInstance();
	 dto = dao.getMemberByHp(name,hp1,hp2,hp3);
	 
	 String str= "", url = "";
	 if(dto!=null){
		 str = dto.getId();
		 
	 }else{
		 str="없는 회원";
	 }
	url = request.getContextPath() +"/main.jsp";
	%>
	
	<script type="text/javascript">
	alert("<%=str%>");
	location.href="<%=url%>";
	</script>
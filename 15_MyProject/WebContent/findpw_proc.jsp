<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="my.member.*" %>
	
	
	<% 
	request.setCharacterEncoding("UTF-8");

	   String id = request.getParameter("id");
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
	 
	 String url = "", str="";
	 if(dto!=null){
		 if(dto.getId().equals(id))
		 str = dto.getPassword();
		 %>
		 
		 
		 <!--메일로 보내기  -->
		<a href="mailto:<%=dto.getEmail()%>?password=<%=str%>"></a>
	<script type="text/javascript">
		alert("메일을 보냈습니다. 확인하시고 로그인 하시기 바랍니다.");
	</script>
	
<%
 
	 }else{
		 str="없는 회원";
		 %>
		 <script type="text/javascript">
		alert("<%=str%>");
	</script>
	
		 
		 <%
	 }
	url = request.getContextPath() +"/main.jsp";

%>
	
		<script type="text/javascript">
		
	location.href="<%=url%>";
	</script>

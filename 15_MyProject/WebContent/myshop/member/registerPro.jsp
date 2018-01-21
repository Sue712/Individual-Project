<%@page import="my.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="my.member.MemberDto"/>
<jsp:setProperty property="*" name="dto" />

<%
	MemberDao dao = MemberDao.getInstance();
	int cnt = -1;
	cnt = dao.insertData(dto);
	System.out.println("eee");
	
	
	String msg = "", url = "";
	if (cnt == 1) {
		msg = "가입 성공";
	} else {
		msg = "가입 실패";
	}
	url = request.getContextPath() + "/main.jsp";
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>

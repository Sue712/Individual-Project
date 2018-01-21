<%@page import="my.member.MemberDto"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:useBean id="dto" class="my.member.MemberDto" />
<jsp:setProperty property="*" name="dto" />

<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	System.out.println("userid :" + userid);
	String msg = "";
	
	
	try{
	MemberDao dao = MemberDao.getInstance();
	boolean isCheck = dao.searchID(userid);
    System.out.println("isCheck : " + isCheck);
	
	
	
 	if(isCheck){
 		msg = "NO";
 		out.println(msg);
	}else{
		msg = "YES";	
		out.println(msg);
	}
	}catch(Exception e){
		e.printStackTrace();
	}
 	
%>
<%@ page import="my.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String contextPath = request.getContextPath();

    System.out.println("loginPro.jsp");
    System.out.println("session : " + session.getAttribute("memno"));
    

MemberDao dao = MemberDao.getInstance();
    MemberDto member = dao.getMemberInfo(id, password);
    System.out.println("member");
    
    String viewPage = null;
    
    if(member!=null){
    	
	int no =member.getNo();
	String id1 = member.getId();
	if(id1.equals("admin")){
		viewPage = contextPath+"/myshop/admin/main.jsp";
	}
	else{
		
		viewPage = contextPath + "/myshop/display/mall.jsp";
	}
	session.setAttribute("memno", no);
	session.setAttribute("memid", id1);
	
	
    }else{
    	viewPage = contextPath +"/main.jsp";
		
		%>
		
			
	<script type="text/javascript">

	alert("가입하지 않은 회원입니다.");
</script>
		
		<%
	}
	%>
	
	<script type="text/javascript">
	location.href = "<%=viewPage%>";
	</script>

</body>
</html>
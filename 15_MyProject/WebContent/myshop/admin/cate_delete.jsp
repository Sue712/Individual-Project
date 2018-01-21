<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    
 String cnum = request.getParameter("cnum");
    CategoryDao cdao = CategoryDao.getInstance();
    int cnt = -1;
    cnt = cdao.deleteCategory(cnum);
    
    
    String str ="", url="cate_list.jsp";
    if(cnt!=0){
    	str ="삭제 성공";
    	 
    }else{
    	str ="삭제 실패";
    }
    %>
    
    <script type="text/javascript">
    alert("<%=str%>");
    location.href ="<%=url%>";
    </script>
    
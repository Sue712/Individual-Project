<%@page import="my.shop.ProductDa"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%

String pnum = request.getParameter("pnum");
    String pimage= request.getParameter("pimage");
    
    String delPath = config.getServletContext().getRealPath("/myshop/images");
    System.out.println("delPath : " +delPath);
    
    
    File  delFile = null;
    File dir = new File(delPath);
    if(pimage!=null){
    	delFile = new File(dir, pimage);
    	System.out.println("delfile : " + delFile);
    	
    	if(delFile.exists()){
    		
    		if(delFile.delete())
    		%>
    		<script type="text/javascript">
    		alert("이미지 파일 삭제 성공");
    		</script>
    		
    		<%
    	}
    }
    
    ProductDa  pdao = ProductDa.getInstance();
    
    int cnt=-1;
   cnt= pdao.deleteProduct(pnum.trim());
   
    String str ="", url="prod_list.jsp";
    if(cnt!=-1){
    	str ="삭제 성공";
    	
    }else{
    	str="삭제 실패";
    }
    
    
    %>
    
    <script type="text/javascript">
    
    alert("<%=str%>");
    
    location.href = "<%=url%>";
    </script>
    
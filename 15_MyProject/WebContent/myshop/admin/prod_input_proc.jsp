<%@page import="java.io.File"%>
<%@page import="my.shop.ProductDa"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    import="com.oreilly.servlet.*,
       com.oreilly.servlet.multipart.*"%>
<%  

 	request.setCharacterEncoding("UTF-8");
	MultipartRequest mr=null;
	String msg="", url=""; 
	
	
	String uploadDir=config.getServletContext().getRealPath("/myshop/images"); 

	System.out.println("uploadDir:"+uploadDir); 
	// uploadDir:D:\MiniMall\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MiniMall\myshop\images
	
	try{
		mr = new MultipartRequest(request,uploadDir,10*1024*1024,
				"UTF-8", new DefaultFileRenamePolicy());		
			
		int cnt = -1 ;
		ProductDa dao = ProductDa.getInstance();
		
		cnt = dao.insertProduct( mr );
		
		if(cnt > 0){
			msg="상품 등록 성공!";
			url="prod_list.jsp";
		}else{
			msg="상품 등록 실패!"; 
			url="prod_input.jsp";
		} 
		
	}catch(Exception e){
		msg="이미지 파일 업로드 실패!"; 
		url="prod_input.jsp";
		e.printStackTrace();
	}
%> 
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>

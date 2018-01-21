<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.shop.*"%>

<jsp:useBean id="dto" class="my.shop.ProductBean"/>

<%
MultipartRequest mr = null;

String uploadDir = config.getServletContext().getRealPath("/myshop/images");
System.out.println("uploadDir : " + uploadDir);
String str="", url ="";
int cnt = -1;

try{
	
	mr = new MultipartRequest(request,uploadDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	System.out.println("pnum:" + mr.getParameter("pnum"));
	System.out.println("pimage:" + mr.getFilesystemName("pimage"));
	System.out.println("pimage2:" + mr.getParameter("pimage2"));
	
	String pnum = mr.getParameter("pnum");
	String pimage = mr.getFilesystemName("pimage");
	String pimage2 = mr.getParameter("pimage2");
	
	ProductDa dao = ProductDa.getInstance();
	cnt = dao.updateProduct(mr);
	
	File delFile = null;
	File dir = new File(uploadDir);
	
	if(pimage !=null){
		delFile = new File(dir, pimage2);
		System.out.println("delFile = "+ delFile);
		
		if(delFile.exists()){
if(delFile.delete()){
	%>
	
	<script type="text/javascript">
	alert("이미지 파일 삭제 성공");
	
	</script>
	<%
	}
		}
	}
		if(cnt>0){
			str ="수정 성공!";
			url = "prod_list.jsp";
		}else{
			str="수정 실패!";
			url = "prod_list.jsp";
		}
	}catch(IOException e){
	 str ="이미지 업로드 실패!";
	 url = "prod_list.jsp";
	 e.printStackTrace();
	
}catch(NumberFormatException e){
	str="상품 수량, 가격, 포인트는 숫자로 입력하세요.";
	url="prod_update.jsp?pnum=" +mr.getParameter("pnum");
	
}
%>


<script type="text/javascript">

alert("<%=str%>");
location.href = "<%=url%>";
</script>
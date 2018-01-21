<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <%@include file="mall_top3.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">


.alert-success {
    color: #244d04;
    background-color: #daeace;
    border-color: #cbe1ba;
}
bootstrap.css:5057
.alert {
    position: relative;
    padding: 0.75rem 1.25rem;
    margin-bottom: 1rem;
    border: 1px solid transparent;
    border-radius: 0.25rem;
}
bootstrap.css:107
*, *::before, *::after {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
user agent stylesheet
div {
    display: block;
}

</style>
</head>
<body>
<div class="alert alert-dismissible alert-success">
  <strong>History</strong> 
</div>
<br><br>
<img src="<%=request.getContextPath()%>/myshop/images/회사 연혁.jpg"  width="450" height="250" > 
</body>
</html>

<%@include file="mall_bottom.jsp"%>
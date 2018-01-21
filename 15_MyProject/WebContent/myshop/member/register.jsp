<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>*회원 가입*</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/script3.js">

</script>  
</head>
<body>
<form action = "registerPro.jsp" method ="post" onsubmit="return writeSave()">
<table border="1" align ="center">
<Tr>
<td colspan ="2" align ="center" bgcolor = "pink">
<font size = "3" color = "black"><b>◎기본 정보◎</b></font>
</td>
</Tr>

<tr> 
<th bgcolor="pink" align="center"> ⊙회원 아이디 </th>
<td><input type= "text" name = "id">
<button type="button" id = "id_check" onclick ="return duplicate()">중복체크</button>
<span id="idmessage" style = "display:none;"></span>
</td>
</tr>


<tr> 
<th bgcolor="pink" align="center"> ⊙비밀번호 </th>
<td><input type= "password" name = "password" onBlur = "pwcheck()">영문 소문자/ 숫자 조합 3~8자
</td>
</tr>


<tr> 
<th bgcolor="pink" align="center"> ⊙비밀번호 확인 </th>
<td><input type= "password" name = "repassword" id = repassword onkeyup="passwd_check()">
<span id="pwdmessage" style="display:none;"></span>
</td>
</tr>

<tr>
<th bgcolor="pink" align="center">E-mail</th>
<td>
<input type="text" name = email id =email value="gggg@naver.com">
</td>
</tr>



<Tr>
<td colspan ="2" align ="center" bgcolor = "pink">
<font size = "3" color = "black"><b>◎개인 신상 정보◎</b></font>
</td>
</Tr>


<Tr>
<th bgcolor="pink" align="center">한글 이름 </th>
<td><input type= "text" name = "name"> 성과 이름을 붙여주세요 (예)홍길동
</td>
</tr>

<Tr>
<th bgcolor="pink" align="center">주민 등록 번호 </th>
<td>
<input type= "text"  name="ssn1" maxlength = 6  size =6 value= "111111"> - 
<input type="text" name="ssn2" maxlength = 6  size =6 value= "111111"></td></tr>


<Tr>
<th bgcolor="pink" align="center">전화 번호 </th>
<td>
<select name= "phone1">
<option value="02">02</option>
<option value="031">031</option>
</select>-
<input type= "text"  name="phone2" maxlength = 4  size =4 value= "1111"> - 
<input type="text" name="phone3" maxlength =4 size =4 value= "2222">예) 031-000-0000</td></tr>

<Tr>
<th bgcolor="pink" align="center">휴대 전화 번호 </th>
<td>
<select name= "hp1">
<option value="010">010</option>
<option value="011">011</option>
</select>-
<input type= "text"  name="hp2" maxlength = 4  size =4 value= "1111"> - 
<input type="text" name="hp3" maxlength =4 size =4 value= "2222">예) 011-000-0000</td></tr>

<Tr>
<th bgcolor="pink" align="center">가입일자 </th>
<td><input type= "text" name = "joindate" size=6 onBlur="return date_chek()">예)2017/07/12</td>
</tr>

<tr>
<td colspan="2" bgcolor="pink" align="center">
<input type="submit" value="가입" id="sub">&nbsp;&nbsp;
<input type="reset" value="취소">
</td>
</tr>


</table>



</form>
</body>
</html>
var isCheck=false;
var use; 
var isChange = false;

$(function(){
	alert("시작");
	$("input[name=id]").keydown(function() {
		isChange = true;
		use="";
		$('#idmessage').css("display","none");
		var isCheck=false;

	});
});

function writeSave(){
	
	if($('input[name="id"]').val()==""){
		alert("id를 입력하세요.");
		$('input[name="id"]').focus();
		isChange = false;
		return false;
	}
	if(isCheck==false || isChange == true){
		alert("중복체크 하세요(submit)");
		return false;
	}
}


function duplicate(){

	//alert("id_check");
	isCheck = true;
	
	$.ajax({
		url: "id_check_proc.jsp",
		data : ({
			userid: $("input[name=id]").val() // userid=kim
		}), 

		success: function (data){

			if ($('input[name="id"]').val()==""){
				$('#idmessage').html("<font color=red>id 입력 누락</font>");
				$('#idmessage').show();
				return;
			}
			else if (jQuery.trim(data)=='YES'){ 
				$('#idmessage').html("<font color=red>사용 가능합니다.</font>");
				$('#idmessage').show();  
				use = "possible";
				isChange = false;

			}else{
				$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
				$('#idmessage').show();                
				use = "impossible";
			}
		} // success의 끝
	});//ajax()의 끝


	$("#sub").click(function(){
		if(use=="impossible"){
			alert("이미 사용중인 아이디입니다.");
			return false;
		}else if(isCheck==false ||isChange==true){
			alert("중복체크를 하세요(중복체크)");
			return false;
		}

		var isCheck=false;
		var isChange = false;
	})
} // duplicate의 끝


function passwd_check(){ 
	if($("input[name=password]").val() == $("input[name=repassword]").val()){

		$('#pwdmessage').html("<font color=red>비번 일치</font>");
		$('#pwdmessage').show();
	}
	else{
		$('#pwdmessage').html("<font color=red>비번 불일치</font>");
		$('#pwdmessage').show();
	
	}
} // passwd_keyup의 끝


function pwcheck() {
	alert("pwcheck()");
	
	var pw = document.forms[0].password.value;
	var regexp = /^[a-z0-9]{3,6}$/;
	
	if(!regexp.test(pw)){
		
		alert("비밀번호 형식이 틀렸습니다.");
		return false;
	}
	var chk_num = pw.search(/[0-9]/g);
	var chk_eng = pw.search(/[a-z]/ig);
	
	
	if(chk_num <0 || chk_eng<0){
		alert("비밀번호는 영문자와 숫자를 조합해 주세요.");
		return false;
	}

}

function date_chek() {
	alert("date_chek()");
	var msg= document.forms[0].joindate.value;
	
	
	var regex = /^(\d{4})[ -\/.]([01]?\d)[-\/.]([0123]?\d)$/;
if(msg.search(regex)==-1){
	alert("잘못된 형식");
}else{
	alert("올바른 형식");
}
}


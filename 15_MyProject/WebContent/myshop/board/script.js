function writeSave(){
	
	if($('input[name="writer"]').val()==""){
		alert("작성자를 입력하세요.");
		$('input[name="writer"]').focus();
		return false;
	}
	
	if($('input[name="subject"]').val()==""){
		alert("제목을 입력하세요.");
		$('input[name="subject"]').focus();
		return false;
	}
	
	if($('#abc').val()==""){ 
		alert("내용을 입력하세요.");
		$('#abc').focus();
		return false;
	}
 
	if($('input[name="passwd"]').val()==""){
		alert("비번을 입력하세요.");
		$('input[name="passwd"]').focus();
		return false;
	}
	
}
	
	

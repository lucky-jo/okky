
////////   Comunity inCheck_Title   ////////
function ttCheck() {
	var title=$('#title').val();
	if (title.length<1) {
		$('#tMessage').html('글 제목을  입력하세요 ~~~');
		$('#title').focus();
		return false;
	}else {
		$('#tMessage').html('');	
		return true;
	}   
} // ttCheck()

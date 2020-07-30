<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅</title>

<link rel="stylesheet" type="text/css" href="resources/jqLib/myStyle.css">
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/axTest01.js"></script>
<script>
	var wsocket;
	// 서버연결
	function connect() {
		wsocket = new WebSocket(
				"ws://192.168.0.39:8080/chat-ws");
		wsocket.onopen = onOpen; // 연결시 콜백 함수
		wsocket.onmessage = onMessage; // 서버로부터 메시지 도착시 콜백 함수
		wsocket.onclose = onClose; // 종료시 콜백 함수
	}
	// 연결종료
	function disconnect() {
		wsocket.close();
	}
	// 콜백 함수 들
	function onOpen(evt) {
		appendMessage("연결되었습니다.");
	}
	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}
	}
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}
	// 실행 함수 들 
	function send() {
		var nickname = $("#nickname").val();
		var msg = $("#message").val();
		wsocket.send("msg:"+nickname+":" + msg);
		$("#message").val("");
	}

	function appendMessage(msg) {
		$("#chatMessageArea").append(msg+"<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}
	// --- Main 스크립트 --------------------------------------- 
	$(document).ready(function() {
		$('#message').keypress(function(event){
			// 입력된 key 확인 
			// => Javascript : event.keyCode , jQuery : event.which
			// => console 출력 결과를 보면 크롬에서는 아무거나 써도 될듯
			//    그러나 브라우져 마다 차이가 있을수 있기 때문에 아래 코드 사용 
			console.log('event.keyCode =>'+event.keyCode+'event.which =>'+event.which);
			var keycode = (event.keyCode ? event.keyCode : event.which);
			// enter 키 입력 시 전송 되도록  
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
			// 부모 태그로의 이벤트 전파 (Bubble Up) 를 stop 중지 시켜줌
		});
		$('#sendBtn').click(function() { send(); });
		$('#enterBtn').click(function() { connect(); });
		$('#exitBtn').click(function() { disconnect(); });
	});
</script>
<style>
#chatArea {
	width: 300px; height: 200px; 
	overflow-y: auto; 
	border: 1px solid green;
}
</style>
</head>
<body>
<div id=wrap>
<h2>** WebSocket Chatting **</h2>

이름:<input type="text" id="nickname">
	<input type="button" id="enterBtn" value="입장">
	<input type="button" id="exitBtn" value="나가기">
    
<h3 style="color: gray;">~~~~~~ Chatting Area ~~~~~~</h3>
<div id="chatArea">
	<div id="chatMessageArea"></div>
</div>
<br/>
<input type="text" id="message" size="33">
<input type="button" id="sendBtn" value="전송">
<br><br><hr>
<a href="home" class="textLink">[Home]</a><br>
</div>
</body>
</html>
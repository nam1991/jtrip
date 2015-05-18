<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> 
<script src="js/http.js"></script>
<script>
//사용자가 입력한 내용을 서버에 저장(비동기식)

if(typeof(eventSource)!="undefined"){ //push를 받을수 있는 브라우저인지 판단
var eventSource = new EventSource("chatload.jsp");
//EventSource : EventListener의 종류
//onmessage: 서버가 보낸 push 메세지가 수신되면 발생
//onerror : 서버가 보낸 push에서 에러가 발생되었을 때 발생
//onopen : 서버가 연결이 되었을 때 발생
eventSource.onmessage = function(event){
	$("#target").html("<dov style='background:orange'>"+event.data+"</div>"); 
	//스크립트는 클라이언트에서 돌아가기 때문에 클라이언트 메모리를 쓰기 때문에 서버에 부하가 없다.	
};
}else{
		$("#target").html("해당 브라우저는 지원이 안됩니다.");
}
	$(function(){
		$("form").submit(function(){
			var fdata = {
					u_id:encodeURIComponent($("#u_id").val()),
					chat:encodeURIComponent($("#chat").val())
					};
			 $.ajax({
				    type:"POST",
				    url:"chat_add.jsp",
				    data:fdata
				   });
			return false;
		});
		
	})
// 실시간 받기 위해서 함수를 정의(비동기식)
	function loadData(){
		sendRequest("chatload.jsp", null, res, "get");
	}
	function res(){
		if(xhr.readyState==4&&xhr.status==200){			
			document.getElementById("target").innerHTML=xhr.responseText;
		}		
	}
	var inter = setInterval(function(){
		loadData();
	}, 200); //싱글톤 처리해야댐
</script>
</head>
<body>
<div id="wrap">
	<form method="post"  name="cform"  id="cform">
		<input type="text" id="u_id" name="u_id" required = "required" placeholder="이름">
		<input type="text" id ="chat" name = "chat"  required = "required"  placeholder="대화내용">
		<input type="submit" id="send" value="글작성">
	</form>
	<div id = "target"></div>
</div>
</body>
</html>
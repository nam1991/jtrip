<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	div{
		float: left;
		width: 100px;
		height: 35px;
		margin: 10px;
		padding: 10px;
		border: 1px solid #aaaaaa;
			}
</style>
<script>

function allowDrop(ev){
	ev.preventDefault();
}
function drag(ev){
	 ev.dataTransfer.setData("text",ev.target.id);
}
function drop(ev){
	ev.preventDefault();
	var data = ev.dataTransfer.getData("text");
	ev.target.appendChild(document.getElementById(data));
}
</script>
</head>
<body>
<%--
	draggable="true" : 드래그 할 요소 추가
	ondragstart: 해당 요소를 Drag 가능 상태로 만들려면 true로 설정한다.
	ondrag: Drag시 발생
	ondragend : Drag가 종료될 때 호출된다.
	ondrop : Drag된 데이터가 놓여질 때 호출된다.
	
	기본적으로 데이터 요소는 다른 요소에 놓여질 수 없다
	놓기를 가능하기 위해서는 반드시 요소의 기본 핸들링을 막아야 한다.
	event.preventDefault()메소드를 호출함으로 써 기본 핸들링을 막아 해당 요소에 놓여질 수 있게 만든다.
	
	ondragover: Drag된데이터를 놓을 장소를 지정한다.
	ondragenter : Drag된 데이터가 해당 구역에 들어오게 될 경우 호출된다.
	ondragleave : Drag된 데이터가 해당 구역에서 벗어나게 될 경우 호출된다.
 --%>
	<div id = "div1" ondrop="drop(event)" ondragover="allowDrop(event)">
		<img src = "img/logo.png" draggable="true" ondragstart="drag(event)" id="drag1" width="88" height="31">
	</div>
	<div id = "div2" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>index.jsp</title>
<link href="css/base.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#wrap #topcont #logo {
		margin-top:10px; /*ㅌㅋㅋㅋㅋㅌㅋㅊㅇㅁㄴㅇ*/
		margin-left:20px; /* 안녕안녕ㅋㅋㅋㅋㅋ*/
		width: 120px; /*수정*/
		float: left;/*왼쪽 정렬*/
	}/*sadasfafsas*/
	#topcont {
		width: 100%; 
		height: 55px;
	}
	#wrap #topcont #t_menu{ margin-right: 50px;}
	#wrap #topcont #t_menu ul {
	 margin-top:8px;
	 margin-left:10px;
	}
	#wrap #topcont #t_menu ul li{
		float: left; margin-left:10px;
	}
	#wrap #topcont #t_menu{
		width: 300px; 
		float: right;/*오른쪽 정렬*/
	}
	#wrap #top #nav{
	width:1000px; height:30px;
	background-color:#007bbe;
	padding-left: 120px;
	
	clear: both;
	}
	#wrap #top #nav ul li {
		float: left;
	}
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="js/board.js"></script>
<c:if test="${param.subcmd =='boardForm' }">
	<script src="//cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>
	<script src="js/myckeditor.js"></script>
	<script>
		$(function(){
			
			chkUpload();
			
		});
	</script>
</c:if>
<c:if test="${param.cmd =='' || param.cmd =='index' }">
<link rel='stylesheet' href='fjs/fullcalendar.min.css' />
<script src='fjs/lib/moment.min.js'></script>
<script src='fjs/fullcalendar.min.js'></script>
<script src="fjs/lang/ko.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.3.1/lang/ko.js"></script> -->
<script>
$(function(){
	  var currentLangCode = 'ko';
	  $('#calendar').fullCalendar('destroy');
	  $('#calendar').fullCalendar({
	   
	   //lang: currentLangCode,
	   dragable:false,  //드래그앤 드랍 옵션
	            timeFormat: 'hh:mm', //시간 포멧
	           // lang: 'ko',  //언어타입
	            header: {
	     left: 'prev,next today',
	     center: 'title',
	     right: 'month,agendaWeek,agendaDay'
	     },
	            eventClick : function(calEvent,jsEvent,view){ //달력 이벤트 클릭 - 이 소스에서는 false!
	             var r=confirm("Delete " + calEvent.title);
	             if (r===true)
	               {
	                   $('#calendar').fullCalendar('removeEvents', calEvent._id);
	               }
	             },
	             defaultView: 'agendaWeek',//기본 뷰 - 옵션   //첫 페이지 기본 뷰 옵션
	            editable: false,                                             //에디터 가능 옵션
	   selectable: true,
	   selectHelper: true,
	   select: function(start, end) {
	    var title = prompt('Event Title:');
	    var eventData;
	    if (title) {
	     eventData = {
	      title: title,
	      start: start,
	      end: end
	     };
	     $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
	    }
	    $('#calendar').fullCalendar('unselect');
	    alert("selected from: " + start.format() + ", to: " + end.format());
	   
	         $.ajax({
	             url: "testAjax.jsp",
	             type: "GET",
	             data: {
	                 q: "test"
	             },
	             dataType: "html",
	             success: function(a) {
	                 alert("Data: " + a);
	             },
	             error: function(a, b) {
	                 alert("Request: " + JSON.stringify(a));
	             }
	         });
	   },
	   editable: true,
	   eventLimit: true, 
	   events: [
				<%for(int i=0){%> //되냐마냐
				title: 'All Day Event',
				start:'2015-05-01'
				<%}%>
			]
	  })
	 });



</c:if>

<script>
	$(function(){
		imgChange();
	});
</script>
<script>
	function chmenu(img,num){
		//alert(img.src.replace(".png","_on.png")+":"+num);
		// menu01.png 에서 .png를 찾아서 _on.png로 변경하기 위해서 replace()를 사용.
		if(num == 1){
			img.src = img.src.replace(".png","_on.png");
		}else if(num == 2){
			img.src = img.src.replace("_on.png",".png");
		}
	}
</script>
</head>
<body>
	<div id="wrap">
	<!--  탑 영역  -->
		<div id="top">
			<!--  탑로고및 탑메뉴영역  -->
			<div id="topcont">
				<div id="logo">
					<a href="index.jsp"><img src="img/logo.png"></a>
				</div>
				<div id="t_menu">
					<ul>
						<li><a href="">Home</a>|</li>
						<li><a href="">Login</a>|</li>
						<li><a href="">Join</a>|</li>
						<li><a href="">고객지원</a>|</li>
						<li><a href="">사이트맵</a></li>
					</ul>
				</div>
			</div>
			<!-- 메뉴영역 -->
			<div id="nav">
				<ul>
				<!-- onmouseover : 마우스를 올렸을 때, onmouseout :마우스를 내렸을 때  -->
					<li><a href="kostainfo.jsp"><img src="img/menu1.png" alt="KOSTA50기소개" 
					onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
					<li><a href="studyBoard.kosta?cmd=board&page=1&subcmd=boardList"><img src="img/menu2.png" alt="스터디게시판" onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
					<li><a href=""><img src="img/menu3.png" alt="포토폴리오" onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
					<li><a href=""><img src="img/menu4.png" alt="질문과답변" onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
					<li><a href=""><img src="img/menu5.png" alt="겔러리" onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
					<li><a href=""><img src="img/menu6.png" alt="면접후기" onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
					<li><a href=""><img src="img/menu7.png" alt="뉴스&공지" onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
				</ul>
			</div>
		</div>
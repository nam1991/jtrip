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
		margin-top:10px; /*������������������������*/
		margin-left:20px; /* �ȳ�ȳ礻��������*/
		width: 120px; /*����*/
		float: left;/*���� ����*/
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
		float: right;/*������ ����*/
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
	   dragable:false,  //�巡�׾� ��� �ɼ�
	            timeFormat: 'hh:mm', //�ð� ����
	           // lang: 'ko',  //���Ÿ��
	            header: {
	     left: 'prev,next today',
	     center: 'title',
	     right: 'month,agendaWeek,agendaDay'
	     },
	            eventClick : function(calEvent,jsEvent,view){ //�޷� �̺�Ʈ Ŭ�� - �� �ҽ������� false!
	             var r=confirm("Delete " + calEvent.title);
	             if (r===true)
	               {
	                   $('#calendar').fullCalendar('removeEvents', calEvent._id);
	               }
	             },
	             defaultView: 'agendaWeek',//�⺻ �� - �ɼ�   //ù ������ �⺻ �� �ɼ�
	            editable: false,                                             //������ ���� �ɼ�
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
				<%for(int i=0){%> //�ǳĸ���
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
		// menu01.png ���� .png�� ã�Ƽ� _on.png�� �����ϱ� ���ؼ� replace()�� ���.
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
	<!--  ž ����  -->
		<div id="top">
			<!--  ž�ΰ�� ž�޴�����  -->
			<div id="topcont">
				<div id="logo">
					<a href="index.jsp"><img src="img/logo.png"></a>
				</div>
				<div id="t_menu">
					<ul>
						<li><a href="">Home</a>|</li>
						<li><a href="">Login</a>|</li>
						<li><a href="">Join</a>|</li>
						<li><a href="">������</a>|</li>
						<li><a href="">����Ʈ��</a></li>
					</ul>
				</div>
			</div>
			<!-- �޴����� -->
			<div id="nav">
				<ul>
				<!-- onmouseover : ���콺�� �÷��� ��, onmouseout :���콺�� ������ ��  -->
					<li><a href="kostainfo.jsp"><img src="img/menu1.png" alt="KOSTA50��Ұ�" 
					onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
					<li><a href="studyBoard.kosta?cmd=board&page=1&subcmd=boardList"><img src="img/menu2.png" alt="���͵�Խ���" onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
					<li><a href=""><img src="img/menu3.png" alt="����������" onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
					<li><a href=""><img src="img/menu4.png" alt="�������亯" onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
					<li><a href=""><img src="img/menu5.png" alt="�ַ���" onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
					<li><a href=""><img src="img/menu6.png" alt="�����ı�" onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
					<li><a href=""><img src="img/menu7.png" alt="����&����" onmouseover="chmenu(this,'1')" onmouseout="chmenu(this,'2')"></a></li>
				</ul>
			</div>
		</div>
<%@page import="jsp0421.FirstModel"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%><%--이 것은 반드시 있어야 한다. --%>
    <%--jsp 주석 --%>
    <%--page 지시자 : 필수 지시자, WAS가 현재 문서의 정보를 판독하는데 사용(web.xml)에
    		기술했던 서블릿의 정보를 대신한다.
    		버퍼의 크기, 에러페이지 등의 추가적인 내용을 설정할 수 있다. 
    		jsp는 결국 서블릿으로 변환되어 Container에 의해서 실행이 된다.
    		스크립트 요소가 3가지가 있다.(개념만 가지고 있길 바람 이유는 이런식으로 로그램하면 욕먹습니다.)
    			*선언부 - 멤버영역 , 스크립트릿 - 서비스(doget, dopost)의 local 영역 
    			, 표현식 - out.println() 안에서 값을 출력
    	//선언부: 멤버영역, ex1_FirstServlet.class 형식으로 된 클래스에    	
    	//			   멤버 영역과 매핑 된 영역이다. 따라서 멤버변수나 메서드는 만들 수 있다.
    	//		 	   그러나 여기에 이런식으로 프로그래밍하면 유지보수가 상당히 어려운 코드가 된다.
    	//이렇게 할 수 있다고 알고만 있고 보여주는거
    --%>
    <%--선언부에 코딩을 안하는 이유는 재사용성이 안됨 --%>
    <%
    		//분리했던 객체를 생성.
    		FirstModel fm = new FirstModel();
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
p{width: 300px; background: orange;}
</style>
</head>
<body>
	<%//service영역 - local영역 
		String msg = fm.printMsg("하이");
		out.println("<p>"+msg+"</p>"); //서블릿의 PrintWriter를 통해 호출 36번째 줄이랑 같다.
	%>
	<%-- out.println을 웹상에서 쉽게 출력하기 위해서 표현식으로 출력 --%>
	<p><%=msg	%></p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
/*
	pageContext.setAttribute("page","test1");
 		request.setAttribute("req", "test2");
 		request.setAttribute("sess","test");
 		application.setAttribute("email", "javabook@naver.com");
*/

out.println(pageContext.getAttribute("page"));
out.println("<br/>");
out.println(request.getAttribute("req"));
out.println("<br/>");
out.println(session.getAttribute("sess"));
out.println("<br/>");
out.println(application.getAttribute("email"));
out.println("<br/>");
%>
</body>
</html>
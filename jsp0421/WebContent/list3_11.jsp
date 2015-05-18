<%@page import="jsp0421.FirstModel"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%!
    	FirstModel fm = new FirstModel();
    int val1 = 25;
    int val2 = 10;
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<p style="width:100px; background: green;"><%
	int sum1 = fm.multiply(val1, val2);
	out.println(val1+"*"+val2+"="+sum1);
%></p><br/>
<p style="width:100px; background: red;"><%
	int sum2 = fm.add(val1, val2);
	out.println(val1+"+"+val2+"="+sum2);
%></p><br/>
<p style="width:100px; background: cyan;"><%
	int sum3 = fm.subtract(val1, val2);
	out.println(val1+"-"+val2+"="+sum3);
%></p><br/>
</body>
</html>
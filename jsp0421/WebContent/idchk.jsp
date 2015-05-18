<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String[] str = {"xman","gopass","javabook"};
	String id = request.getParameter("name");
	boolean res = false;
	for(String e : str){
		if(e.equals(id)){
			res = true;
			break;
		}
	}
	if(res){
		%>
	<p style="color:pink">이미 존재하는 아이디입니다</p>		
	<% }else{ %>
	<p style="color:green">사용 가능한 아이디입니다.</p>		
	<%} %>


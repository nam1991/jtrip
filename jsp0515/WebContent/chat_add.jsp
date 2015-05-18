<%@page import="dao.ChatDao"%>
<%@page import="vo.ChaVO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String u_id=URLDecoder.decode(request.getParameter("u_id"),"utf-8");
	String chat = URLDecoder.decode(request.getParameter("chat"),"utf-8");
	System.out.println("Log:"+u_id);
	System.out.println("Log:"+chat);
	ChaVO v = new ChaVO();
	v.setU_id(u_id);
	v.setChat(chat);
	v.setReip(request.getRemoteAddr());
	ChatDao.getDao().insertChat(v);
// 	System.out.println("IP:"+request.getRemoteAddr());
%>
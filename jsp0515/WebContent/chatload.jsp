<%@page import="dao.ChatDao"%>
<%@page import="vo.ChaVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	response.setHeader("cache-control", "no-cache");
	response.setContentType("text/event-stream");	 //이벤트 감지 대기
	ArrayList<ChaVO> list = ChatDao.getDao().getList();
	StringBuffer outs = new StringBuffer();
	outs.append("data:"); //데이터가 한번 있을때마다 push
	for(ChaVO e : list){
		outs.append("<p style='color:black; background:cyan;border:1px dotted white'>");
		outs.append(e.getU_id());
		outs.append("/");
		outs.append(e.getChat());
		outs.append("</p>");
	}
			outs.append("\n\n");
			%><%=outs%>
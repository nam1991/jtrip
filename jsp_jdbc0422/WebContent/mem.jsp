
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jsp_jdbc0422.ConnectUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
   	    request.setCharacterEncoding("euc-kr");
    	String name = request.getParameter("name");
    	String pwd = request.getParameter("pwd");
    	String id = request.getParameter("id");
    	String gender = request.getParameter("gender");
    	//--파라미터값을 검수
    	 out.println(id+"<br/>");
    	 out.println(pwd+"<br/>");
    	 out.println(name+"<br/>");
    	 out.println(gender+"<br/>");

    	Connection con = ConnectUtil.getConn(); //항상 로컬영역에서 생성하고 close해야 한다 !!!!!!
    	out.println(con);
    	//PreparedStatement: 객체를 사용해서 SQL문을 작성해서 오라클로 전달 해주는 객체
    	StringBuffer sql = new StringBuffer();
    	sql.append("insert into mem values(mem_seq.nextVal,?,?,?,?,sysdate)");
    	//물음표는 binding: A와 B를 연결한다.
    	PreparedStatement pstmt = con.prepareStatement(sql.toString());
    	//?의 바인딩에 값을 연결한다
    	pstmt.setString(1, id);
    	pstmt.setString(2, pwd);
    	pstmt.setString(3, name);
    	pstmt.setString(4, gender);
    	//  디비에 입력할 값과 저장될 위치의 ?(바인딩)과 연결이 되었으면 이제 값을 전달한다.
    	pstmt.executeUpdate();//insert, update , delete
    	out.println("입력완료 !!"); 
    	pstmt.close(); //꼭 닫아줘야한다.
    	con.close(); //꼭 닫아줘야한다.
    %>


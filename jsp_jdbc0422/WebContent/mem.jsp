
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
    	//--�Ķ���Ͱ��� �˼�
    	 out.println(id+"<br/>");
    	 out.println(pwd+"<br/>");
    	 out.println(name+"<br/>");
    	 out.println(gender+"<br/>");

    	Connection con = ConnectUtil.getConn(); //�׻� ���ÿ������� �����ϰ� close�ؾ� �Ѵ� !!!!!!
    	out.println(con);
    	//PreparedStatement: ��ü�� ����ؼ� SQL���� �ۼ��ؼ� ����Ŭ�� ���� ���ִ� ��ü
    	StringBuffer sql = new StringBuffer();
    	sql.append("insert into mem values(mem_seq.nextVal,?,?,?,?,sysdate)");
    	//����ǥ�� binding: A�� B�� �����Ѵ�.
    	PreparedStatement pstmt = con.prepareStatement(sql.toString());
    	//?�� ���ε��� ���� �����Ѵ�
    	pstmt.setString(1, id);
    	pstmt.setString(2, pwd);
    	pstmt.setString(3, name);
    	pstmt.setString(4, gender);
    	//  ��� �Է��� ���� ����� ��ġ�� ?(���ε�)�� ������ �Ǿ����� ���� ���� �����Ѵ�.
    	pstmt.executeUpdate();//insert, update , delete
    	out.println("�Է¿Ϸ� !!"); 
    	pstmt.close(); //�� �ݾ�����Ѵ�.
    	con.close(); //�� �ݾ�����Ѵ�.
    %>


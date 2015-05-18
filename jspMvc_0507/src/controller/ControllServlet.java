package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.IndexAction;



@WebServlet("*.kosta")
public class ControllServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request,response);
	}
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		// 어떤 방식으로 넘어오든 doService로 와서 실행이된다.
		//1.사용자로 부터 요청을 받는다.
		String cmd= request.getParameter("cmd");
		// 오직 cmd라는 이름으로 (사용자로 부터 요청이 있다.)
		if(cmd != null){
			
			Action action = ActionFactory.getaa().getCmd(cmd);
			ActionForward af = action.execute(request, response);
			if(af.isMethod()){
				response.sendRedirect(af.getUrl());
			}else{
				//forward
				RequestDispatcher rd = request.getRequestDispatcher(af.getUrl());
				rd.forward(request, response);
			}
		}else{
			//요청이 없다면 처리할 로직....
		}
	}

}

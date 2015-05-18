package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.MemVO;
import controller.ActionForward;
import dao.MemDao;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String subcmd = request.getParameter("subcmd");
		String url ="index.jsp";
		boolean method=false;
		if(subcmd != null&& subcmd.equals("loginForm")){
			url = "loginForm.jsp";
			method=false;
		}
		
		else if(subcmd != null && subcmd.equals("loginok")){
			url ="*.kosta?cmd=index";
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			// Dao로 값을 보내서 인증된 사용자인지 조회
			System.out.println("id:"+id+"pw:"+pwd);
			MemVO v = new MemVO();
			v.setId(id);
			v.setPwd(pwd);
			try {
				int res = MemDao.getDao().login(v);
				System.out.println("res :"+res);
				if(res > 0){
					// sessinoScope에 아이디를 저장
					HttpSession session = request.getSession();
					session.setAttribute("userid", id);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
				
			method=true;
		}
		
		else if(subcmd != null && subcmd.equals("logout")){
			url ="*.kosta?cmd=index";
			HttpSession session = request.getSession();
			session.removeAttribute("userid");//세션을 삭제
			//session.invalidate();//모든 세션삭제
			method=true;
		}
		return new ActionForward(url, method);
	}

}

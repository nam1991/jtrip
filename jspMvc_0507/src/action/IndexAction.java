package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ActionForward;

public class IndexAction implements Action {
    // 여기는 Model 임.
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println("Log : IndexAction이 수행이 됨 !");
		//requestScope에 값을 저장
		request.setAttribute("msg", "hello ~my first MVC!");
		// false : forward, true : redirect 등으로 여러분이 결정.
		return new ActionForward("index.jsp", false);
	}

}

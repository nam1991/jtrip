package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ActionForward;

public interface Action {
 public abstract ActionForward execute(HttpServletRequest request, 
		 HttpServletResponse response) throws IOException;
 	//ActionFoward를 생성할 수 있도록 추상메서드를 정의한 인터페이스를 설계
 	//controller에서 Model로 인식하게 하기위해 request와 response를 갖게 한다.
}

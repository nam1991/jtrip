package jsp0421;

import javax.servlet.http.HttpServletRequest;

public class RequestInfo {
	
	public String requestInfo(HttpServletRequest request){
		StringBuffer sb = new StringBuffer();
		sb.append("<p>");
		sb.append("클라이언트 IP =").append(request.getRemoteAddr()).append("<br/>");
		sb.append("요청정보 길이=").append(request.getContentLength()).append("<br/>");
		sb.append("요청정보인코딩 =").append(request.getCharacterEncoding()).append("<br/>");
		sb.append("요청정보 컨텐트타입 =").append(request.getContentType()).append("<br/>");
		sb.append("요청정보 프로토콜 =").append(request.getProtocol()).append("<br/>");
		sb.append("요청정보 전송방식  =").append(request.getMethod()).append("<br/>");
		sb.append("요청 URI  =").append(request.getRequestURI()).append("<br/>");
		sb.append("컨텍스트 경로 =").append(request.getContextPath()).append("<br/>");
		sb.append("서버이름  =").append(request.getServerName()).append("<br/>");
		sb.append("서버 포트  =").append(request.getServerPort()).append("<br/>");
		return sb.toString();
	}
}

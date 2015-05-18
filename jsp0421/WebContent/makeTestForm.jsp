<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
폼에 데이터를 입력한 후 '전송'버튼을 클릭하세요
<form action="viewParameter.jsp" method="post">
이름 : <input type="text" name ="name" size="10"><br/>
주소 : <input type="text" name ="address" size="30"><br/>
좋아하는 동물:<br/>
	<input type="checkbox" name ="pet" class="inchkall" id="chkall">전체선택<br/>
	<input type="checkbox" name ="pet" value="holse" class="inchk">말
	<input type="checkbox" name ="pet" value="sheep" class="inchk">양
	<input type="checkbox" name ="pet" value="dog" class="inchk">강아지
	<input type="checkbox" name ="pet" value="pig" class="inchk">돠지
	<input type="checkbox" name ="pet" value="cat" class="inchk">고양이
	<br/>
	<input type="submit" value="전송">
</form>
</body>
</html>
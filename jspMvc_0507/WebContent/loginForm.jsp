<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 350px; margin: auto;">
		<fieldset>
			<form method="post" action="*.kosta">
			<input type = "hidden" name ="cmd" value="login">
			<input type ="hidden" name="subcmd" value="loginok">
				<table style="width:100%;">
					<tr>
						<td>ID</td>
						<td><input type="text" name ="id" id="id"></td>
					</tr>
					<tr>
						<td>PWD</td>
						<td><input type="password" name ="pwd" id="pwd"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="로그인"></td>
					</tr>				
				</table>
			</form>
		</fieldset>	
	</div>
</body>
</html>
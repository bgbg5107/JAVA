<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ������</title>
<style>
#div_box{
	position:absolute;
	top:10%;
	left:40%;
}
</style>
</head>
<body>
	<div id = "div_box">
		<h1>�α���</h1>
		<hr>
		<form name="loginForm" method="post" action="login.do">
			<table border="1" cellspacing="0" cellpadding="0">
				<tr>
					<td bgcolor="orange">���̵�</td>
					<td><input type="text" name="id"/></td>
				</tr>
				<tr>
					<td bgcolor="orange">��й�ȣ</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="�α���"/>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
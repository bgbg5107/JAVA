<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>새 게시글 등록 페이지</title>
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
		<h1>새 게시글 등록</h1>
		<a href="logout.do">로그아웃</a>
		<hr>
		<form name="insertForm" method="post" action="insertBoard.do">
			<table border="1" sellspacing="0" sellpadding="0">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align = "left"><input type="text" name="title"></td>
				</tr>
				<tr>
					<td bgcolor="orange" width="70">작성자</td>
					<td align = "left"><input type="text" name="writer"></td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align = "left"><textarea name="content" rows="10" cols="40"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="새 게시글 등록"></td>	
				</tr>
			</table>
		</form>
		<hr>
		<a href="getBoardList.do">전체 게시글 목록 보기</a>
	</div>
</body>
</html>
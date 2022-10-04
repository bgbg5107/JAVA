<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- �ڹ�Ŭ���� import -->
<%@page import="com.company.Spring_MVC_Board.board.BoardDAO"%>
<%@page import="com.company.Spring_MVC_Board.board.BoardDO"%>
<%@page import="java.util.List" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	//�ڡڡڡڡڡڡ�GetBoardController Ŭ�������� session.setAttribute("board", board); ����� �Ӽ��� ��������
	//BoardDO board = (BoardDO)session.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �󼼺��� ������</title>
<style>
#div_box{
	position:absolute;
	top:10%;
	left:40%;
}
</style>
</head>
<body>
	<div id="div_box">
		<h1>�Խñ� �󼼺���</h1>
		<a href="logout.do">�α׾ƿ�</a>
		<hr>
		<form name="getBoardForm" method="post" action="updateBoard.do">
			<input type="hidden" name="seq" value="${board.getSeq()}"/>
			<table border="1" cellspacing="0" cellpadding="0">
				<tr>
					<td bgcolor="orange" width="70">����</td>
					<td align="left"><input name="title" type="text" value="${board.title}"></td>
				</tr>
				<tr>
					<td bgcolor="orange">�ۼ���</td>
					<td align="left"><input name="writer" type="text" value="${board.writer}"></td>
				</tr>
				<tr>
					<td bgcolor="orange">����</td>
					<td align="left"><textarea name="content" rows="10" cols="40" >${board.content}</textarea></td>
				</tr>
				<tr>
					<td bgcolor="orange">�ۼ�����</td>
					<td align="left">${board.regdate}</td>
				</tr>
				<tr>
					<td bgcolor="orange">��ȸ��</td>
					<td align="left">${board.cnt}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="�Խñ� ����">
				</tr>
			</table>
		</form>
		<hr>
		<a href="insertBoard.jsp">�� �Խñ� ���</a>&nbsp;&nbsp;&nbsp;
		<a href="deleteBoard.do?seq=${board.seq}">�Խñ� ����</a>&nbsp;&nbsp;&nbsp; <!-- get������� ó�� -->
		<a href="getBoardList.do">��ü �Խñ� ��Ϻ���</a>
	</div>
</body>
</html>
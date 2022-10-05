<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- �ڹ�Ŭ���� import -->
<%@page import="com.company.Spring_MVC_Board.board.BoardDAO"%>
<%@page import="com.company.Spring_MVC_Board.board.BoardDO"%>
<%@page import="java.util.List" %>

<!--  JSTL �����ϱ� ���ؼ� -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#div_box{
	position:absolute;
	top:10%;
	left:25%;
}
</style>
</head>
<body>
	<div id="div_box">
		<h1>��ü �Խñ� ��� ����</h1>
		<h3>${idkey}�� ȯ���մϴ�.&nbsp;&nbsp;&nbsp;<a href="logout.do">�α׾ƿ�</a></h3>
		<form name="boardListForm" method="post" action="getBoardList.do">
			<p>�� �Խñ�: ${boardList.size()}��</p>
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center" width="708">
						<select name="searchCondition">
							<option value="TITLE">����
							<option value="WRITER">�ۼ���
						</select>
						<input type="text" name = "searchKeyword"/>
						<input type="submit" value="�˻�"/>
					</td>
				</tr>
			</table>
		</form>
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th bgcolor="orange" width="100">��ȣ</th>
				<th bgcolor="orange" width="200">����</th>
				<th bgcolor="orange" width="150">�ۼ���</th>
				<th bgcolor="orange" width="150">�ۼ�����</th>
				<th bgcolor="orange" width="100">��ȸ��</th>
			</tr>
			<c:forEach var="board" items="${boardList}">
				<tr>
					<td align="center">${board.getSeq()}</td>	
					<td align="center"><a href="getBoard.do?seq=${board.getSeq()}">${board.getTitle()}</a></td>
					<td align="center">${board.getWriter()}</td>
					<td align="center">${board.getRegdate()}</td>
					<td align="center">${board.getCnt()}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<a href="insertBoard.jsp">�� �Խñ� ���</a>&nbsp;&nbsp;&nbsp;
		<a href="getBoardList.do">��ü �Խñ� ��Ϻ���</a>
	</div>
</body>
</html>
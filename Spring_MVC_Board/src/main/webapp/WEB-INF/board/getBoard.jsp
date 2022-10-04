<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 자바클래스 import -->
<%@page import="com.company.Spring_MVC_Board.board.BoardDAO"%>
<%@page import="com.company.Spring_MVC_Board.board.BoardDO"%>
<%@page import="java.util.List" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	//★★★★★★★GetBoardController 클래스에서 session.setAttribute("board", board); 등록한 속성값 가져오기
	//BoardDO board = (BoardDO)session.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세보기 페이지</title>
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
		<h1>게시글 상세보기</h1>
		<a href="logout.do">로그아웃</a>
		<hr>
		<form name="getBoardForm" method="post" action="updateBoard.do">
			<input type="hidden" name="seq" value="${board.getSeq()}"/>
			<table border="1" cellspacing="0" cellpadding="0">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input name="title" type="text" value="${board.title}"></td>
				</tr>
				<tr>
					<td bgcolor="orange">작성자</td>
					<td align="left"><input name="writer" type="text" value="${board.writer}"></td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="content" rows="10" cols="40" >${board.content}</textarea></td>
				</tr>
				<tr>
					<td bgcolor="orange">작성일자</td>
					<td align="left">${board.regdate}</td>
				</tr>
				<tr>
					<td bgcolor="orange">조회수</td>
					<td align="left">${board.cnt}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="게시글 수정">
				</tr>
			</table>
		</form>
		<hr>
		<a href="insertBoard.jsp">새 게시글 등록</a>&nbsp;&nbsp;&nbsp;
		<a href="deleteBoard.do?seq=${board.seq}">게시글 삭제</a>&nbsp;&nbsp;&nbsp; <!-- get방식으로 처리 -->
		<a href="getBoardList.do">전체 게시글 목록보기</a>
	</div>
</body>
</html>
package com.company.annotation.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.company.annotation.common.JDBCUtil;

public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	//★★★★★★★★★★★★★★ 전체 게시글 목록 조회 처리 메소드★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	public List<BoardDO> getBoardList(String searchField, String searchText){
		System.out.println("==>JDBC로 getBoardList() 기능 처리");
		//ArrayList 가변 배열 객체 생성  --> 기본 10개의 객체를 저장할 공간 마련, 부족하면 자동으로 10개씩 추가
		List<BoardDO> boardList = new ArrayList<BoardDO>();
		
		try {
			conn = JDBCUtil.getConnection();
			
			String where = "";
			
			if(searchField != null && searchText != null) {
				where = "where " + searchField + " like '%" + searchText + "%'";
			}
			String BOARD_CONDITION_LIST = "select * from board " + where + " order by seq desc";
			stmt = conn.prepareStatement(BOARD_CONDITION_LIST);
			rs = stmt.executeQuery(); //select는 rs
			
			while(rs.next()) {//여러개니까 while
				BoardDO board = new BoardDO();
				
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegdate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				
				boardList.add(board); //리스트만들어서 거기에 게시글 계속 추가
			}
		}catch(Exception e) {
			System.out.println("getBoardList() " + e);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return boardList;
	}
	//end getBoardList()==============================================================================
	
	//사용자가 제목을 클릭하면 선택한 게시글 상세보기 메소드 구현
	public BoardDO getBoard(BoardDO boardDO) {
		System.out.println("===> JDBC로 getBoard() 기능처리 완료");
		BoardDO board = null;
		
		try {
			conn = JDBCUtil.getConnection();
			
			//1. 어느 게시글의 제목 클릭하면 조회수 1증가(update)
			String UPDATE_CNT = "update board set cnt=cnt+1 where seq=?";
			stmt = conn.prepareStatement(UPDATE_CNT);
			stmt.setInt(1, boardDO.getSeq());
			stmt.executeUpdate();
			
			//2. 해당 게시글 가져오기
			String BOARD_GET = "select * from board where seq=?";
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, boardDO.getSeq());
			rs = stmt.executeQuery();
			if(rs.next()) {
				board = new BoardDO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegdate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
			}
		}catch(Exception e) {
			System.out.println("getBoard() " + e);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return board;
	}
	/*=================================================================================*/
	//게시글 수정 처리 메소드 구현
	public void updateBoard(BoardDO boardDO) {
		System.out.println("===> JDBC로 updateBoard() 기능처리 완료");
		
		try {
			conn = JDBCUtil.getConnection();

			String UPDATE_BOARD = "update board set title=?, content=? where seq=?";
			stmt = conn.prepareStatement(UPDATE_BOARD);
			stmt.setString(1, boardDO.getTitle());
			stmt.setString(2, boardDO.getContent());
			stmt.setInt(3, boardDO.getSeq());
			stmt.executeUpdate();

		}catch(Exception e) {
			System.out.println("updateBoard() " + e);
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
	}
	
	/*=============================================================================================*/
	//게시글 삭제 처리 메소드 구현
	public void deleteBoard(BoardDO boardDO) {
		System.out.println("===>JDBC로 deleteBoard() 기능처리 완료");
		try {
			conn = JDBCUtil.getConnection();
			
			String DELETE_BOARD = "delete from board where seq=?";
			stmt = conn.prepareStatement(DELETE_BOARD);
			stmt.setInt(1, boardDO.getSeq());
			stmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("deleteBoard() " + e);
		}finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	/*****************************************************************************************************/
	//게시글 등록 메소드 구현
	public void insertBoard(BoardDO boardDO) {
		System.out.println("===>JDBC로 insertBoard() 기능 처리 완료");
		try {
			conn = JDBCUtil.getConnection();
			
			String INSERT_BOARD = "insert into board(seq,title,writer,content) values((select nvl(max(seq),0)+1 from board),?,?,?)";
			stmt = conn.prepareStatement(INSERT_BOARD);
			stmt.setString(1, boardDO.getTitle());
			stmt.setString(2, boardDO.getWriter());
			stmt.setString(3, boardDO.getContent());
			stmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("insertBoard() " + e);
		}finally {
			JDBCUtil.close(stmt, conn);
		}
	}
}

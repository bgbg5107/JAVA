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
	
	//�ڡڡڡڡڡڡڡڡڡڡڡڡڡ� ��ü �Խñ� ��� ��ȸ ó�� �޼ҵ�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
	public List<BoardDO> getBoardList(String searchField, String searchText){
		System.out.println("==>JDBC�� getBoardList() ��� ó��");
		//ArrayList ���� �迭 ��ü ����  --> �⺻ 10���� ��ü�� ������ ���� ����, �����ϸ� �ڵ����� 10���� �߰�
		List<BoardDO> boardList = new ArrayList<BoardDO>();
		
		try {
			conn = JDBCUtil.getConnection();
			
			String where = "";
			
			if(searchField != null && searchText != null) {
				where = "where " + searchField + " like '%" + searchText + "%'";
			}
			String BOARD_CONDITION_LIST = "select * from board " + where + " order by seq desc";
			stmt = conn.prepareStatement(BOARD_CONDITION_LIST);
			rs = stmt.executeQuery(); //select�� rs
			
			while(rs.next()) {//�������ϱ� while
				BoardDO board = new BoardDO();
				
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegdate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				
				boardList.add(board); //����Ʈ���� �ű⿡ �Խñ� ��� �߰�
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
	
	//����ڰ� ������ Ŭ���ϸ� ������ �Խñ� �󼼺��� �޼ҵ� ����
	public BoardDO getBoard(BoardDO boardDO) {
		System.out.println("===> JDBC�� getBoard() ���ó�� �Ϸ�");
		BoardDO board = null;
		
		try {
			conn = JDBCUtil.getConnection();
			
			//1. ��� �Խñ��� ���� Ŭ���ϸ� ��ȸ�� 1����(update)
			String UPDATE_CNT = "update board set cnt=cnt+1 where seq=?";
			stmt = conn.prepareStatement(UPDATE_CNT);
			stmt.setInt(1, boardDO.getSeq());
			stmt.executeUpdate();
			
			//2. �ش� �Խñ� ��������
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
	//�Խñ� ���� ó�� �޼ҵ� ����
	public void updateBoard(BoardDO boardDO) {
		System.out.println("===> JDBC�� updateBoard() ���ó�� �Ϸ�");
		
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
	//�Խñ� ���� ó�� �޼ҵ� ����
	public void deleteBoard(BoardDO boardDO) {
		System.out.println("===>JDBC�� deleteBoard() ���ó�� �Ϸ�");
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
	//�Խñ� ��� �޼ҵ� ����
	public void insertBoard(BoardDO boardDO) {
		System.out.println("===>JDBC�� insertBoard() ��� ó�� �Ϸ�");
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

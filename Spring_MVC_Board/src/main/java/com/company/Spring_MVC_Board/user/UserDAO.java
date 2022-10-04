package com.company.Spring_MVC_Board.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.company.Spring_MVC_Board.common.JDBCUtil;

public class UserDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	//�α��� ����ó�� SQL ����
	private final String USER_GET = "select id, password from users where id=? and password=?";
	
	public UserDO getUser(UserDO userDO) {
		UserDO user = null;
		
		try {
			System.out.println("===> JDBC�� getUser() ��� ó��");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, userDO.getId());
			stmt.setString(2, userDO.getPassword());			
			rs = stmt.executeQuery();
			
			if(rs.next()) { //��������
				user = new UserDO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));

			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return user;
	}
}

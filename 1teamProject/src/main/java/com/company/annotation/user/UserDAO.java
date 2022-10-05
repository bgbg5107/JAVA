package com.company.annotation.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.company.annotation.user.UserDTO;

public class UserDAO{
		
		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		public int login(String Userid, String Pwd) {
			String SQL= "SELECT pwd FROM memberDB WHERE userid= ?";
			try {
				pstmt= conn.prepareStatement(SQL);
				pstmt.setString(1, Userid);
				rs= pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(Pwd))
						return 1; // 로그인 성공
					else
						return 0; // 비밀번호 불일치
				}
				return -1; // 아이디 없음
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -2; //DB연결 오류
		}		
		
		public int join(UserDTO dto){
			String SQL= "INSERT INTO memberDB VALUES (?,?,?,?,?)";
		      try {		         
		         pstmt = conn.prepareStatement(SQL);   
		         pstmt.setString(1, dto.getName());
		         pstmt.setString(2, dto.getUserid());
		         pstmt.setString(3, dto.getPwd());
		         pstmt.setString(4, dto.getEmail_id()+"@"+dto.getEmail_domain());
		         pstmt.setString(5, dto.getPhone()); 
		         
		         return pstmt.executeUpdate();
		      } catch (Exception e) {
		    	  e.printStackTrace();
		      }
		      return -1;
		   }
		
	}
	
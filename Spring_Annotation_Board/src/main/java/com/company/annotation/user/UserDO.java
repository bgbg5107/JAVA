package com.company.annotation.user;

public class UserDO {
	//멤버필드(프로퍼티, 중간저장소)
	private String id;	//아이디
	private String password;	//패스워드
	private String name;	//이름
	private String role;	//역할(관리자,일반유저)
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
}

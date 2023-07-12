package com.web.root.member.dto;
/*
CREATE TABLE member(
id NVARCHAR2(15) PRIMARY KEY,
pwd NVARCHAR2(16) NOT NULL,
nickname NVARCHAR2(30) NOT NULL,
phone NVARCHAR2(11) NOT NULL,
email NVARCHAR2(50) NOT NULL,
addr NVARCHAR2(50) NOT NULL
);
 */
public class MemberDTO {

	// 속성(property)
	private String id;
	private String pwd;
	private String nickname;
	private String phone;
	private String email;
	private String addr;
	
	
	// getter와 setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
	
}

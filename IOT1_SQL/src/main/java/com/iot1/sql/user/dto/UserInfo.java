package com.iot1.sql.user.dto;

import org.springframework.stereotype.Component;

@Component
public class UserInfo {
	private String userId;
	private String userPwd;
	private String userName;
	private String age;
	private String address;
	private String hp1;
	private String hp2;
	private String hp3;
	private String userrolelevel;
	private String gender;
	private int userNum;
	private int departnum;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getUserrolelevel() {
		return userrolelevel;
	}
	public void setUserrolelevel(String userrolelevel) {
		this.userrolelevel = userrolelevel;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getDepartnum() {
		return departnum;
	}
	public void setDepartnum(int departnum) {
		this.departnum = departnum;
	}

}

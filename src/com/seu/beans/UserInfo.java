package com.seu.beans;

public class UserInfo {
	private String name;
	private String num;
	private String mail;
	private String department;
	
	public UserInfo(){};
	
	public UserInfo(String name,String num,String email){
		super();
		this.name=name;
		this.num=num;
		this.mail=email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	
	
	
}

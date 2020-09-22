package com.seu.beans;

public class MessageInfo {
	private String message;
	private String person;
	private String state;
	
	public MessageInfo(){}
	
	
	public MessageInfo(String message, String person, String state) {
		super();
		this.message = message;
		this.person = person;
		this.state = state;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}

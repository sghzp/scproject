package com.seu.beans;

public class LogInfo implements Comparable<LogInfo>{
	String time;
	String datalog;
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDatalog() {
		return datalog;
	}
	public void setDatalog(String datalog) {
		this.datalog = datalog;
	}
	@Override
	public int compareTo(LogInfo w) {
		String s1 = w.getTime();
		String s2 = this.getTime();
		long n1 = Long.parseLong(s1);
		long n2 = Long.parseLong(s2);
		if(n1<n2){
			return -1;
		}
		if(n1 == n2){
			return 0;
		}
		if(n1 > n2){
			return 1;
		}
		return 0;
	}
}

package com.seu.beans;


public class WriteRecordInfo implements Comparable<WriteRecordInfo>{
	String ecuid;
	String ecusn;
	String iqa;
	String hex;
	String ini;
	String ecutype;
	String ecuorder;
	String obdtype;
	String obdmanufacturer;
	String ecudate;
	String location;
	public String getEcuid() {
		return ecuid;
	}
	public void setEcuid(String ecuid) {
		this.ecuid = ecuid;
	}
	public String getEcusn() {
		return ecusn;
	}
	public void setEcusn(String ecusn) {
		this.ecusn = ecusn;
	}
	public String getIqa() {
		return iqa;
	}
	public void setIqa(String iqa) {
		this.iqa = iqa;
	}
	public String getHex() {
		return hex;
	}
	public void setHex(String hex) {
		this.hex = hex;
	}
	public String getIni() {
		return ini;
	}
	public void setIni(String ini) {
		this.ini = ini;
	}
	public String getEcutype() {
		return ecutype;
	}
	public void setEcutype(String ecutype) {
		this.ecutype = ecutype;
	}
	public String getEcuorder() {
		return ecuorder;
	}
	public void setEcuorder(String ecuorder) {
		this.ecuorder = ecuorder;
	}
	public String getObdtype() {
		return obdtype;
	}
	public void setObdtype(String obdtype) {
		this.obdtype = obdtype;
	}
	public String getObdmanufacturer() {
		return obdmanufacturer;
	}
	public void setObdmanufacturer(String obdmanufacturer) {
		this.obdmanufacturer = obdmanufacturer;
	}
	public String getEcudate() {
		return ecudate;
	}
	public void setEcudate(String ecudate) {
		this.ecudate = ecudate;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getParafile() {
		return parafile;
	}
	public void setParafile(String parafile) {
		this.parafile = parafile;
	}
	public String getEdittime() {
		return edittime;
	}
	public void setEdittime(String edittime) {
		this.edittime = edittime;
	}
	String operator;
	String parafile;
	String edittime;

	@Override
	public int compareTo(WriteRecordInfo w) {
		String s1 = w.getEcudate().replaceAll(":", "").replaceAll(" ", "").replaceAll("-", "");
		String s2 = this.getEcudate().replaceAll(":", "").replaceAll(" ", "").replaceAll("-", "");
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
	
/*	public static void main(String[] args){
		WriteRecordInfo w1 = new WriteRecordInfo();
		WriteRecordInfo w2 = new WriteRecordInfo();
		w1.setEcudate("2014-05-08 09:47:55");
		w2.setEcudate("2014-05-08 09:47:55");
		System.out.println(w1.compareTo(w2));
	}*/
	
}

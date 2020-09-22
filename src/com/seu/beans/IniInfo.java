package com.seu.beans;

public class IniInfo {
	private int INIID;
	private String HEXParentID;
	private int State;
	private String ECUType;
	private String ECUOrder;
	private int Times;
	private String INIFile;
	private String CanWriteTimes;
	private String EditDate;
	private String Cflj;
	private String Sbm;
	private String Zcbm;
	private String Sjljh;
	private String Scrgh;
	private String Scr;
	private String Xgr;
	private String Shzt;
	private String Shr;
	private String Shrq;
	private String Scrq;
	private String Bz1;
	private String Bz2;
	private String Bz3;//是否在流程中。   1代表在，0代表不在
	private String Bz4;//是否发送过通知邮件,1代表已发送，其他就是未发送
	private String Bz5;
	private String Bz6;
	private String Bz7;
	private String Bz8;
	private String Bz9;
	private String Yxq;
	private int Downloadtimes;
	
	
	
	public String getBz3() {
		return Bz3;
	}
	public void setBz3(String bz3) {
		Bz3 = bz3;
	}
	public String getBz4() {
		return Bz4;
	}
	public void setBz4(String bz4) {
		Bz4 = bz4;
	}
	public String getBz5() {
		return Bz5;
	}
	public void setBz5(String bz5) {
		Bz5 = bz5;
	}
	public String getBz6() {
		return Bz6;
	}
	public void setBz6(String bz6) {
		Bz6 = bz6;
	}
	public String getBz7() {
		return Bz7;
	}
	public void setBz7(String bz7) {
		Bz7 = bz7;
	}
	public String getBz8() {
		return Bz8;
	}
	public void setBz8(String bz8) {
		Bz8 = bz8;
	}
	public String getBz9() {
		return Bz9;
	}
	public void setBz9(String bz9) {
		Bz9 = bz9;
	}
	public String getYxq() {
		return Yxq;
	}
	public void setYxq(String yxq) {
		Yxq = yxq;
	}
	public int getDownloadtimes() {
		return Downloadtimes;
	}
	public void setDownloadtimes(int downloadtimes) {
		Downloadtimes = downloadtimes;
	}
	public String getBz1() {
		return Bz1;
	}
	public void setBz1(String bz1) {
		Bz1 = bz1;
	}
	public String getBz2() {
		return Bz2;
	}
	public void setBz2(String bz2) {
		Bz2 = bz2;
	}
	
	
	
	public int getINIID() {
		return INIID;
	}
	public void setINIID(int iNIID) {
		INIID = iNIID;
	}
	public String getHEXParentID() {
		return HEXParentID;
	}
	public void setHEXParentID(String hEXParentID) {
		HEXParentID = hEXParentID;
	}
	public int getState() {
		return State;
	}
	public void setState(int state) {
		State = state;
	}
	public String getECUType() {
		return ECUType;
	}
	public void setECUType(String eCUType) {
		ECUType = eCUType;
	}
	public String getECUOrder() {
		return ECUOrder;
	}
	public void setECUOrder(String eCUOrder) {
		ECUOrder = eCUOrder;
	}
	public int getTimes() {
		return Times;
	}
	public void setTimes(int times) {
		Times = times;
	}
	public String getINIFile() {
		return INIFile;
	}
	public void setINIFile(String iNIFile) {
		INIFile = iNIFile;
	}
	public String getCanWriteTimes() {
		return CanWriteTimes;
	}
	public void setCanWriteTimes(String canWriteTimes) {
		CanWriteTimes = canWriteTimes;
	}
	public String getEditDate() {
		return EditDate;
	}
	public void setEditDate(String editDate) {
		EditDate = editDate;
	}
	public String getCflj() {
		return Cflj;
	}
	public void setCflj(String cflj) {
		Cflj = cflj;
	}
	public String getSbm() {
		return Sbm;
	}
	public void setSbm(String sbm) {
		Sbm = sbm;
	}
	public String getZcbm() {
		return Zcbm;
	}
	public void setZcbm(String zcbm) {
		Zcbm = zcbm;
	}
	public String getSjljh() {
		return Sjljh;
	}
	public void setSjljh(String sjljh) {
		Sjljh = sjljh;
	}
	public String getScrgh() {
		return Scrgh;
	}
	public void setScrgh(String scrgh) {
		Scrgh = scrgh;
	}
	public String getScr() {
		return Scr;
	}
	public void setScr(String scr) {
		Scr = scr;
	}
	public String getXgr() {
		return Xgr;
	}
	public void setXgr(String xgr) {
		Xgr = xgr;
	}
	public String getShzt() {
		return Shzt;
	}
	public void setShzt(String shzt) {
		Shzt = shzt;
	}
	public String getShr() {
		return Shr;
	}
	public void setShr(String shr) {
		Shr = shr;
	}
	public String getShrq() {
		return Shrq;
	}
	public void setShrq(String shrq) {
		Shrq = shrq;
	}
	public String getScrq() {
		return Scrq;
	}

	public void setScrq(String scrq) {
		Scrq = scrq;
	}
	@Override
	public String toString() {
		return "IniInfo [INIID=" + INIID + ", HEXParentID=" + HEXParentID
				+ ", State=" + State + ", ECUType=" + ECUType + ", ECUOrder="
				+ ECUOrder + ", Times=" + Times + ", INIFile=" + INIFile
				+ ", CanWriteTimes=" + CanWriteTimes + ", EditDate=" + EditDate
				+ ", Cflj=" + Cflj + ", Sbm=" + Sbm + ", Zcbm=" + Zcbm
				+ ", Sjljh=" + Sjljh + ", Scrgh=" + Scrgh + ", Scr=" + Scr
				+ ", Xgr=" + Xgr + ", Shzt=" + Shzt + ", Shr=" + Shr
				+ ", Shrq=" + Shrq + ", Scrq=" + Scrq + ", Bz1=" + Bz1
				+ ", Bz2=" + Bz2 + "]";
	}
	
	
	
	
	
	
}

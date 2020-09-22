package com.seu.beans;

//import java.io.Serializable;

public class HexInfo{
	private int HEXID;
	private String Version;
	private int state;//-1">空         0">正常        1">临时           2">套牌        3">备份       4">停用       5">临时超限
	private String ECUType;
	private int Times;
	private String HEXFile;
	private String PfileName;
	private String KeyDataFileName;
	private String SBLFileName;
	private String SREFileName;
	private String CanWriteTimes;
	private String EditDate;
	private String Bh;
	private String wtdbgdbh;
	private String jqyawdcgq;
	private String fdjxh;
	private String sjljh;
	private String yt;
	private String ggg;
	private String zdnj;
	private String dsnj;
	private String zyqxh;
	private String pyqxh;
	private String Zdds;
	private String ysflywkg;
	private String sgk;
	private String sgkkg;
	private String jqyl;
	private String gdclhqd;
	private String hclcj;
	private String cflj;
	private String Bz1;
	private String Bz2;
	private String Bz3;
	private String Bz4;
	private String Bz5;
	private String scz;
	private String scrq;
	private String Shzt;
	private String Shr;
	private String Shrq;
	private String Bz6;//是否在流程中。   1代表在，0代表不在
	private String Bz7;//是否发送过通知邮件,1代表已发送，其他就是未发送
	private String Bz8;
	private String Bz9;
	private String Yxq;
	private int Downloadtimes;
	
	
	public int getHEXID() {
		return HEXID;
	}
	public void setHEXID(int hEXID) {
		HEXID = hEXID;
	}
	public String getVersion() {
		return Version;
	}
	public void setVersion(String version) {
		Version = version;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getECUType() {
		return ECUType;
	}
	public void setECUType(String eCUType) {
		ECUType = eCUType;
	}
	public int getTimes() {
		return Times;
	}
	public void setTimes(int times) {
		Times = times;
	}
	public String getHEXFile() {
		return HEXFile;
	}
	public void setHEXFile(String hEXFile) {
		HEXFile = hEXFile;
	}
	public String getPfileName() {
		return PfileName;
	}
	public void setPfileName(String pfileName) {
		PfileName = pfileName;
	}
	public String getKeyDataFileName() {
		return KeyDataFileName;
	}
	public void setKeyDataFileName(String keyDataFileName) {
		KeyDataFileName = keyDataFileName;
	}
	public String getSBLFileName() {
		return SBLFileName;
	}
	public void setSBLFileName(String sBLFileName) {
		SBLFileName = sBLFileName;
	}
	public String getSREFileName() {
		return SREFileName;
	}
	public void setSREFileName(String sREFileName) {
		SREFileName = sREFileName;
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
	public String getBh() {
		return Bh;
	}
	public void setBh(String bh) {
		Bh = bh;
	}
	public String getWtdbgdbh() {
		return wtdbgdbh;
	}
	public void setWtdbgdbh(String wtdbgdbh) {
		this.wtdbgdbh = wtdbgdbh;
	}
	public String getJqyawdcgq() {
		return jqyawdcgq;
	}
	public void setJqyawdcgq(String jqyawdcgq) {
		this.jqyawdcgq = jqyawdcgq;
	}
	public String getFdjxh() {
		return fdjxh;
	}
	public void setFdjxh(String fdjxh) {
		this.fdjxh = fdjxh;
	}
	public String getSjljh() {
		return sjljh;
	}
	public void setSjljh(String sjljh) {
		this.sjljh = sjljh;
	}
	public String getYt() {
		return yt;
	}
	public void setYt(String yt) {
		this.yt = yt;
	}
	public String getGgg() {
		return ggg;
	}
	public void setGgg(String ggg) {
		this.ggg = ggg;
	}
	public String getZdnj() {
		return zdnj;
	}
	public void setZdnj(String zdnj) {
		this.zdnj = zdnj;
	}
	public String getDsnj() {
		return dsnj;
	}
	public void setDsnj(String dsnj) {
		this.dsnj = dsnj;
	}
	public String getZyqxh() {
		return zyqxh;
	}
	public void setZyqxh(String zyqxh) {
		this.zyqxh = zyqxh;
	}
	public String getPyqxh() {
		return pyqxh;
	}
	public void setPyqxh(String pyqxh) {
		this.pyqxh = pyqxh;
	}
	public String getZdds() {
		return Zdds;
	}
	public void setZdds(String zdds) {
		Zdds = zdds;
	}
	public String getYsflywkg() {
		return ysflywkg;
	}
	public void setYsflywkg(String ysflywkg) {
		this.ysflywkg = ysflywkg;
	}
	public String getSgk() {
		return sgk;
	}
	public void setSgk(String sgk) {
		this.sgk = sgk;
	}
	public String getSgkkg() {
		return sgkkg;
	}
	public void setSgkkg(String sgkkg) {
		this.sgkkg = sgkkg;
	}
	public String getJqyl() {
		return jqyl;
	}
	public void setJqyl(String jqyl) {
		this.jqyl = jqyl;
	}
	public String getGdclhqd() {
		return gdclhqd;
	}
	public void setGdclhqd(String gdclhqd) {
		this.gdclhqd = gdclhqd;
	}
	public String getHclcj() {
		return hclcj;
	}
	public void setHclcj(String hclcj) {
		this.hclcj = hclcj;
	}
	public String getCflj() {
		return cflj;
	}
	public void setCflj(String cflj) {
		this.cflj = cflj;
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
	public String getScz() {
		return scz;
	}
	public void setScz(String scz) {
		this.scz = scz;
	}
	public String getScrq() {
		return scrq;
	}
	public void setScrq(String scrq) {
		this.scrq = scrq;
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
	@Override
	public String toString() {
		return "HexInfo [HEXID=" + HEXID + ", Version=" + Version + ", state="
				+ state + ", ECUType=" + ECUType + ", Times=" + Times
				+ ", HEXFile=" + HEXFile + ", PfileName=" + PfileName
				+ ", KeyDataFileName=" + KeyDataFileName + ", SBLFileName="
				+ SBLFileName + ", SREFileName=" + SREFileName
				+ ", CanWriteTimes=" + CanWriteTimes + ", EditDate=" + EditDate
				+ ", Bh=" + Bh + ", wtdbgdbh=" + wtdbgdbh + ", jqyawdcgq="
				+ jqyawdcgq + ", fdjxh=" + fdjxh + ", sjljh=" + sjljh + ", yt="
				+ yt + ", ggg=" + ggg + ", zdnj=" + zdnj + ", dsnj=" + dsnj
				+ ", zyqxh=" + zyqxh + ", pyqxh=" + pyqxh + ", Zdds=" + Zdds
				+ ", ysflywkg=" + ysflywkg + ", sgk=" + sgk + ", sgkkg="
				+ sgkkg + ", jqyl=" + jqyl + ", gdclhqd=" + gdclhqd
				+ ", hclcj=" + hclcj + ", cflj=" + cflj + ", Bz1=" + Bz1
				+ ", Bz2=" + Bz2 + ", Bz3=" + Bz3 + ", Bz4=" + Bz4 + ", Bz5="
				+ Bz5 + ", scz=" + scz + ", scrq=" + scrq + ", Shzt=" + Shzt
				+ ", Shr=" + Shr + ", Shrq=" + Shrq + "]";
	}
	
	
	
}

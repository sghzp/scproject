package com.seu.beans;

public class MesInfo {
	private String Num;
	private int Style;//0为数据零件号申请，1为整车信息申请
	private String Sqrq;
	private String Sqrgh;
	private String Sqr;
	private String Sjljh;
	private String Version;
	private int Oristate;
	private int dststate;
	private String sqsm;
	private String Bz;
	private String Bz1;
	private String Bz2;
	private String Bz3;
	private String Bz4;
	private String Bz5;
	private String clrgh;
	private String Clr;
	private int Clzt;//0为待处理，1为处理完毕  ,2为驳回状态 int改为（0-待处理，1-审核通过，2-驳回状态，3-撤销审核，4-撤销申请）
	private String Clzk;
	private String FJ1;
	private String FJ2;
	private String FJ3;
	public String getNum() {
		return Num;
	}
	public void setNum(String num) {
		Num = num;
	}
	public int getStyle() {
		return Style;
	}
	public void setStyle(int style) {
		Style = style;
	}
	public String getSqrq() {
		return Sqrq;
	}
	public void setSqrq(String sqrq) {
		Sqrq = sqrq;
	}
	public String getSqrgh() {
		return Sqrgh;
	}
	public void setSqrgh(String sqrgh) {
		Sqrgh = sqrgh;
	}
	public String getSqr() {
		return Sqr;
	}
	public void setSqr(String sqr) {
		Sqr = sqr;
	}
	public String getSjljh() {
		return Sjljh;
	}
	public void setSjljh(String sjljh) {
		Sjljh = sjljh;
	}
	public String getVersion() {
		return Version;
	}
	public void setVersion(String version) {
		Version = version;
	}
	public int getOristate() {
		return Oristate;
	}
	public void setOristate(int oristate) {
		Oristate = oristate;
	}
	public int getDststate() {
		return dststate;
	}
	public void setDststate(int dststate) {
		this.dststate = dststate;
	}
	public String getSqsm() {
		return sqsm;
	}
	public void setSqsm(String sqsm) {
		this.sqsm = sqsm;
	}
	public String getBz() {
		return Bz;
	}
	public void setBz(String bz) {
		Bz = bz;
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
	public String getClrgh() {
		return clrgh;
	}
	public void setClrgh(String clrgh) {
		this.clrgh = clrgh;
	}
	public String getClr() {
		return Clr;
	}
	public void setClr(String clr) {
		Clr = clr;
	}
	public int getClzt() {
		return Clzt;
	}
	public void setClzt(int clzt) {
		Clzt = clzt;
	}
	public String getClzk() {
		return Clzk;
	}
	public void setClzk(String clzk) {
		Clzk = clzk;
	}
	public String getFJ1() {
		return FJ1;
	}
	public void setFJ1(String fJ1) {
		FJ1 = fJ1;
	}
	public String getFJ2() {
		return FJ2;
	}
	public void setFJ2(String fJ2) {
		FJ2 = fJ2;
	}
	public String getFJ3() {
		return FJ3;
	}
	public void setFJ3(String fJ3) {
		FJ3 = fJ3;
	}
	
	public String getOristate_zhongwen(){
		if(getOristate() == -1){
			return "空";
		}
		if(getOristate() == 0){
			return "正常";
		}
		if(getOristate() == 1){
			return "临时";
		}
		if(getOristate() == 2){
			return "套牌";
		}
		if(getOristate() == 3){
			return "备份";
		}
		if(getOristate() == 4){
			return "停用";
		}
		if(getOristate() == 5){
			return "临时超限";
		}
		return "";
	}
	public String getDststate_zhongwen(){
		if(getDststate() == -1){
			return "空";
		}
		if(getDststate() == 0){
			return "正常";
		}
		if(getDststate() == 1){
			return "临时";
		}
		if(getDststate() == 2){
			return "套牌";
		}
		if(getDststate() == 3){
			return "备份";
		}
		if(getDststate() == 4){
			return "停用";
		}
		if(getDststate() == 5){
			return "临时超限";
		}
		return "";
	}
	
	
	
	
	
	
}

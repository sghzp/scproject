package com.seu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.seu.beans.HexInfo;
import com.seu.beans.IniInfo;
import com.seu.dao.IniInfoDao;
import com.seu.jdbc.JdbcUtils;
import com.seu.jdbc.MaxId;

public class IniInfoDaoImpl implements IniInfoDao{

	@Override
	public boolean addIniInfo(IniInfo iniInfo) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try{
			conn = JdbcUtils.getConnection();
			String sql = "insert into INIINFO(HEXParentID,State,ECUType,ECUOrder,Times,INIFile,CanWriteTimes,EditDate,Cflj,Sbm,Zcbm,Sjljh,Scrgh,Scr,Xgr,Shzt,Shr,Shrq,Scrq,Bz1,Bz2,iniid,Bz3,Bz4,Bz5,Bz6,Bz7,Bz8,Bz9,Yxq,Downloadtimes)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, iniInfo.getHEXParentID());
			ps.setInt(2,  iniInfo.getState());
			ps.setString(3,  iniInfo.getECUType());
			ps.setString(4,  iniInfo.getECUOrder());
			ps.setInt(5,  iniInfo.getTimes());
			ps.setString(6,  iniInfo.getINIFile());
			ps.setString(7,  iniInfo.getCanWriteTimes());
			ps.setString(8,  iniInfo.getEditDate());
			ps.setString(9,  iniInfo.getCflj());
			ps.setString(10,  iniInfo.getSbm());
			ps.setString(11,  iniInfo.getZcbm());			
			ps.setString(12,  iniInfo.getSjljh());
			ps.setString(13,  iniInfo.getScrgh());
			ps.setString(14,  iniInfo.getScr());
			ps.setString(15,  iniInfo.getXgr());
			ps.setString(16,  iniInfo.getShzt());
			ps.setString(17,  iniInfo.getShr());
			ps.setString(18,  iniInfo.getShrq());
			ps.setString(19,  iniInfo.getScrq());
			ps.setString(20,  iniInfo.getBz1());
			ps.setString(21,  iniInfo.getBz2());
			ps.setInt(22, MaxId.Getmaxid("iniinfo", "iniid"));
			
			ps.setString(23,  iniInfo.getBz3());
			ps.setString(24,  iniInfo.getBz4());
			ps.setString(25,  iniInfo.getBz5());
			ps.setString(26,  iniInfo.getBz6());
			ps.setString(27,  iniInfo.getBz7());
			ps.setString(28,  iniInfo.getBz8());
			ps.setString(29,  iniInfo.getBz9());
			ps.setString(30,  iniInfo.getYxq());
			ps.setInt(31,  iniInfo.getDownloadtimes());
			
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		
		return true;
	}

	@Override
	public void delete(int iniid) {
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = JdbcUtils.getConnection();
			String sql ="delete from INIINFO where INIID="+iniid;
			ps = conn.prepareStatement(sql);
			ps.execute();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
	}

	@Override
	/**
	 * 更新方法。应用于修改页面。
	 * 不应该更新，上传时间、上传人。可刷写次数、times等信息。
	 * 
	 */
	public boolean updateIniInfo(IniInfo iniInfo) {
		Connection conn = null;
		PreparedStatement ps = null;
		int iniId = iniInfo.getINIID();
		System.out.println("wosjo"+iniId);
		try{
			conn = JdbcUtils.getConnection();
			String sql = "update INIINFO set HEXParentID=?, State=?, ECUType=?, ECUOrder=?, Times=?, INIFile=?, CanWriteTimes=?, EditDate=?, Cflj=?, Sbm=?, Zcbm=?, Sjljh=?, Scrgh=?, Scr=?, Xgr=?, Shzt=?, Shr=?, Shrq=?, Scrq=?, Bz1=?, Bz2=?, Bz3=?, Bz4=?, Bz5=?, Bz6=?, Bz7=?, Bz8=?, Bz9=?, Yxq=?, Downloadtimes=? where INIID="+iniId;
			ps = conn.prepareStatement(sql);
			ps.setString(1, iniInfo.getHEXParentID());
			ps.setInt(2,  iniInfo.getState());
			ps.setString(3,  iniInfo.getECUType());
			ps.setString(4,  iniInfo.getECUOrder());
			ps.setInt(5,  iniInfo.getTimes());
			ps.setString(6,  iniInfo.getINIFile());
			ps.setString(7,  iniInfo.getCanWriteTimes());
			ps.setString(8,  iniInfo.getEditDate());
			ps.setString(9,  iniInfo.getCflj());
			ps.setString(10,  iniInfo.getSbm());
			ps.setString(11,  iniInfo.getZcbm());			
			ps.setString(12,  iniInfo.getSjljh());
			ps.setString(13,  iniInfo.getScrgh());
			ps.setString(14,  iniInfo.getScr());
			ps.setString(15,  iniInfo.getXgr());
			ps.setString(16,  iniInfo.getShzt());
			ps.setString(17,  iniInfo.getShr());
			ps.setString(18,  iniInfo.getShrq());
			ps.setString(19,  iniInfo.getScrq());
			ps.setString(20,  iniInfo.getBz1());
			ps.setString(21,  iniInfo.getBz2());
			
			ps.setString(22, iniInfo.getBz3());
			ps.setString(23, iniInfo.getBz4());
			ps.setString(24, iniInfo.getBz5());
			ps.setString(25, iniInfo.getBz6());
			ps.setString(26, iniInfo.getBz7());
			ps.setString(27, iniInfo.getBz8());
			ps.setString(28, iniInfo.getBz9());
			ps.setString(29, iniInfo.getYxq());
			ps.setInt(30, iniInfo.getDownloadtimes());
	
			ps.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		
		
		return true;
	}
	
	public IniInfo query(int iniid){//根据iniid，返回查询的结果集合
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		IniInfo iniInfo = new IniInfo();
		String sql = "select * from INIINFO where INIID="+iniid;
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				
				iniInfo.setINIID(rs.getInt("INIID"));
				iniInfo.setHEXParentID(rs.getString("HEXParentID"));
				iniInfo.setState(rs.getInt("state"));
				iniInfo.setECUType(rs.getString("ECUType"));
				iniInfo.setECUOrder(rs.getString("ECUOrder"));
				iniInfo.setTimes(rs.getInt("Times"));
				iniInfo.setINIFile(rs.getString("INIFile"));
				iniInfo.setCanWriteTimes(rs.getString("CanWriteTimes"));
				iniInfo.setEditDate(rs.getString("EditDate"));
				iniInfo.setCflj(rs.getString("Cflj"));
				iniInfo.setSbm(rs.getString("Sbm"));
				iniInfo.setZcbm(rs.getString("Zcbm"));
				iniInfo.setSjljh(rs.getString("Sjljh"));
				iniInfo.setScrgh(rs.getString("Scrgh"));
				iniInfo.setScr(rs.getString("Scr"));
				iniInfo.setXgr(rs.getString("Xgr"));
				iniInfo.setShzt(rs.getString("Shzt"));
				iniInfo.setShr(rs.getString("Shr"));
				iniInfo.setShrq(rs.getString("Shrq"));
				iniInfo.setScrq(rs.getString("Scrq"));
				iniInfo.setBz1(rs.getString("Bz1"));
				iniInfo.setBz2(rs.getString("Bz2"));
				
				iniInfo.setBz3(rs.getString("Bz3"));
				iniInfo.setBz4(rs.getString("Bz4"));
				iniInfo.setBz5(rs.getString("Bz5"));
				iniInfo.setBz6(rs.getString("Bz6"));
				iniInfo.setBz7(rs.getString("Bz7"));
				iniInfo.setBz8(rs.getString("Bz8"));
				iniInfo.setBz9(rs.getString("Bz9"));
				iniInfo.setYxq(rs.getString("Yxq"));
				iniInfo.setDownloadtimes(rs.getInt("Downloadtimes"));
				
				//hexInfos.add(hexInfo);
				//System.out.println("++++++++");
				//System.out.println(hexInfos.get(0));
				//System.out.println("111111111");

			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		
		return iniInfo;
				
	}
	
	public ArrayList<IniInfo> query(String sql){//根据一条查询语句，返回查询的结果集合
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<IniInfo> iniInfos = new ArrayList<IniInfo>(); 
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				IniInfo iniInfo = new IniInfo();
				
				iniInfo.setINIID(rs.getInt("INIID"));
				iniInfo.setHEXParentID(rs.getString("HEXParentID"));
				iniInfo.setState(rs.getInt("state"));
				iniInfo.setECUType(rs.getString("ECUType"));
				iniInfo.setECUOrder(rs.getString("ECUOrder"));
				iniInfo.setTimes(rs.getInt("Times"));
				iniInfo.setINIFile(rs.getString("INIFile"));
				iniInfo.setCanWriteTimes(rs.getString("CanWriteTimes"));
				iniInfo.setEditDate(rs.getString("EditDate"));
				iniInfo.setCflj(rs.getString("Cflj"));
				iniInfo.setSbm(rs.getString("Sbm"));
				iniInfo.setZcbm(rs.getString("Zcbm"));
				iniInfo.setSjljh(rs.getString("Sjljh"));
				iniInfo.setScrgh(rs.getString("Scrgh"));
				iniInfo.setScr(rs.getString("Scr"));
				iniInfo.setXgr(rs.getString("Xgr"));
				iniInfo.setShzt(rs.getString("Shzt"));
				iniInfo.setShr(rs.getString("Shr"));
				iniInfo.setShrq(rs.getString("Shrq"));
				iniInfo.setScrq(rs.getString("Scrq"));
				iniInfo.setBz1(rs.getString("Bz1"));
				iniInfo.setBz2(rs.getString("Bz2"));
				
				iniInfo.setBz3(rs.getString("Bz3"));
				iniInfo.setBz4(rs.getString("Bz4"));
				iniInfo.setBz5(rs.getString("Bz5"));
				iniInfo.setBz6(rs.getString("Bz6"));
				iniInfo.setBz7(rs.getString("Bz7"));
				iniInfo.setBz8(rs.getString("Bz8"));
				iniInfo.setBz9(rs.getString("Bz9"));
				iniInfo.setYxq(rs.getString("Yxq"));
				iniInfo.setDownloadtimes(rs.getInt("Downloadtimes"));
				
				
				iniInfos.add(iniInfo);
				//System.out.println("++++++++");
				//System.out.println(hexInfos.get(0));
				//System.out.println("111111111");

			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		//System.out.println(iniInfos);
		return iniInfos;
				
	}


	/**
	 * 为上传唯一ini文件设定的判断方法(订货号+识别码)
	 * 
	 * @param ecuorder
	 * @param sbm
	 * @return
	 */
	public IniInfo queryby_ecuorder_sbm(String ecuorder,String sbm){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		IniInfo iniInfo = new IniInfo();
		String sql = "select * from INIINFO where ecuorder="+"'"+ecuorder+"'" +" and sbm=" +"'"+sbm+"'";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				
				iniInfo.setINIID(rs.getInt("INIID"));
				iniInfo.setHEXParentID(rs.getString("HEXParentID"));
				iniInfo.setState(rs.getInt("state"));
				iniInfo.setECUType(rs.getString("ECUType"));
				iniInfo.setECUOrder(rs.getString("ECUOrder"));
				iniInfo.setTimes(rs.getInt("Times"));
				iniInfo.setINIFile(rs.getString("INIFile"));
				iniInfo.setCanWriteTimes(rs.getString("CanWriteTimes"));
				iniInfo.setEditDate(rs.getString("EditDate"));
				iniInfo.setCflj(rs.getString("Cflj"));
				iniInfo.setSbm(rs.getString("Sbm"));
				iniInfo.setZcbm(rs.getString("Zcbm"));
				iniInfo.setSjljh(rs.getString("Sjljh"));
				iniInfo.setScrgh(rs.getString("Scrgh"));
				iniInfo.setScr(rs.getString("Scr"));
				iniInfo.setXgr(rs.getString("Xgr"));
				iniInfo.setShzt(rs.getString("Shzt"));
				iniInfo.setShr(rs.getString("Shr"));
				iniInfo.setShrq(rs.getString("Shrq"));
				iniInfo.setScrq(rs.getString("Scrq"));
				iniInfo.setBz1(rs.getString("Bz1"));
				iniInfo.setBz2(rs.getString("Bz2"));
				
				iniInfo.setBz3(rs.getString("Bz3"));
				iniInfo.setBz4(rs.getString("Bz4"));
				iniInfo.setBz5(rs.getString("Bz5"));
				iniInfo.setBz6(rs.getString("Bz6"));
				iniInfo.setBz7(rs.getString("Bz7"));
				iniInfo.setBz8(rs.getString("Bz8"));
				iniInfo.setBz9(rs.getString("Bz9"));
				iniInfo.setYxq(rs.getString("Yxq"));
				iniInfo.setDownloadtimes(rs.getInt("Downloadtimes"));
				
				//hexInfos.add(hexInfo);
				//System.out.println("++++++++");
				//System.out.println(hexInfos.get(0));
				//System.out.println("111111111");

			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		
		return iniInfo;
	}
	/**
	 * 改变状态为4
	 * @param iniid
	 */
	public void changestateTo4(int iniid){
		IniInfo iniInfo = query(iniid);
		iniInfo.setState(4);
		updateIniInfo(iniInfo);
	}
	
	
	
	public ArrayList<IniInfo> query_distinct(String sql,String type){//根据一条查询语句，返回查询的结果集合
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<IniInfo> iniInfos = new ArrayList<IniInfo>(); 
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				IniInfo iniInfo = new IniInfo();
				if("ecuorder".equals(type)){
					iniInfo.setECUOrder(rs.getString("ECUOrder"));
				}else if("sbm".equals(type)){
					iniInfo.setSbm(rs.getString("sbm"));
				}
				
				
				
				iniInfos.add(iniInfo);
				//System.out.println("++++++++");
				//System.out.println(hexInfos.get(0));
				//System.out.println("111111111");

			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		//System.out.println(iniInfos);
		return iniInfos;
				
	}
	
	/**
	 * 下载次数的递增
	 */
	public void addDownloadtimes(IniInfo iniInfo){
		if(iniInfo != null){
			int temp = iniInfo.getDownloadtimes();
			temp++;
			iniInfo.setDownloadtimes(temp);
			updateIniInfo(iniInfo);
		}
	}
	
	/**
	 * 查看是否有此订货号的正常状态存在
	 * 
	 * @param ecuorder
	 * @return
	 */
	public boolean ifhave_normal_ecuorder(String ecuorder){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		IniInfo iniInfo = new IniInfo();
		String sql = "select * from INIINFO where ecuorder="+"'"+ecuorder+"'" +" and state=0";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				
				iniInfo.setINIID(rs.getInt("INIID"));
				iniInfo.setHEXParentID(rs.getString("HEXParentID"));
				iniInfo.setState(rs.getInt("state"));
				iniInfo.setECUType(rs.getString("ECUType"));
				iniInfo.setECUOrder(rs.getString("ECUOrder"));
				iniInfo.setTimes(rs.getInt("Times"));
				iniInfo.setINIFile(rs.getString("INIFile"));
				iniInfo.setCanWriteTimes(rs.getString("CanWriteTimes"));
				iniInfo.setEditDate(rs.getString("EditDate"));
				iniInfo.setCflj(rs.getString("Cflj"));
				iniInfo.setSbm(rs.getString("Sbm"));
				iniInfo.setZcbm(rs.getString("Zcbm"));
				iniInfo.setSjljh(rs.getString("Sjljh"));
				iniInfo.setScrgh(rs.getString("Scrgh"));
				iniInfo.setScr(rs.getString("Scr"));
				iniInfo.setXgr(rs.getString("Xgr"));
				iniInfo.setShzt(rs.getString("Shzt"));
				iniInfo.setShr(rs.getString("Shr"));
				iniInfo.setShrq(rs.getString("Shrq"));
				iniInfo.setScrq(rs.getString("Scrq"));
				iniInfo.setBz1(rs.getString("Bz1"));
				iniInfo.setBz2(rs.getString("Bz2"));
				
				iniInfo.setBz3(rs.getString("Bz3"));
				iniInfo.setBz4(rs.getString("Bz4"));
				iniInfo.setBz5(rs.getString("Bz5"));
				iniInfo.setBz6(rs.getString("Bz6"));
				iniInfo.setBz7(rs.getString("Bz7"));
				iniInfo.setBz8(rs.getString("Bz8"));
				iniInfo.setBz9(rs.getString("Bz9"));
				iniInfo.setYxq(rs.getString("Yxq"));
				iniInfo.setDownloadtimes(rs.getInt("Downloadtimes"));
				
				//hexInfos.add(hexInfo);
				//System.out.println("++++++++");
				//System.out.println(hexInfos.get(0));
				//System.out.println("111111111");

			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		if(iniInfo.getECUOrder() != null){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 为删除写的方法（改变状态为3）(3为停用状态)备份
	 */
	public void changestateTo3(int iniid){
		IniInfo iniInfo = query(iniid);
		iniInfo.setState(3);
		updateIniInfo(iniInfo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public IniInfo queryby_ecuorder_sbm20161119(String ecuorder,String sbm){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		IniInfo iniInfo = new IniInfo();
		String sql = "select * from INIINFO20161119 where ecuorder="+"'"+ecuorder+"'" +" and sbm=" +"'"+sbm+"'";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				
				iniInfo.setINIID(rs.getInt("INIID"));
				iniInfo.setHEXParentID(rs.getString("HEXParentID"));
				iniInfo.setState(rs.getInt("state"));
				iniInfo.setECUType(rs.getString("ECUType"));
				iniInfo.setECUOrder(rs.getString("ECUOrder"));
				iniInfo.setTimes(rs.getInt("Times"));
				iniInfo.setINIFile(rs.getString("INIFile"));
				iniInfo.setCanWriteTimes(rs.getString("CanWriteTimes"));
				iniInfo.setEditDate(rs.getString("EditDate"));
				iniInfo.setCflj(rs.getString("Cflj"));
				iniInfo.setSbm(rs.getString("Sbm"));
				iniInfo.setZcbm(rs.getString("Zcbm"));
				iniInfo.setSjljh(rs.getString("Sjljh"));
				iniInfo.setScrgh(rs.getString("Scrgh"));
				iniInfo.setScr(rs.getString("Scr"));
				iniInfo.setXgr(rs.getString("Xgr"));
				iniInfo.setShzt(rs.getString("Shzt"));
				iniInfo.setShr(rs.getString("Shr"));
				iniInfo.setShrq(rs.getString("Shrq"));
				iniInfo.setScrq(rs.getString("Scrq"));
				iniInfo.setBz1(rs.getString("Bz1"));
				iniInfo.setBz2(rs.getString("Bz2"));
				
				iniInfo.setBz3(rs.getString("Bz3"));
				iniInfo.setBz4(rs.getString("Bz4"));
				iniInfo.setBz5(rs.getString("Bz5"));
				iniInfo.setBz6(rs.getString("Bz6"));
				iniInfo.setBz7(rs.getString("Bz7"));
				iniInfo.setBz8(rs.getString("Bz8"));
				iniInfo.setBz9(rs.getString("Bz9"));
				iniInfo.setYxq(rs.getString("Yxq"));
				iniInfo.setDownloadtimes(rs.getInt("Downloadtimes"));
				
				//hexInfos.add(hexInfo);
				//System.out.println("++++++++");
				//System.out.println(hexInfos.get(0));
				//System.out.println("111111111");

			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		
		return iniInfo;
	}
	
}

package com.seu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

import com.seu.beans.HexInfo;
import com.seu.dao.HexInfoDao;
import com.seu.jdbc.JdbcUtils;

import com.seu.jdbc.MaxId;
public class HexInfoDaoImpl implements HexInfoDao{
	@Override
	public boolean updateHexInfo(HexInfo hexInfo){
		Connection conn = null;
		PreparedStatement ps = null;
		int hexId = hexInfo.getHEXID();
		System.out.println(hexId);
		try{
			conn = JdbcUtils.getConnection();
			String sql = "update HEXINFO set Version=?, state=?, ECUType=?, Times=?, HEXFile=?, PfileName=?, KeyDataFileName=?, SBLFileName=?, SREFileName=?, CanWriteTimes=?, EditDate=?, Bh=?, wtdbgdbh=?, jqyawdcgq=?, fdjxh=?, sjljh=?, yt=?, ggg=?, zdnj=?, dsnj=?, zyqxh=?, pyqxh=?, Zdds=?, ysflywkg=?, sgk=?, sgkkg=?, jqyl=?, gdclhqd=?, hclcj=?, cflj=?, Bz1=?, Bz2=?, Bz3=?, Bz4=?, Bz5=?, scz=?, scrq=?, Shzt=?, Shr=?, Shrq=?, Bz6=?, Bz7=?, Bz8=?, Bz9=?, Yxq=?, Downloadtimes=? where HEXID="+hexId;
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, hexInfo.getVersion());
			ps.setInt(2,  hexInfo.getState());
			ps.setString(3,  hexInfo.getECUType());
			ps.setInt(4,  hexInfo.getTimes());
			ps.setString(5,  hexInfo.getHEXFile());
			ps.setString(6,  hexInfo.getPfileName());
			ps.setString(7,  hexInfo.getKeyDataFileName());
			ps.setString(8,  hexInfo.getSBLFileName());
			ps.setString(9,  hexInfo.getSREFileName());
			ps.setString(10,  hexInfo.getCanWriteTimes());
			ps.setString(11,  hexInfo.getEditDate());
			ps.setString(12,  hexInfo.getBh());
			ps.setString(13,  hexInfo.getWtdbgdbh());
			ps.setString(14,  hexInfo.getJqyawdcgq());
			ps.setString(15,  hexInfo.getFdjxh());
			ps.setString(16,  hexInfo.getSjljh());
			ps.setString(17,  hexInfo.getYt());
			ps.setString(18,  hexInfo.getGgg());
			ps.setString(19,  hexInfo.getZdnj());
			ps.setString(20,  hexInfo.getDsnj());
			ps.setString(21,  hexInfo.getZyqxh());
			ps.setString(22, hexInfo.getPyqxh());
			ps.setString(23, hexInfo.getZdds());
			ps.setString(24, hexInfo.getYsflywkg());
			ps.setString(25, hexInfo.getSgk());
			ps.setString(26, hexInfo.getSgkkg());
			ps.setString(27, hexInfo.getJqyl());
			ps.setString(28, hexInfo.getGdclhqd());
			ps.setString(29, hexInfo.getHclcj());
			ps.setString(30, hexInfo.getCflj());
			ps.setString(31, hexInfo.getBz1());
			ps.setString(32, hexInfo.getBz2());
			ps.setString(33, hexInfo.getBz3());
			ps.setString(34, hexInfo.getBz4());
			ps.setString(35, hexInfo.getBz5());
			ps.setString(36, hexInfo.getScz());
			ps.setString(37, hexInfo.getScrq());
			ps.setString(38, hexInfo.getShzt());
			ps.setString(39, hexInfo.getShr());
			ps.setString(40, hexInfo.getShrq());
			ps.setString(41, hexInfo.getBz6());
			ps.setString(42, hexInfo.getBz7());
			ps.setString(43, hexInfo.getBz8());
			ps.setString(44, hexInfo.getBz9());
			ps.setString(45, hexInfo.getYxq());
			ps.setInt(46, hexInfo.getDownloadtimes());
			
			
			ps.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		
		
		return true;
	}

	@Override
	public boolean addHexInfo(HexInfo hexInfo) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		
		try{
			conn = JdbcUtils.getConnection();
			String sql = "insert into HEXINFO(Version,state,ECUType,Times,HEXFile,PfileName,KeyDataFileName,SBLFileName,SREFileName,CanWriteTimes,EditDate,Bh,wtdbgdbh,jqyawdcgq,fdjxh,sjljh,yt,ggg,zdnj,dsnj,zyqxh,pyqxh,Zdds,ysflywkg,sgk,sgkkg,jqyl,gdclhqd,hclcj,cflj,Bz1,Bz2,Bz3,Bz4,Bz5,scz,scrq,Shzt,Shr,Shrq,hexid,Bz6,Bz7,Bz8,Bz9,Yxq,Downloadtimes)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, hexInfo.getVersion());
			ps.setInt(2,  hexInfo.getState());
			ps.setString(3,  hexInfo.getECUType());
			ps.setInt(4,  hexInfo.getTimes());
			ps.setString(5,  hexInfo.getHEXFile());
			ps.setString(6,  hexInfo.getPfileName());
			ps.setString(7,  hexInfo.getKeyDataFileName());
			ps.setString(8,  hexInfo.getSBLFileName());
			ps.setString(9,  hexInfo.getSREFileName());
			ps.setString(10,  hexInfo.getCanWriteTimes());
			ps.setString(11,  hexInfo.getEditDate());
			ps.setString(12,  hexInfo.getBh());
			ps.setString(13,  hexInfo.getWtdbgdbh());
			ps.setString(14,  hexInfo.getJqyawdcgq());
			ps.setString(15,  hexInfo.getFdjxh());
			ps.setString(16,  hexInfo.getSjljh());
			ps.setString(17,  hexInfo.getYt());
			ps.setString(18,  hexInfo.getGgg());
			ps.setString(19,  hexInfo.getZdnj());
			ps.setString(20,  hexInfo.getDsnj());
			ps.setString(21,  hexInfo.getZyqxh());
			ps.setString(22, hexInfo.getPyqxh());
			ps.setString(23, hexInfo.getZdds());
			ps.setString(24, hexInfo.getYsflywkg());
			ps.setString(25, hexInfo.getSgk());
			ps.setString(26, hexInfo.getSgkkg());
			ps.setString(27, hexInfo.getJqyl());
			ps.setString(28, hexInfo.getGdclhqd());
			ps.setString(29, hexInfo.getHclcj());
			ps.setString(30, hexInfo.getCflj());
			ps.setString(31, hexInfo.getBz1());
			ps.setString(32, hexInfo.getBz2());
			ps.setString(33, hexInfo.getBz3());
			ps.setString(34, hexInfo.getBz4());
			ps.setString(35, hexInfo.getBz5());
			ps.setString(36, hexInfo.getScz());
			ps.setString(37, hexInfo.getScrq());
			ps.setString(38, hexInfo.getShzt());
			ps.setString(39, hexInfo.getShr());
			ps.setString(40, hexInfo.getShrq());
			ps.setInt(41, MaxId.Getmaxid("hexinfo", "hexid"));
			ps.setString(42, hexInfo.getBz6());
			ps.setString(43, hexInfo.getBz7());
			ps.setString(44, hexInfo.getBz8());
			ps.setString(45, hexInfo.getBz9());
			ps.setString(46, hexInfo.getYxq());
			ps.setInt(47, hexInfo.getDownloadtimes());
			
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		
		return true;
	}

	@Override
	public void delete(int hexid) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JdbcUtils.getConnection();
			String sql = "delete from HEXINFO where HEXID=" + hexid;
			ps = conn.prepareStatement(sql);
			ps.execute();
			System.out.println("已删除hex文件的");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
	}
	
	public ArrayList<HexInfo> query(String sql){//根据一条查询语句，返回查询的结果集合
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		ArrayList<HexInfo> hexInfos = new ArrayList<HexInfo>(); 
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				HexInfo hexInfo = new HexInfo();
				hexInfo.setHEXID(rs.getInt("HEXID"));
				hexInfo.setVersion(rs.getString("Version"));
				hexInfo.setState(rs.getInt("state"));
				hexInfo.setECUType(rs.getString("ECUType"));
				hexInfo.setTimes(rs.getInt("Times"));
				hexInfo.setHEXFile(rs.getString("HEXFile"));
				hexInfo.setPfileName(rs.getString("PfileName"));
				hexInfo.setKeyDataFileName(rs.getString("KeyDataFileName"));
				hexInfo.setSBLFileName(rs.getString("SBLFileName"));
				hexInfo.setSREFileName(rs.getString("SREFileName"));
				hexInfo.setCanWriteTimes(rs.getString("CanWriteTimes"));
				hexInfo.setEditDate(rs.getString("EditDate"));
				hexInfo.setBh(rs.getString("Bh"));
				hexInfo.setWtdbgdbh(rs.getString("wtdbgdbh"));
				hexInfo.setJqyawdcgq(rs.getString("jqyawdcgq"));
				hexInfo.setFdjxh(rs.getString("fdjxh"));
				hexInfo.setSjljh(rs.getString("sjljh"));
				hexInfo.setYt(rs.getString("yt"));
				hexInfo.setGgg(rs.getString("ggg"));
				hexInfo.setZdnj(rs.getString("zdnj"));
				hexInfo.setDsnj(rs.getString("dsnj"));
				hexInfo.setZyqxh(rs.getString("zyqxh"));
				hexInfo.setPyqxh(rs.getString("pyqxh"));
				hexInfo.setZdds(rs.getString("Zdds"));
				hexInfo.setYsflywkg(rs.getString("ysflywkg"));
				hexInfo.setSgk(rs.getString("sgk"));
				hexInfo.setSgkkg(rs.getString("sgkkg"));
				hexInfo.setJqyl(rs.getString("jqyl"));
				hexInfo.setGdclhqd(rs.getString("gdclhqd"));
				hexInfo.setHclcj(rs.getString("hclcj"));
				hexInfo.setCflj(rs.getString("cflj"));
				hexInfo.setBz1(rs.getString("Bz1"));
				hexInfo.setBz2(rs.getString("Bz2"));
				hexInfo.setBz3(rs.getString("Bz3"));
				hexInfo.setBz4(rs.getString("Bz4"));
				hexInfo.setBz5(rs.getString("Bz5"));
				hexInfo.setScz(rs.getString("scz"));
				hexInfo.setScrq(rs.getString("scrq"));
				hexInfo.setShzt(rs.getString("Shzt"));
				hexInfo.setShr(rs.getString("Shr"));
				hexInfo.setShrq(rs.getString("Shrq"));
				hexInfo.setBz6(rs.getString("Bz6"));
				hexInfo.setBz7(rs.getString("Bz7"));
				hexInfo.setBz8(rs.getString("Bz8"));
				hexInfo.setBz9(rs.getString("Bz9"));
				hexInfo.setYxq(rs.getString("Yxq"));
				hexInfo.setDownloadtimes(rs.getInt("Downloadtimes"));
				
				hexInfos.add(hexInfo);
				//System.out.println("++++++++");
				//System.out.println(hexInfos.get(0));
				//System.out.println("111111111");

			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		//System.out.println(hexInfos);
		return hexInfos;
				
	}
	
	public HexInfo query(int hexid){//根据hexid，返回查询的一个对象
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		//ArrayList<HexInfo> hexInfos = new ArrayList<HexInfo>(); 
		HexInfo hexInfo = new HexInfo();
		
		String sql = "select * from HEXINFO where HEXID="+hexid;
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				
				hexInfo.setHEXID(rs.getInt("HEXID"));
				hexInfo.setVersion(rs.getString("Version"));
				hexInfo.setState(rs.getInt("state"));
				hexInfo.setECUType(rs.getString("ECUType"));
				hexInfo.setTimes(rs.getInt("Times"));
				hexInfo.setHEXFile(rs.getString("HEXFile"));
				hexInfo.setPfileName(rs.getString("PfileName"));
				hexInfo.setKeyDataFileName(rs.getString("KeyDataFileName"));
				hexInfo.setSBLFileName(rs.getString("SBLFileName"));
				hexInfo.setSREFileName(rs.getString("SREFileName"));
				hexInfo.setCanWriteTimes(rs.getString("CanWriteTimes"));
				hexInfo.setEditDate(rs.getString("EditDate"));
				hexInfo.setBh(rs.getString("Bh"));
				hexInfo.setWtdbgdbh(rs.getString("wtdbgdbh"));
				hexInfo.setJqyawdcgq(rs.getString("jqyawdcgq"));
				hexInfo.setFdjxh(rs.getString("fdjxh"));
				hexInfo.setSjljh(rs.getString("sjljh"));
				hexInfo.setYt(rs.getString("yt"));
				hexInfo.setGgg(rs.getString("ggg"));
				hexInfo.setZdnj(rs.getString("zdnj"));
				hexInfo.setDsnj(rs.getString("dsnj"));
				hexInfo.setZyqxh(rs.getString("zyqxh"));
				hexInfo.setPyqxh(rs.getString("pyqxh"));
				hexInfo.setZdds(rs.getString("Zdds"));
				hexInfo.setYsflywkg(rs.getString("ysflywkg"));
				hexInfo.setSgk(rs.getString("sgk"));
				hexInfo.setSgkkg(rs.getString("sgkkg"));
				hexInfo.setJqyl(rs.getString("jqyl"));
				hexInfo.setGdclhqd(rs.getString("gdclhqd"));
				hexInfo.setHclcj(rs.getString("hclcj"));
				hexInfo.setCflj(rs.getString("cflj"));
				hexInfo.setBz1(rs.getString("Bz1"));
				hexInfo.setBz2(rs.getString("Bz2"));
				hexInfo.setBz3(rs.getString("Bz3"));
				hexInfo.setBz4(rs.getString("Bz4"));
				hexInfo.setBz5(rs.getString("Bz5"));
				hexInfo.setScz(rs.getString("scz"));
				hexInfo.setScrq(rs.getString("scrq"));
				hexInfo.setShzt(rs.getString("Shzt"));
				hexInfo.setShr(rs.getString("Shr"));
				hexInfo.setShrq(rs.getString("Shrq"));
				hexInfo.setBz6(rs.getString("Bz6"));
				hexInfo.setBz7(rs.getString("Bz7"));
				hexInfo.setBz8(rs.getString("Bz8"));
				hexInfo.setBz9(rs.getString("Bz9"));
				hexInfo.setYxq(rs.getString("Yxq"));
				hexInfo.setDownloadtimes(rs.getInt("Downloadtimes"));
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
		
		
		return hexInfo;
				
	}
	/**
	 * 为上传唯一hex文件设定的判断方法（数据零件好+版本号）
	 * 
	 * @param sjljh
	 * @param version
	 * @return
	 */
	public HexInfo queryby_sjljh_version(String sjljh,String version){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		//ArrayList<HexInfo> hexInfos = new ArrayList<HexInfo>(); 
		HexInfo hexInfo = new HexInfo();
		
		String sql = "select * from HEXINFO where sjljh="+"'"+sjljh+"'" +" and version=" +"'"+version+"'";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				
				hexInfo.setHEXID(rs.getInt("HEXID"));
				hexInfo.setVersion(rs.getString("Version"));
				hexInfo.setState(rs.getInt("state"));
				hexInfo.setECUType(rs.getString("ECUType"));
				hexInfo.setTimes(rs.getInt("Times"));
				hexInfo.setHEXFile(rs.getString("HEXFile"));
				hexInfo.setPfileName(rs.getString("PfileName"));
				hexInfo.setKeyDataFileName(rs.getString("KeyDataFileName"));
				hexInfo.setSBLFileName(rs.getString("SBLFileName"));
				hexInfo.setSREFileName(rs.getString("SREFileName"));
				hexInfo.setCanWriteTimes(rs.getString("CanWriteTimes"));
				hexInfo.setEditDate(rs.getString("EditDate"));
				hexInfo.setBh(rs.getString("Bh"));
				hexInfo.setWtdbgdbh(rs.getString("wtdbgdbh"));
				hexInfo.setJqyawdcgq(rs.getString("jqyawdcgq"));
				hexInfo.setFdjxh(rs.getString("fdjxh"));
				hexInfo.setSjljh(rs.getString("sjljh"));
				hexInfo.setYt(rs.getString("yt"));
				hexInfo.setGgg(rs.getString("ggg"));
				hexInfo.setZdnj(rs.getString("zdnj"));
				hexInfo.setDsnj(rs.getString("dsnj"));
				hexInfo.setZyqxh(rs.getString("zyqxh"));
				hexInfo.setPyqxh(rs.getString("pyqxh"));
				hexInfo.setZdds(rs.getString("Zdds"));
				hexInfo.setYsflywkg(rs.getString("ysflywkg"));
				hexInfo.setSgk(rs.getString("sgk"));
				hexInfo.setSgkkg(rs.getString("sgkkg"));
				hexInfo.setJqyl(rs.getString("jqyl"));
				hexInfo.setGdclhqd(rs.getString("gdclhqd"));
				hexInfo.setHclcj(rs.getString("hclcj"));
				hexInfo.setCflj(rs.getString("cflj"));
				hexInfo.setBz1(rs.getString("Bz1"));
				hexInfo.setBz2(rs.getString("Bz2"));
				hexInfo.setBz3(rs.getString("Bz3"));
				hexInfo.setBz4(rs.getString("Bz4"));
				hexInfo.setBz5(rs.getString("Bz5"));
				hexInfo.setScz(rs.getString("scz"));
				hexInfo.setScrq(rs.getString("scrq"));
				hexInfo.setShzt(rs.getString("Shzt"));
				hexInfo.setShr(rs.getString("Shr"));
				hexInfo.setShrq(rs.getString("Shrq"));
				hexInfo.setBz6(rs.getString("Bz6"));
				hexInfo.setBz7(rs.getString("Bz7"));
				hexInfo.setBz8(rs.getString("Bz8"));
				hexInfo.setBz9(rs.getString("Bz9"));
				hexInfo.setYxq(rs.getString("Yxq"));
				hexInfo.setDownloadtimes(rs.getInt("Downloadtimes"));
				//hexInfos.add(hexInfo);
				//System.out.println("++++++++");
				//System.out.println(hexInfos.get(0));
				//System.out.println(">-------"+hexInfo.getSjljh());

			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		
		return hexInfo;
		
	}
	
	/**
	 * 为删除写的方法（改变状态为4）(4为停用状态)
	 */
	public void changestateTo4(int hexid){
		HexInfo hexInfo = query(hexid);
		hexInfo.setState(4);
		updateHexInfo(hexInfo);
	}
	
	/**
	 * 为删除写的方法（改变状态为3）(3为停用状态)备份
	 */
	public void changestateTo3(int hexid){
		HexInfo hexInfo = query(hexid);
		hexInfo.setState(3);
		updateHexInfo(hexInfo);
	}
	
	/**
	 * 选择机型后，从数据库对应机型中找数据零件号，
	 * 找的为该机型的状态为正常或临时且审核通过的数据零件号
	 * 
	 * @param ecutype
	 * @return
	 */
	public HashSet<String> query_sjljh(String ecutype){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select sjljh from hexinfo where ecutype="+"'"+ecutype+"'"+" and state<=1 and shzt='已审核'";
		HashSet<String> hs = new HashSet<String>();
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				hs.add(rs.getString("sjljh"));
				//System.out.println(rs.getString("engineenglishname"));
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return hs;
	}
	
	
	
	
	/**
	 * 选择机型后，从数据库对应机型中找bz2对应发动机型号，
	 * 找的为该机型的状态为正常或临时且审核通过的bz2
	 * 
	 * @param ecutype
	 * @return
	 */
	public HashSet<String> query_bz2_fadongji(String ecutype){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select bz2 from hexinfo where ecutype="+"'"+ecutype+"'"+" and state<=1 and shzt='已审核'";
		HashSet<String> hs = new HashSet<String>();
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				hs.add(rs.getString("bz2"));
				//System.out.println(rs.getString("engineenglishname"));
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return hs;
	}
	
	/**
	 * 查询
	 */
	
	/**
	 * 选择机型后，从数据库对应机型中找bz2对应发动机型号，
	 * 找的为该机型的状态为正常或临时且审核通过的bz2
	 * 
	 * @param ecutype
	 * @return
	 */
	public HashSet<String> query_sjljhByecutypeAndfadongji(String ecutype,String fadongji){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		if(fadongji != ""){
			sql = "select sjljh from hexinfo where ecutype="+"'"+ecutype+"'"+" and bz2="+"'"+fadongji+"'"+" and state<=1 and shzt='已审核'";
		}else{
			sql = "select sjljh from hexinfo where ecutype="+"'"+ecutype+"'"+" and state<=1 and shzt='已审核'";

		}
		HashSet<String> hs = new HashSet<String>();
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				hs.add(rs.getString("sjljh"));
				//System.out.println(rs.getString("engineenglishname"));
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return hs;
	}
	
	
	public ArrayList<HexInfo> query_distinct(String sql,String type){//根据一条查询语句，返回查询的结果集合
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		ArrayList<HexInfo> hexInfos = new ArrayList<HexInfo>(); 
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				HexInfo hexInfo = new HexInfo();
				if("sjljh".equals(type)){
					hexInfo.setSjljh(rs.getString("sjljh"));
				}else if("version".equals(type)){
					hexInfo.setVersion(rs.getString("version"));
				}
				hexInfos.add(hexInfo);
				//System.out.println("++++++++");
				//System.out.println(hexInfos.get(0));
				//System.out.println("111111111");

			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		//System.out.println(hexInfos);
		return hexInfos;
				
	}
	/**
	 * 下载次数的递增
	 */
	public void addDownloadtimes(HexInfo hexInfo){
		if(hexInfo != null){
			int temp = hexInfo.getDownloadtimes();
			temp++;
			hexInfo.setDownloadtimes(temp);
			updateHexInfo(hexInfo);
		}
	}
	
	
	/**
	 * 找到相同sjljh中的版本号为最大的那个。
	 */
	public HexInfo queryversion_max(String sjljh){//根据hexid，返回查询的一个对象
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		//ArrayList<HexInfo> hexInfos = new ArrayList<HexInfo>(); 
		HexInfo hexInfo = new HexInfo();
		
		String sql = "select top 1 * from HEXINFO where sjljh="+"'"+sjljh+"'" +" order by Version desc";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				
				hexInfo.setHEXID(rs.getInt("HEXID"));
				hexInfo.setVersion(rs.getString("Version"));
				hexInfo.setState(rs.getInt("state"));
				hexInfo.setECUType(rs.getString("ECUType"));
				hexInfo.setTimes(rs.getInt("Times"));
				hexInfo.setHEXFile(rs.getString("HEXFile"));
				hexInfo.setPfileName(rs.getString("PfileName"));
				hexInfo.setKeyDataFileName(rs.getString("KeyDataFileName"));
				hexInfo.setSBLFileName(rs.getString("SBLFileName"));
				hexInfo.setSREFileName(rs.getString("SREFileName"));
				hexInfo.setCanWriteTimes(rs.getString("CanWriteTimes"));
				hexInfo.setEditDate(rs.getString("EditDate"));
				hexInfo.setBh(rs.getString("Bh"));
				hexInfo.setWtdbgdbh(rs.getString("wtdbgdbh"));
				hexInfo.setJqyawdcgq(rs.getString("jqyawdcgq"));
				hexInfo.setFdjxh(rs.getString("fdjxh"));
				hexInfo.setSjljh(rs.getString("sjljh"));
				hexInfo.setYt(rs.getString("yt"));
				hexInfo.setGgg(rs.getString("ggg"));
				hexInfo.setZdnj(rs.getString("zdnj"));
				hexInfo.setDsnj(rs.getString("dsnj"));
				hexInfo.setZyqxh(rs.getString("zyqxh"));
				hexInfo.setPyqxh(rs.getString("pyqxh"));
				hexInfo.setZdds(rs.getString("Zdds"));
				hexInfo.setYsflywkg(rs.getString("ysflywkg"));
				hexInfo.setSgk(rs.getString("sgk"));
				hexInfo.setSgkkg(rs.getString("sgkkg"));
				hexInfo.setJqyl(rs.getString("jqyl"));
				hexInfo.setGdclhqd(rs.getString("gdclhqd"));
				hexInfo.setHclcj(rs.getString("hclcj"));
				hexInfo.setCflj(rs.getString("cflj"));
				hexInfo.setBz1(rs.getString("Bz1"));
				hexInfo.setBz2(rs.getString("Bz2"));
				hexInfo.setBz3(rs.getString("Bz3"));
				hexInfo.setBz4(rs.getString("Bz4"));
				hexInfo.setBz5(rs.getString("Bz5"));
				hexInfo.setScz(rs.getString("scz"));
				hexInfo.setScrq(rs.getString("scrq"));
				hexInfo.setShzt(rs.getString("Shzt"));
				hexInfo.setShr(rs.getString("Shr"));
				hexInfo.setShrq(rs.getString("Shrq"));
				hexInfo.setBz6(rs.getString("Bz6"));
				hexInfo.setBz7(rs.getString("Bz7"));
				hexInfo.setBz8(rs.getString("Bz8"));
				hexInfo.setBz9(rs.getString("Bz9"));
				hexInfo.setYxq(rs.getString("Yxq"));
				hexInfo.setDownloadtimes(rs.getInt("Downloadtimes"));
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
		
		
		return hexInfo;
				
	}
	
	/**
	 * 查看是否有此数据零件号的正常状态存在
	 */
	public boolean ifhave_normal_sjljh(String sjljh){//根据hexid，返回查询的一个对象
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		//ArrayList<HexInfo> hexInfos = new ArrayList<HexInfo>(); 
		HexInfo hexInfo = new HexInfo();
		
		String sql = "select * from HEXINFO where sjljh="+"'"+sjljh+"'" +" and state=0";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				
				hexInfo.setHEXID(rs.getInt("HEXID"));
				hexInfo.setVersion(rs.getString("Version"));
				hexInfo.setState(rs.getInt("state"));
				hexInfo.setECUType(rs.getString("ECUType"));
				hexInfo.setTimes(rs.getInt("Times"));
				hexInfo.setHEXFile(rs.getString("HEXFile"));
				hexInfo.setPfileName(rs.getString("PfileName"));
				hexInfo.setKeyDataFileName(rs.getString("KeyDataFileName"));
				hexInfo.setSBLFileName(rs.getString("SBLFileName"));
				hexInfo.setSREFileName(rs.getString("SREFileName"));
				hexInfo.setCanWriteTimes(rs.getString("CanWriteTimes"));
				hexInfo.setEditDate(rs.getString("EditDate"));
				hexInfo.setBh(rs.getString("Bh"));
				hexInfo.setWtdbgdbh(rs.getString("wtdbgdbh"));
				hexInfo.setJqyawdcgq(rs.getString("jqyawdcgq"));
				hexInfo.setFdjxh(rs.getString("fdjxh"));
				hexInfo.setSjljh(rs.getString("sjljh"));
				hexInfo.setYt(rs.getString("yt"));
				hexInfo.setGgg(rs.getString("ggg"));
				hexInfo.setZdnj(rs.getString("zdnj"));
				hexInfo.setDsnj(rs.getString("dsnj"));
				hexInfo.setZyqxh(rs.getString("zyqxh"));
				hexInfo.setPyqxh(rs.getString("pyqxh"));
				hexInfo.setZdds(rs.getString("Zdds"));
				hexInfo.setYsflywkg(rs.getString("ysflywkg"));
				hexInfo.setSgk(rs.getString("sgk"));
				hexInfo.setSgkkg(rs.getString("sgkkg"));
				hexInfo.setJqyl(rs.getString("jqyl"));
				hexInfo.setGdclhqd(rs.getString("gdclhqd"));
				hexInfo.setHclcj(rs.getString("hclcj"));
				hexInfo.setCflj(rs.getString("cflj"));
				hexInfo.setBz1(rs.getString("Bz1"));
				hexInfo.setBz2(rs.getString("Bz2"));
				hexInfo.setBz3(rs.getString("Bz3"));
				hexInfo.setBz4(rs.getString("Bz4"));
				hexInfo.setBz5(rs.getString("Bz5"));
				hexInfo.setScz(rs.getString("scz"));
				hexInfo.setScrq(rs.getString("scrq"));
				hexInfo.setShzt(rs.getString("Shzt"));
				hexInfo.setShr(rs.getString("Shr"));
				hexInfo.setShrq(rs.getString("Shrq"));
				hexInfo.setBz6(rs.getString("Bz6"));
				hexInfo.setBz7(rs.getString("Bz7"));
				hexInfo.setBz8(rs.getString("Bz8"));
				hexInfo.setBz9(rs.getString("Bz9"));
				hexInfo.setYxq(rs.getString("Yxq"));
				hexInfo.setDownloadtimes(rs.getInt("Downloadtimes"));
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
		
		if(hexInfo.getSjljh() != null){
			return true;
		}else{
			return false;
		}
				
	}
	
}

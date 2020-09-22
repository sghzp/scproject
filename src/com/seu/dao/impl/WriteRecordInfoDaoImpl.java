package com.seu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import com.seu.beans.IniInfo;
import com.seu.beans.WriteRecordInfo;
import com.seu.dao.WriteRecordInfoDao;
import com.seu.jdbc.JdbcUtils;

public class WriteRecordInfoDaoImpl implements WriteRecordInfoDao{

	@Override
	public List<WriteRecordInfo> query(String sql) {
		List<WriteRecordInfo> list = new ArrayList<WriteRecordInfo>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				WriteRecordInfo wri = new WriteRecordInfo();
				wri.setEcuid(rs.getString("ecuid"));
				wri.setEcusn(rs.getString("ecusn"));
				wri.setIqa(rs.getString("iqa"));
				wri.setHex(rs.getString("hex"));
				wri.setIni(rs.getString("ini"));
				wri.setEcutype(rs.getString("ecutype"));
				wri.setEcuorder(rs.getString("ecuorder"));
				wri.setObdtype(rs.getString("obdtype"));
				wri.setObdmanufacturer(rs.getString("obdmanufacturer"));
				wri.setEcudate(rs.getString("ecudate"));
				wri.setLocation(rs.getString("location"));
				wri.setOperator(rs.getString("operator"));
				wri.setParafile(rs.getString("parafile"));
				wri.setEdittime(rs.getString("edittime"));
				
				list.add(wri);

			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		Collections.sort(list);//给list排序，好像服务器会内存溢出，不知道是不是这个排序算法的问题。
		return list;
	}

	@Override
	public void delete(String ecudate) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = JdbcUtils.getConnection();
			String sql ="delete from ECUINFO where ecudate="+"'"+ecudate+"'";
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			ps.execute();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		
		
	}
	
	
	public List<WriteRecordInfo> query_ecuorder_ecusn() {
		//HashMap<String,String> hm = new HashMap<String,String>();
		List<WriteRecordInfo> list = new ArrayList<WriteRecordInfo>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT distinct ECUOrder,ECUSN FROM ECUINFO20161119";
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				
				WriteRecordInfo wri = new WriteRecordInfo();
				wri.setEcusn(rs.getString("ecusn"));
				wri.setEcuorder(rs.getString("ecuorder"));
				
				list.add(wri);

			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		//Collections.sort(list);//给list排序，好像服务器会内存溢出，不知道是不是这个排序算法的问题。
		return list;
	}
	
	public boolean updateWriteRecord(String ecuorder, String ecusn,String sjljh) {
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = JdbcUtils.getConnection();
			String sql = "update ECUINFO20161119 set location=? where ecuorder=? and ecusn=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sjljh);
			ps.setString(2,  ecuorder);
			ps.setString(3,  ecusn);
	
			ps.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		
		
		return true;
	}
	
}

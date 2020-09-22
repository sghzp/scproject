package com.seu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.seu.beans.HexInfo;
import com.seu.beans.LogInfo;
import com.seu.beans.ObdInfo;
import com.seu.dao.ObdInfoDao;
import com.seu.jdbc.JdbcUtils;
import com.seu.jdbc.MaxId;

public class ObdInfoDaoImpl implements ObdInfoDao{

	@Override
	public List<ObdInfo> query(String sql) {
		List<ObdInfo> list = new ArrayList<ObdInfo>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				ObdInfo oi = new ObdInfo();
				oi.setId(rs.getInt("id"));
				oi.setEnginetype(rs.getString("enginetype"));
				oi.setOBDXH(rs.getString("obdxh"));
				oi.setOBDCJ(rs.getString("obdcj"));
				list.add(oi);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.free(rs, ps, conn);
		}
		return list;
	}

	@Override
	public boolean addObdInfo(String enginetype, String obdxh,
			String obdcj) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try{
			conn = JdbcUtils.getConnection();
			String sql = "insert into obd(id,enginetype,obdxh,obdcj)values(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, MaxId.Getmaxid("obd", "id"));
			ps.setString(2, enginetype);
			ps.setString(3, obdxh);
			ps.setString(4, obdcj);
			
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		
		return true;
	}

	@Override
	public boolean delete(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = JdbcUtils.getConnection();
			String sql ="delete from obd where id="+id;
			ps = conn.prepareStatement(sql);
			ps.execute();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		return false;
	}
	
	
	public boolean updateObdInfo(ObdInfo obdInfo){
		Connection conn = null;
		PreparedStatement ps = null;
		int id = obdInfo.getId();
		//System.out.println(hexId);
		try{
			conn = JdbcUtils.getConnection();
			String sql = "update obd set enginetype=?, obdxh=?, obdcj=? where ID="+id;
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, obdInfo.getEnginetype());
			ps.setString(2,  obdInfo.getOBDXH());
			ps.setString(3,  obdInfo.getOBDCJ());
			ps.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		return true;
	}
	
}

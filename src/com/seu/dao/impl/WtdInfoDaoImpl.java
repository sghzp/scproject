package com.seu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.seu.beans.MesInfo;
import com.seu.beans.WtdInfo;
import com.seu.dao.WtdInfoDao;
import com.seu.jdbc.JdbcUtils;

public class WtdInfoDaoImpl implements WtdInfoDao{

	@Override
	public WtdInfo query(String sjljh, String version, int state) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		//ArrayList<HexInfo> hexInfos = new ArrayList<HexInfo>(); 
		WtdInfo wtdInfo = new WtdInfo();
		
		String sql = "select * from WtdINFO where sjljh="+"'"+sjljh+"' and version=" +"'"+version+"' and state="+state;
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				wtdInfo.setId(rs.getInt("id"));
				wtdInfo.setWtdnum(rs.getString("Wtdnum"));
				wtdInfo.setSjljh(rs.getString("Sjljh"));
				wtdInfo.setVersion(rs.getString("Version"));
				wtdInfo.setState(rs.getInt("State"));
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return wtdInfo;
	}
	
}

package com.seu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.seu.beans.LogInfo;
import com.seu.dao.LogInfoDao;
import com.seu.jdbc.JdbcUtils;

public class LogInfoDaoImpl implements LogInfoDao {

	@Override
	public List<LogInfo> query(String sql) {
		List<LogInfo> list = new ArrayList<LogInfo>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				// System.out.println(rs.getInt("HEXID"));

				LogInfo li = new LogInfo();
				li.setTime(rs.getString("time"));
				li.setDatalog(rs.getString("datalog"));


				list.add(li);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.free(rs, ps, conn);
		}
		Collections.sort(list);
		return list;
	}

	@Override
	public boolean addLogInfo(String time,String datalog) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try{
			conn = JdbcUtils.getConnection();
			String sql = "insert into LOGINFO(time,datalog)values(?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, time);
			ps.setString(2, datalog);

		
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		
		return true;
	}

}

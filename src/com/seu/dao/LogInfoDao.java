package com.seu.dao;

import java.util.List;

import com.seu.beans.LogInfo;

public interface LogInfoDao {
	public List<LogInfo> query(String sql);
	public boolean addLogInfo(String time,String datalog);
}

package com.seu.dao;

import java.util.List;

import com.seu.beans.ObdInfo;

public interface ObdInfoDao {
	public List<ObdInfo> query(String sql);
	public boolean addObdInfo(String enginetype,String obdxh,String obdcj);
	public boolean delete(int id);
}

package com.seu.dao;

import com.seu.beans.WtdInfo;

public interface WtdInfoDao {
	public WtdInfo query(String sjljh , String version, int state);
}

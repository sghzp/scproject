package com.seu.dao;

import java.util.List;

import com.seu.beans.WriteRecordInfo;

public interface WriteRecordInfoDao {
	public List<WriteRecordInfo> query(String sql);
	public void delete(String ecudate);
}

package com.seu.dao;

import java.util.List;

import com.seu.beans.MesInfo;

public interface MesInfoDao {
	public boolean addmesInfo(MesInfo mesInfo);
	public boolean updatemesInfo(MesInfo mesInfo);
	public MesInfo query(String sjljh,String version);
	public List<MesInfo> query(String shenqingren);
}

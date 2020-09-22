package com.seu.dao;

import com.seu.beans.HexInfo;

public interface HexInfoDao {
	public boolean addHexInfo(HexInfo hexInfo);//增加信息的方法声明
	public void delete(int hexid);//删除信息的方法声明,根据唯一的hexid来删除
	public boolean updateHexInfo(HexInfo hexInfo);//更新信息的方法声明
}

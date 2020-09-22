package com.seu.dao;

import com.seu.beans.IniInfo;


public interface IniInfoDao {
	public boolean addIniInfo(IniInfo iniInfo);//增加信息的方法声明
	public void delete(int iniid);//删除信息的方法声明,根据唯一的iniid来删除
	public boolean updateIniInfo(IniInfo iniInfo);//更新信息的方法声明
}
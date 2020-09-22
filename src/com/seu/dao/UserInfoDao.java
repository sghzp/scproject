package com.seu.dao;

import java.util.ArrayList;

import com.seu.beans.UserInfo;

public interface UserInfoDao {
	public boolean addUser(UserInfo userInfo) throws Exception;
	public boolean update(UserInfo userInfo);
	//public void delete(int num);
	public ArrayList<UserInfo> query();
	public UserInfo query(String num);
	public boolean delete(String num);
}

package com.seu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

import com.seu.beans.IniInfo;
import com.seu.beans.UserInfo;
import com.seu.dao.UserInfoDao;
import com.seu.jdbc.JdbcUtils;

public class UserInfoDaoImpl implements UserInfoDao {

	@Override
	public boolean addUser(UserInfo userInfo) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		
		try{
			conn = JdbcUtils.getConnection();
			String sql = "insert into USERINFO(Num,Name,Mail,Department)values(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, userInfo.getNum());
			ps.setString(2,  userInfo.getName());
			ps.setString(3,  userInfo.getMail());
			ps.setString(4,  userInfo.getDepartment());
			
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw e;
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		return true;
	}

	@Override
	public boolean update(UserInfo userInfo) {
		Connection conn = null;
		PreparedStatement ps = null;
		String Num = userInfo.getNum();
		try{
			conn = JdbcUtils.getConnection();
			String sql = "update USERINFO set Name=?, Mail=?, Department=? where Num="+"'"+Num+"'";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1,  userInfo.getName());
			ps.setString(2,  userInfo.getMail());
			ps.setString(3,  userInfo.getDepartment());
			
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		return true;
	}

	@Override
	public ArrayList<UserInfo> query() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		ArrayList<UserInfo> userInfos = new ArrayList<UserInfo>(); 
		String sql = "select * from USERINFO";
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				UserInfo userInfo = new UserInfo();
				userInfo.setNum(rs.getString("Num"));
				userInfo.setName(rs.getString("Name"));;
				userInfo.setMail(rs.getString("Mail"));
				userInfo.setDepartment(rs.getString("Department"));
				
				userInfos.add(userInfo);
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		//System.out.println(hexInfos);
		return userInfos;
	}
	
	
	public ArrayList<UserInfo> query_distinct(String sql,String type){//根据一条查询语句，返回查询的结果集合
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<UserInfo> userInfos = new ArrayList<UserInfo>(); 
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				UserInfo userInfo = new UserInfo();
				if("clr".equals(type)){
					userInfo.setName(rs.getString("name"));
				}else if("clrgh".equals(type)){
					userInfo.setNum(rs.getString("num"));
				}
				
				
				
				userInfos.add(userInfo);
				//System.out.println("++++++++");
				//System.out.println(hexInfos.get(0));
				//System.out.println("111111111");

			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		//System.out.println(iniInfos);
		return userInfos;
				
	}
	
	
	
	
	@Override
	public UserInfo query(String num){
		UserInfo userInfo = new UserInfo();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from USERINFO where Num="+"'"+num+"'";
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				userInfo.setNum(rs.getString("Num"));
				userInfo.setName(rs.getString("Name"));;
				userInfo.setMail(rs.getString("Mail"));
				userInfo.setDepartment(rs.getString("Department"));
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return userInfo;
	}
	
	public HashSet<String> query_clrgh(String name){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select Num from userinfo where Name="+"'"+name+"'";
		HashSet<String> hs = new HashSet<String>();
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				hs.add(rs.getString("Num"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return hs;
	}
	
	
	public HashSet<String> query_clr(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select Name from userinfo";
		HashSet<String> hs = new HashSet<String>();
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				hs.add(rs.getString("Name"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return hs;
	}
	
	
	@Override
	public boolean delete(String num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "delete from USERINFO where Num="+"'"+num+"'";
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();

			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return true;
	}
	
	
	public ArrayList<UserInfo> queryby_sql(String sql) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		ArrayList<UserInfo> userInfos = new ArrayList<UserInfo>(); 
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				UserInfo userInfo = new UserInfo();
				userInfo.setNum(rs.getString("Num"));
				userInfo.setName(rs.getString("Name"));;
				userInfo.setMail(rs.getString("Mail"));
				userInfo.setDepartment(rs.getString("Department"));
				
				userInfos.add(userInfo);
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		//System.out.println(hexInfos);
		return userInfos;
	}
	
	
	public UserInfo query_byname(String name){//没有考虑重名的情况
		UserInfo userInfo = new UserInfo();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from USERINFO where Name="+"'"+name+"'";
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("HEXID"));
				userInfo.setNum(rs.getString("Num"));
				userInfo.setName(rs.getString("Name"));;
				userInfo.setMail(rs.getString("Mail"));
				userInfo.setDepartment(rs.getString("Department"));
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return userInfo;
	}
	

}

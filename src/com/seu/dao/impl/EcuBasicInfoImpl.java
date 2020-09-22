package com.seu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.seu.jdbc.JdbcUtils;

public class EcuBasicInfoImpl {
	
	/**
	 * 
	 * 给hexadd页面用的,返回<engineenglishname,ecustyle>
	 * @return HashMap<String,Integer>
	 */
	public HashMap<String,Integer> query1(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select engineenglishname,ecustyle from ecubasicinfo";
		HashMap<String,Integer> hm = new HashMap<String,Integer>();
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				hm.put(rs.getString("engineenglishname"), Integer.parseInt(rs.getString("ecustyle")));
				
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return hm;		
	}
	
	
	/**
	 * 给iniadd页面用的，返回<engineenglishname,ecuprotocolstyle>
	 * @return HashMap<String,Integer>
	 */
	
	public HashMap<String,Integer> query2(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select engineenglishname,ecuprotocolstyle from ecubasicinfo";
		HashMap<String,Integer> hm = new HashMap<String,Integer>();
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				hm.put(rs.getString("engineenglishname"), Integer.parseInt(rs.getString("ecuprotocolstyle")));
				
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return hm;		
	}
	
	/**
	 * 给iniadd页面用的，返回<engineenglishname>
	 * 就为了生成下拉菜单
	 * @return HashSet<String>
	 */
	
	public HashSet<String> query3(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select engineenglishname from ecubasicinfo";
		HashSet<String> hs = new HashSet<String>();
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				hs.add(rs.getString("engineenglishname"));
				//System.out.println(rs.getString("engineenglishname"));
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return hs;		
	}
	
	public Map<String,String> query4(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select enginename,engineenglishname from ecubasicinfo order by enginename";
		Map<String,String> map = new LinkedHashMap<String,String>();
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getString("enginename"));
				map.put(rs.getString("enginename"), rs.getString("engineenglishname"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return map;
	}
	
	public Map<String,String> query5(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select enginename,engineenglishname from ecubasicinfo order by enginename";
		Map<String,String> map = new LinkedHashMap<String,String>();
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getString("enginename"));
				map.put(rs.getString("engineenglishname"), rs.getString("enginename"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return map;
	}
}

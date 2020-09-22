package com.seu.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.seu.jdbc.JdbcUtils;

public class TestConnection {

	public static void main(String args[]) {
		Connection conn = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean aaa = st == null;
		//System.out.println(aaa);
		try {
			/*rs = JdbcUtils.query("select * from test");
			rs.absolute(6);
			System.out.println(rs.getString("name"));*/
			//System.out.println(rs.getString("name")+"   "+rs.getString("englishname")+"   "
					//+rs.getString("maxvalue")+"   ");
			conn = JdbcUtils.getConnection();
			String sql = "update test set ceshimax=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "我是轩然，正在测试大文本");
			ps.execute();
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs,ps,conn);
		} 
	}
}

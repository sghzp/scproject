package com.seu.jdbc;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.seu.jdbc.JdbcUtils;
public class MaxId {
	public static int Getmaxid(String tablename,String col){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql= "select top 1"+col+" from "+tablename+" order by "+col+" desc";
		int max = 0;
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				max = rs.getInt(1);
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		//System.out.println(hexInfos);
		return max + 1;
	}
}

package com.seu.jdbc;


import java.io.InputStream;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Properties;

import javax.sql.DataSource;//各种数据源（c3p0，Dbcp等等）都实现了这个接口

import org.apache.commons.dbcp.BasicDataSourceFactory;

import com.seu.Global.Path;
import com.seu.ioutils.IniToHashMap;
import com.seu.service.EncodeService;





public class JdbcUtils {
//	private static String url="jdbc:mysql://localhost:3306/jdbc";
//	private static String user="root";
//	private static String password="521xingxing";
	
	private static DataSource myDataSource = null;
	private static Connection conn1;
	private static PreparedStatement ps1;
	private static ResultSet rs1;
	private static HashMap<String,String> hm = null;
	
	public static String systemName = null;
	
	private JdbcUtils(){
		
	}//限制别人构造这个类
	
	static {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//myDataSource = new MyDataSource();不用自己写的连接池了
			hm = IniToHashMap.getHashMap(Path.ROOT_EOL+"/database.ini");
			
			//初始化systemName
			if(hm.get("systemName") != null){
				systemName = hm.get("systemName");
				//System.out.println(hm.get("username"));
/*				System.out.println(systemName);
				System.out.println(new String(systemName.getBytes(),"utf-8"));
				System.out.println(new String(systemName.getBytes(),"gbk"));
				System.out.println(new String(systemName.getBytes(),"Unicode"));
				System.out.println(new String(systemName.getBytes(),"gb2312"));*/
			}else{
				systemName = "上柴EOL数据管理平台";
			}
			
			Properties prop = new Properties();
			InputStream is = JdbcUtils.class.getClassLoader().getResourceAsStream("DbcpConfig.properties");
			System.out.println("zhaodao:properties");
			prop.load(is);
			
			
			prop.setProperty("url", "jdbc:sqlserver://" + hm.get("ServerIP") + ":1433;DatabaseName="+hm.get("SQLDBName"));
			prop.setProperty("username", hm.get("SQLUserID"));
			
			EncodeService es = new EncodeService();
			
			
			
			prop.setProperty("password",es.encode(hm.get("SQLPwd")));
			//prop.setProperty("password","root");
			//prop.setProperty("password","db2016");
			
			
			
			
			//System.out.println((String)prop.get("url") + (String)prop.get("username")+ (String)prop.get("password"));
			System.out.println("jiazai:properties");
			//System.out.println(prop);
			myDataSource = BasicDataSourceFactory.createDataSource(prop);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO Auto-generated catch block
			throw new ExceptionInInitializerError(e);
			
		}
	}
	
	public static Connection getConnection() throws SQLException{
		return myDataSource.getConnection();
	}
	//**************以下代码求更好的实现**********
	public static ResultSet query(String sql){
		
		try{
			conn1 = getConnection();
			//生成一个功能强大的结果集，不要求更新功能，但至少要能够随意移动记录指针。
			ps1 = conn1.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs1 = ps1.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			free(null, null, null);//此处不能关闭，调用此函数后
		}	
		return rs1;
	}
	
	public static void free(){
		try{
			if(rs1 != null){
				rs1.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(ps1 != null){
					ps1.close();
				}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				if(conn1 != null){
					try {
						conn1.close();
						
					} catch (Exception e) {
						
						e.printStackTrace();
					}
				}
			}
			
		}
	}
	
	//***********以上代码求更好的实现***********
	
	public static void free(ResultSet rs,Statement st,Connection conn){
		try{
			if(rs != null){
				rs.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(st != null){
					st.close();
				}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				if(conn != null){
					try {
						conn.close();
						
					} catch (Exception e) {
						
						e.printStackTrace();
					}
				}
			}
			
		}
	}
	
	/**
	 * 判断数据库中是否存在表格
	 * @return boolean
	 */
	 public static boolean HasTable(String name) {
	        //判断某一个表是否存在
		 	Connection conn = null;
	        boolean result = false;
	        try {
	        	conn = getConnection();
	            DatabaseMetaData meta = (DatabaseMetaData) conn.getMetaData();//sqlConn 数据库连接
	            ResultSet set = meta.getTables (null, null, name, null);
	            while (set.next()) {
	                result = true;
	            }
	        } catch (Exception e) {
	            System.err.println(e);
	            e.printStackTrace ();
	        }finally{
	        	if(conn!=null){
	        		try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
	        	}
	        }
	        return result;
	    }
	
	
	
}


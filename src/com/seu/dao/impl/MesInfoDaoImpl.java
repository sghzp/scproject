package com.seu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import com.seu.beans.HexInfo;
import com.seu.beans.IniInfo;
import com.seu.beans.MesInfo;
import com.seu.dao.MesInfoDao;
import com.seu.jdbc.JdbcUtils;
import com.seu.jdbc.MaxId;

public class MesInfoDaoImpl implements MesInfoDao {

	@Override
	public boolean addmesInfo(MesInfo mesInfo) {
		// TODO Auto-generated method stub
				Connection conn = null;
				PreparedStatement ps = null;
				
				try{
					conn = JdbcUtils.getConnection();
					String sql = "insert into MESINFO(Num,Style,Sqrq,Sqrgh,Sqr,Sjljh,Version,Oristate,dststate,Sqsm,Bz,Bz1,Bz2,Bz3, Bz4, Bz5,clrgh,clr,clzt,clzk,fj1,fj2,fj3)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					ps = conn.prepareStatement(sql);
					
					ps.setString(1, mesInfo.getNum());
					ps.setInt(2,  mesInfo.getStyle());
					ps.setString(3,  mesInfo.getSqrq());
					ps.setString(4,  mesInfo.getSqrgh());
					ps.setString(5,  mesInfo.getSqr());
					ps.setString(6,  mesInfo.getSjljh());
					ps.setString(7,  mesInfo.getVersion());
					ps.setInt(8,  mesInfo.getOristate());
					ps.setInt(9,  mesInfo.getDststate());
					ps.setString(10,  mesInfo.getSqsm());
					ps.setString(11,  mesInfo.getBz());
					ps.setString(12,  mesInfo.getBz1());
					ps.setString(13,  mesInfo.getBz2());
					ps.setString(14,  mesInfo.getBz3());
					ps.setString(15,  mesInfo.getBz4());
					ps.setString(16,  mesInfo.getBz5());
					ps.setString(17,  mesInfo.getClrgh());
					ps.setString(18,  mesInfo.getClr());
					ps.setInt(19,  mesInfo.getClzt());
					ps.setString(20,  mesInfo.getClzk());
					ps.setString(21,  mesInfo.getFJ1());
					ps.setString(22,  mesInfo.getFJ2());
					ps.setString(23,  mesInfo.getFJ3());
					
					ps.executeUpdate();
				}catch(SQLException e){
					e.printStackTrace();
				}finally{
					JdbcUtils.free(null, ps, conn);
				}
				
				return true;
	}

	@Override
	public boolean updatemesInfo(MesInfo mesInfo) {
		Connection conn = null;
		PreparedStatement ps = null;
		String num = mesInfo.getNum();
		//System.out.println(num);
		try{
			conn = JdbcUtils.getConnection();
			String sql = "update MESINFO set Style=?, Sqrq=?, Sqrgh=?, Sqr=?, Sjljh=?, Version=?, Oristate=?, dststate=?, Sqsm=?, Bz=?, Bz1=?, Bz2=?, Bz3=?, Bz4=?, Bz5=?, clrgh=?, clr=?, clzt=?, clzk=?, fj1=?, fj2=?, fj3=? where Num="+"'"+num+"'";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1,  mesInfo.getStyle());
			ps.setString(2,  mesInfo.getSqrq());
			ps.setString(3,  mesInfo.getSqrgh());
			ps.setString(4,  mesInfo.getSqr());
			ps.setString(5,  mesInfo.getSjljh());
			ps.setString(6,  mesInfo.getVersion());//7
			ps.setInt(7,  mesInfo.getOristate());
			ps.setInt(8,  mesInfo.getDststate());
			ps.setString(9,  mesInfo.getSqsm());
			ps.setString(10,  mesInfo.getBz());
			ps.setString(11,  mesInfo.getBz1());
			ps.setString(12,  mesInfo.getBz2());
			ps.setString(13,  mesInfo.getBz3());
			ps.setString(14,  mesInfo.getBz4());
			ps.setString(15,  mesInfo.getBz5());
			ps.setString(16,  mesInfo.getClrgh());
			ps.setString(17,  mesInfo.getClr());
			ps.setInt(18,  mesInfo.getClzt());
			ps.setString(19,  mesInfo.getClzk());
			ps.setString(20,  mesInfo.getFJ1());
			ps.setString(21, mesInfo.getFJ2());
			ps.setString(22, mesInfo.getFJ3());
			
			ps.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(null, ps, conn);
		}
		return true;
	}

	public MesInfo query_by_num(String num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		//ArrayList<HexInfo> hexInfos = new ArrayList<HexInfo>(); 
		MesInfo mesInfo = new MesInfo();
		
		String sql = "select * from MESINFO where Num="+"'"+num+"'";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				mesInfo.setNum(rs.getString("Num"));
				mesInfo.setStyle(rs.getInt("Style"));
				mesInfo.setSqrq(rs.getString("Sqrq"));
				mesInfo.setSqrgh(rs.getString("Sqrgh"));
				mesInfo.setSqr(rs.getString("Sqr"));
				mesInfo.setSjljh(rs.getString("Sjljh"));
				mesInfo.setVersion(rs.getString("Version"));
				mesInfo.setOristate(rs.getInt("Oristate"));
				mesInfo.setDststate(rs.getInt("dststate"));
				mesInfo.setSqsm(rs.getString("Sqsm"));
				mesInfo.setBz(rs.getString("Bz"));
				mesInfo.setBz1(rs.getString("Bz1"));
				mesInfo.setBz2(rs.getString("Bz2"));
				mesInfo.setBz3(rs.getString("Bz3"));
				mesInfo.setBz4(rs.getString("Bz4"));
				mesInfo.setBz5(rs.getString("Bz5"));
				mesInfo.setClrgh(rs.getString("clrgh"));
				mesInfo.setClr(rs.getString("clr"));
				mesInfo.setClzt(rs.getInt("clzt"));
				mesInfo.setClzk(rs.getString("clzk"));
				mesInfo.setFJ1(rs.getString("fj1"));
				mesInfo.setFJ2(rs.getString("fj2"));
				mesInfo.setFJ3(rs.getString("fj3"));
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return mesInfo;
	}
	
	
	@Override
	public MesInfo query(String sjljh, String version) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		//ArrayList<HexInfo> hexInfos = new ArrayList<HexInfo>(); 
		MesInfo mesInfo = new MesInfo();
		
		String sql = "select * from MESINFO where Sjljh="+"'"+sjljh+"'"+" and Version="+"'"+version+"'";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				mesInfo.setNum(rs.getString("Num"));
				mesInfo.setStyle(rs.getInt("Style"));
				mesInfo.setSqrq(rs.getString("Sqrq"));
				mesInfo.setSqrgh(rs.getString("Sqrgh"));
				mesInfo.setSqr(rs.getString("Sqr"));
				mesInfo.setSjljh(rs.getString("Sjljh"));
				mesInfo.setVersion(rs.getString("Version"));
				mesInfo.setOristate(rs.getInt("Oristate"));
				mesInfo.setDststate(rs.getInt("dststate"));
				mesInfo.setSqsm(rs.getString("Sqsm"));
				mesInfo.setBz(rs.getString("Bz"));
				mesInfo.setBz1(rs.getString("Bz1"));
				mesInfo.setBz2(rs.getString("Bz2"));
				mesInfo.setBz3(rs.getString("Bz3"));
				mesInfo.setBz4(rs.getString("Bz4"));
				mesInfo.setBz5(rs.getString("Bz5"));
				mesInfo.setClrgh(rs.getString("clrgh"));
				mesInfo.setClr(rs.getString("clr"));
				mesInfo.setClzt(rs.getInt("clzt"));
				mesInfo.setClzk(rs.getString("clzk"));
				mesInfo.setFJ1(rs.getString("fj1"));
				mesInfo.setFJ2(rs.getString("fj2"));
				mesInfo.setFJ3(rs.getString("fj3"));
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		
		
		return mesInfo;
	}
	

	
	
	
	@Override
	/**
	 * 为 待处理事项 页面做的查询方法，应该加入关于代理人设置的  筛选
	 */
	public List<MesInfo> query(String clrgh){
		HashSet<String> hs = query_proxy(clrgh);
		List<MesInfo> list = new ArrayList<MesInfo>();
		for(String s : hs){
			list.addAll(query_alone(s));
		}
		
		return list;
	}

	private List<MesInfo> query_alone(String clrgh) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		ArrayList<MesInfo> mesInfos = new ArrayList<MesInfo>(); 
		query_proxy(clrgh);
		
		String sql = "select * from MESINFO where clrgh="+"'"+clrgh+"' order by Num desc";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				MesInfo mesInfo = new MesInfo();
				mesInfo.setNum(rs.getString("Num"));
				mesInfo.setStyle(rs.getInt("Style"));
				mesInfo.setSqrq(rs.getString("Sqrq"));
				mesInfo.setSqrgh(rs.getString("Sqrgh"));
				mesInfo.setSqr(rs.getString("Sqr"));
				mesInfo.setSjljh(rs.getString("Sjljh"));
				mesInfo.setVersion(rs.getString("Version"));
				mesInfo.setOristate(rs.getInt("Oristate"));
				mesInfo.setDststate(rs.getInt("dststate"));
				mesInfo.setSqsm(rs.getString("Sqsm"));
				mesInfo.setBz(rs.getString("Bz"));
				mesInfo.setBz1(rs.getString("Bz1"));
				mesInfo.setBz2(rs.getString("Bz2"));
				mesInfo.setBz3(rs.getString("Bz3"));
				mesInfo.setBz4(rs.getString("Bz4"));
				mesInfo.setBz5(rs.getString("Bz5"));
				mesInfo.setClrgh(rs.getString("clrgh"));
				mesInfo.setClr(rs.getString("clr"));
				mesInfo.setClzt(rs.getInt("clzt"));
				mesInfo.setClzk(rs.getString("clzk"));
				mesInfo.setFJ1(rs.getString("fj1"));
				mesInfo.setFJ2(rs.getString("fj2"));
				mesInfo.setFJ3(rs.getString("fj3"));
				mesInfos.add(mesInfo);
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return mesInfos;
	}
	/*
	 * 得到一个包括登录用户本人的一个hash表，表中不仅包括他本人，还包括在当前日期内请求他作为的代理人的人工号。
	 */
	private HashSet<String> query_proxy(String clrgh){
		String curdate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		//System.out.println("当前日期:" + curdate);
		HashSet<String> hs = new HashSet<String>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from OTHERUSERINFO where dstnum="+"'"+clrgh+"' and "+"'"+curdate+"'>=startdate and "+"'"+curdate+"'<=enddate";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				hs.add(rs.getString("orinum"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		/*for(String s : hs){
			System.out.println("我是请求别人代理的那个人"+s);
		}*/
		hs.add(clrgh);
		return hs;
	}
	
	/**
	 * 更新处理状况。clzk
	 */
	public void update_clzk(MesInfo mesInfo,String clzk){
		if(mesInfo != null){
			StringBuilder sb = new StringBuilder(mesInfo.getClzk());
			sb.append(";");
			sb.append(clzk);
			mesInfo.setClzk(sb.toString());
			updatemesInfo(mesInfo);
		}
	}
	
	/**
	 * 给Tracing.jsp页面准备的方法，功能是查找申请者提交的一些的申请,还有作为审核人时的相关流程。全包括了！
	 * @param sqrgh
	 * @return
	 */
	public List<MesInfo> query_by_sqrgh(String sqrgh) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		ArrayList<MesInfo> mesInfos = new ArrayList<MesInfo>(); 
		
		HashSet<String> hs = query_proxy(sqrgh);//反正传入的参数 代表了  当前用户！！！
		//这个函数就是要把当前用户的所有相关流程，查询出来！
		
		String sql = "select * from MESINFO where sqrgh="+"'"+sqrgh+"' order by Num desc";
		
		
		StringBuilder sql_0 = new StringBuilder("select * from MESINFO where sqrgh="+"'");

		sql_0.append(sqrgh);//0为待处理，1为处理完毕  ,2为驳回状态 int
		sql_0.append("'");
		
		sql_0.append(" union select * from MESINFO where clrgh in (");
		for(String s : hs){//hs里已经包括了他本人！
			sql_0.append("'");
			sql_0.append(s);
			sql_0.append("'");
			sql_0.append(",");
		}
		sql_0.deleteCharAt(sql_0.length()-1);//删除最后一个逗号
		sql_0.append(") order by Num desc");
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql_0.toString());
			rs = ps.executeQuery();
			
			while(rs.next()){
				MesInfo mesInfo = new MesInfo();
				mesInfo.setNum(rs.getString("Num"));
				mesInfo.setStyle(rs.getInt("Style"));
				mesInfo.setSqrq(rs.getString("Sqrq"));
				mesInfo.setSqrgh(rs.getString("Sqrgh"));
				mesInfo.setSqr(rs.getString("Sqr"));
				mesInfo.setSjljh(rs.getString("Sjljh"));
				mesInfo.setVersion(rs.getString("Version"));
				mesInfo.setOristate(rs.getInt("Oristate"));
				mesInfo.setDststate(rs.getInt("dststate"));
				mesInfo.setSqsm(rs.getString("Sqsm"));
				mesInfo.setBz(rs.getString("Bz"));
				mesInfo.setBz1(rs.getString("Bz1"));
				mesInfo.setBz2(rs.getString("Bz2"));
				mesInfo.setBz3(rs.getString("Bz3"));
				mesInfo.setBz4(rs.getString("Bz4"));
				mesInfo.setBz5(rs.getString("Bz5"));
				mesInfo.setClrgh(rs.getString("clrgh"));
				mesInfo.setClr(rs.getString("clr"));
				mesInfo.setClzt(rs.getInt("clzt"));
				mesInfo.setClzk(rs.getString("clzk"));
				mesInfo.setFJ1(rs.getString("fj1"));
				mesInfo.setFJ2(rs.getString("fj2"));
				mesInfo.setFJ3(rs.getString("fj3"));
				mesInfos.add(mesInfo);
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return mesInfos;
	}
	
	
	
	
	/**
	 * 这个是给Tracing.jsp页面的带条件的查询！！！
	 * 给Tracing.jsp页面准备的方法，功能是查找申请者提交的一些的申请,还有作为审核人时的相关流程。全包括了！
	 * @param 参数    ---->     (String)session.getAttribute("bh"), sjljh, clzk, version
	 * @return
	 */
	public List<MesInfo> query_by_sqrgh_daitiaojian(String usernum, String sjljh, String clzt,String version) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		ArrayList<MesInfo> mesInfos = new ArrayList<MesInfo>(); 
		
		HashSet<String> hs = query_proxy(usernum);//反正传入的参数 代表了  当前用户！！！
		//这个函数就是要把当前用户的所有相关流程，查询出来！
		
		//String sql = "select * from MESINFO where sqrgh="+"'"+sqrgh+"' order by Num desc";
		
		
		StringBuilder sql_0 = new StringBuilder("select * from MESINFO where sqrgh="+"'");

		sql_0.append(usernum);//0为待处理，1为处理完毕  ,2为驳回状态 int
		sql_0.append("'"+ " and sjljh like " + "'%"+sjljh+"%'" +" and version like "+ "'%"+version+"%'" + " and clzt like "+ "'%"+ clzt +"%'");
		
		sql_0.append(" union select * from MESINFO where clrgh in (");
		for(String s : hs){//hs里已经包括了他本人！
			sql_0.append("'");
			sql_0.append(s);
			sql_0.append("'");
			sql_0.append(",");
		}
		sql_0.deleteCharAt(sql_0.length()-1);//删除最后一个逗号
		sql_0.append(")" +  " and sjljh like " + "'%"+sjljh+"%'" +" and version like "+ "'%"+version+"%'" + " and clzt like "+ "'%"+ clzt +"%'"+" order by Num desc");
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql_0.toString());
			rs = ps.executeQuery();
			
			while(rs.next()){
				MesInfo mesInfo = new MesInfo();
				mesInfo.setNum(rs.getString("Num"));
				mesInfo.setStyle(rs.getInt("Style"));
				mesInfo.setSqrq(rs.getString("Sqrq"));
				mesInfo.setSqrgh(rs.getString("Sqrgh"));
				mesInfo.setSqr(rs.getString("Sqr"));
				mesInfo.setSjljh(rs.getString("Sjljh"));
				mesInfo.setVersion(rs.getString("Version"));
				mesInfo.setOristate(rs.getInt("Oristate"));
				mesInfo.setDststate(rs.getInt("dststate"));
				mesInfo.setSqsm(rs.getString("Sqsm"));
				mesInfo.setBz(rs.getString("Bz"));
				mesInfo.setBz1(rs.getString("Bz1"));
				mesInfo.setBz2(rs.getString("Bz2"));
				mesInfo.setBz3(rs.getString("Bz3"));
				mesInfo.setBz4(rs.getString("Bz4"));
				mesInfo.setBz5(rs.getString("Bz5"));
				mesInfo.setClrgh(rs.getString("clrgh"));
				mesInfo.setClr(rs.getString("clr"));
				mesInfo.setClzt(rs.getInt("clzt"));
				mesInfo.setClzk(rs.getString("clzk"));
				mesInfo.setFJ1(rs.getString("fj1"));
				mesInfo.setFJ2(rs.getString("fj2"));
				mesInfo.setFJ3(rs.getString("fj3"));
				mesInfos.add(mesInfo);
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return mesInfos;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<MesInfo> query_fortracing1(String clrgh,String sjljh,String clzt,String version){
		HashSet<String> hs = query_proxy(clrgh);
		List<MesInfo> list = new ArrayList<MesInfo>();
		for(String s : hs){
			list.addAll(query_alone_fortracing(s,sjljh,clzt,version));
		}
		
		return list;
	}

	private List<MesInfo> query_alone_fortracing(String clrgh,String sjljh,String clzt,String version) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		ArrayList<MesInfo> mesInfos = new ArrayList<MesInfo>(); 
		query_proxy(clrgh);
		
		String sql = "select * from MESINFO where clrgh="+"'"+clrgh+"' and sjljh like "+ "'%"+sjljh+"%'" +" and version like "+ "'%"+version+"%'" + " and clzt like "+ "'%"+ clzt +"%'" +" order by Num desc";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				MesInfo mesInfo = new MesInfo();
				mesInfo.setNum(rs.getString("Num"));
				mesInfo.setStyle(rs.getInt("Style"));
				mesInfo.setSqrq(rs.getString("Sqrq"));
				mesInfo.setSqrgh(rs.getString("Sqrgh"));
				mesInfo.setSqr(rs.getString("Sqr"));
				mesInfo.setSjljh(rs.getString("Sjljh"));
				mesInfo.setVersion(rs.getString("Version"));
				mesInfo.setOristate(rs.getInt("Oristate"));
				mesInfo.setDststate(rs.getInt("dststate"));
				mesInfo.setSqsm(rs.getString("Sqsm"));
				mesInfo.setBz(rs.getString("Bz"));
				mesInfo.setBz1(rs.getString("Bz1"));
				mesInfo.setBz2(rs.getString("Bz2"));
				mesInfo.setBz3(rs.getString("Bz3"));
				mesInfo.setBz4(rs.getString("Bz4"));
				mesInfo.setBz5(rs.getString("Bz5"));
				mesInfo.setClrgh(rs.getString("clrgh"));
				mesInfo.setClr(rs.getString("clr"));
				mesInfo.setClzt(rs.getInt("clzt"));
				mesInfo.setClzk(rs.getString("clzk"));
				mesInfo.setFJ1(rs.getString("fj1"));
				mesInfo.setFJ2(rs.getString("fj2"));
				mesInfo.setFJ3(rs.getString("fj3"));
				mesInfos.add(mesInfo);
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return mesInfos;
	}
	
	
	
	
	
	
	
	
	public List<MesInfo> queryfor_tracing2(String sqrgh,String sjljh,String clzk,String version) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		ArrayList<MesInfo> mesInfos = new ArrayList<MesInfo>(); 
		
		String sql = "select * from MESINFO where sqrgh="+"'"+sqrgh+"' and sjljh like "+ "'%"+sjljh+"%'" +" and version like "+ "'%"+version+"%'" + " and clzt like "+ "'%"+ clzk +"%'" +" order by Num desc";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				MesInfo mesInfo = new MesInfo();
				mesInfo.setNum(rs.getString("Num"));
				mesInfo.setStyle(rs.getInt("Style"));
				mesInfo.setSqrq(rs.getString("Sqrq"));
				mesInfo.setSqrgh(rs.getString("Sqrgh"));
				mesInfo.setSqr(rs.getString("Sqr"));
				mesInfo.setSjljh(rs.getString("Sjljh"));
				mesInfo.setVersion(rs.getString("Version"));
				mesInfo.setOristate(rs.getInt("Oristate"));
				mesInfo.setDststate(rs.getInt("dststate"));
				mesInfo.setSqsm(rs.getString("Sqsm"));
				mesInfo.setBz(rs.getString("Bz"));
				mesInfo.setBz1(rs.getString("Bz1"));
				mesInfo.setBz2(rs.getString("Bz2"));
				mesInfo.setBz3(rs.getString("Bz3"));
				mesInfo.setBz4(rs.getString("Bz4"));
				mesInfo.setBz5(rs.getString("Bz5"));
				mesInfo.setClrgh(rs.getString("clrgh"));
				mesInfo.setClr(rs.getString("clr"));
				mesInfo.setClzt(rs.getInt("clzt"));
				mesInfo.setClzk(rs.getString("clzk"));
				mesInfo.setFJ1(rs.getString("fj1"));
				mesInfo.setFJ2(rs.getString("fj2"));
				mesInfo.setFJ3(rs.getString("fj3"));
				mesInfos.add(mesInfo);
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return mesInfos;
	}
	
	
	
	
	
	
	
 /*
  * String sjljh,String clzt,String version
  */
	public List<MesInfo> query_alone_fortracing3(String sjljh,String clzt,String version) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		ArrayList<MesInfo> mesInfos = new ArrayList<MesInfo>(); 
		
		
		String sql = "select * from MESINFO where sjljh like "+ "'%"+sjljh+"%'" +" and version like "+ "'%"+version+"%'" + " and clzt like "+ "'%"+ clzt +"%'" +" order by Num desc";
		
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				MesInfo mesInfo = new MesInfo();
				mesInfo.setNum(rs.getString("Num"));
				mesInfo.setStyle(rs.getInt("Style"));
				mesInfo.setSqrq(rs.getString("Sqrq"));
				mesInfo.setSqrgh(rs.getString("Sqrgh"));
				mesInfo.setSqr(rs.getString("Sqr"));
				mesInfo.setSjljh(rs.getString("Sjljh"));
				mesInfo.setVersion(rs.getString("Version"));
				mesInfo.setOristate(rs.getInt("Oristate"));
				mesInfo.setDststate(rs.getInt("dststate"));
				mesInfo.setSqsm(rs.getString("Sqsm"));
				mesInfo.setBz(rs.getString("Bz"));
				mesInfo.setBz1(rs.getString("Bz1"));
				mesInfo.setBz2(rs.getString("Bz2"));
				mesInfo.setBz3(rs.getString("Bz3"));
				mesInfo.setBz4(rs.getString("Bz4"));
				mesInfo.setBz5(rs.getString("Bz5"));
				mesInfo.setClrgh(rs.getString("clrgh"));
				mesInfo.setClr(rs.getString("clr"));
				mesInfo.setClzt(rs.getInt("clzt"));
				mesInfo.setClzk(rs.getString("clzk"));
				mesInfo.setFJ1(rs.getString("fj1"));
				mesInfo.setFJ2(rs.getString("fj2"));
				mesInfo.setFJ3(rs.getString("fj3"));
				mesInfos.add(mesInfo);
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return mesInfos;
	}
	
	

/*	public List<MesInfo> query_fortheMission(String clrgh){
		HashSet<String> hs = query_proxy(clrgh);
		List<MesInfo> list = new ArrayList<MesInfo>();
		for(String s : hs){
			list.addAll(query_alone(s));
		}
		
		return list;
	}*/
	/**
	 * 
	 * @param clrgh
	 * @return
	 */
	public List<MesInfo> query_fortheMission(String clrgh) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		ArrayList<MesInfo> mesInfos = new ArrayList<MesInfo>(); 
		//query_proxy(clrgh);
		HashSet<String> hs = query_proxy(clrgh);
		
		String sql = "select * from MESINFO where clrgh="+"'"+clrgh+"' order by Num desc";
		
		StringBuilder sql_0 = new StringBuilder("select * from MESINFO where clrgh in (");
		for(String s : hs){//hs里已经包括了他本人！
			sql_0.append("'");
			sql_0.append(s);
			sql_0.append("'");
			sql_0.append(",");
		}
		sql_0.deleteCharAt(sql_0.length()-1);//删除最后一个逗号
		sql_0.append(") and clzt=0");//0为待处理，1为处理完毕  ,2为驳回状态 int
		
		sql_0.append(" union select * from MESINFO where sqrgh in (");
		for(String s : hs){//hs里已经包括了他本人！
			sql_0.append("'");
			sql_0.append(s);
			sql_0.append("'");
			sql_0.append(",");
		}
		sql_0.deleteCharAt(sql_0.length()-1);//删除最后一个逗号
		sql_0.append(") and clzt=2 order by Num desc");//0为待处理，1为处理完毕  ,2为驳回状态 int
		
		//System.out.println(sql_0);
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql_0.toString());
			rs = ps.executeQuery();
			
			while(rs.next()){
				MesInfo mesInfo = new MesInfo();
				mesInfo.setNum(rs.getString("Num"));
				mesInfo.setStyle(rs.getInt("Style"));
				mesInfo.setSqrq(rs.getString("Sqrq"));
				mesInfo.setSqrgh(rs.getString("Sqrgh"));
				mesInfo.setSqr(rs.getString("Sqr"));
				mesInfo.setSjljh(rs.getString("Sjljh"));
				mesInfo.setVersion(rs.getString("Version"));
				mesInfo.setOristate(rs.getInt("Oristate"));
				mesInfo.setDststate(rs.getInt("dststate"));
				mesInfo.setSqsm(rs.getString("Sqsm"));
				mesInfo.setBz(rs.getString("Bz"));
				mesInfo.setBz1(rs.getString("Bz1"));
				mesInfo.setBz2(rs.getString("Bz2"));
				mesInfo.setBz3(rs.getString("Bz3"));
				mesInfo.setBz4(rs.getString("Bz4"));
				mesInfo.setBz5(rs.getString("Bz5"));
				mesInfo.setClrgh(rs.getString("clrgh"));
				mesInfo.setClr(rs.getString("clr"));
				mesInfo.setClzt(rs.getInt("clzt"));
				mesInfo.setClzk(rs.getString("clzk"));
				mesInfo.setFJ1(rs.getString("fj1"));
				mesInfo.setFJ2(rs.getString("fj2"));
				mesInfo.setFJ3(rs.getString("fj3"));
				mesInfos.add(mesInfo);
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return mesInfos;
	}
	
	/**
	 * 
	 * @param clrgh,sjljh,version
	 * @return
	 */
	public List<MesInfo> query_fortheMission2(String clrgh,String sjljh, String version) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//HexInfo hexInfo = new HexInfo();
		ArrayList<MesInfo> mesInfos = new ArrayList<MesInfo>(); 
		//query_proxy(clrgh);
		HashSet<String> hs = query_proxy(clrgh);
		//String sql = "select * from MESINFO where clrgh="+"'"+clrgh+"' and sjljh like "+ "'%"+sjljh+"%'" +" and version like "+ "'%"+version+"%'" + " and clzt like "+ "'%"+ clzt +"%'" +" order by Num desc";
		
		StringBuilder sql_0 = new StringBuilder("select * from MESINFO where clrgh in (");
		for(String s : hs){//hs里已经包括了他本人！
			sql_0.append("'");
			sql_0.append(s);
			sql_0.append("'");
			sql_0.append(",");
		}
		sql_0.deleteCharAt(sql_0.length()-1);//删除最后一个逗号
		sql_0.append(") and clzt=0 and sjljh like " + "'%"+sjljh+"%'" +" and version like "+ "'%"+version+"%'");//0为待处理，1为处理完毕  ,2为驳回状态 int
		
		sql_0.append(" union select * from MESINFO where sqrgh in (");
		for(String s : hs){//hs里已经包括了他本人！
			sql_0.append("'");
			sql_0.append(s);
			sql_0.append("'");
			sql_0.append(",");
		}
		sql_0.deleteCharAt(sql_0.length()-1);//删除最后一个逗号
		sql_0.append(") and clzt=2 and sjljh like "+ "'%"+sjljh+"%'" +" and version like "+ "'%"+version+"%'" + " order by Num desc");//0为待处理，1为处理完毕  ,2为驳回状态 int
		
		//System.out.println(sql_0);
		try{
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql_0.toString());
			rs = ps.executeQuery();
			
			while(rs.next()){
				MesInfo mesInfo = new MesInfo();
				mesInfo.setNum(rs.getString("Num"));
				mesInfo.setStyle(rs.getInt("Style"));
				mesInfo.setSqrq(rs.getString("Sqrq"));
				mesInfo.setSqrgh(rs.getString("Sqrgh"));
				mesInfo.setSqr(rs.getString("Sqr"));
				mesInfo.setSjljh(rs.getString("Sjljh"));
				mesInfo.setVersion(rs.getString("Version"));
				mesInfo.setOristate(rs.getInt("Oristate"));
				mesInfo.setDststate(rs.getInt("dststate"));
				mesInfo.setSqsm(rs.getString("Sqsm"));
				mesInfo.setBz(rs.getString("Bz"));
				mesInfo.setBz1(rs.getString("Bz1"));
				mesInfo.setBz2(rs.getString("Bz2"));
				mesInfo.setBz3(rs.getString("Bz3"));
				mesInfo.setBz4(rs.getString("Bz4"));
				mesInfo.setBz5(rs.getString("Bz5"));
				mesInfo.setClrgh(rs.getString("clrgh"));
				mesInfo.setClr(rs.getString("clr"));
				mesInfo.setClzt(rs.getInt("clzt"));
				mesInfo.setClzk(rs.getString("clzk"));
				mesInfo.setFJ1(rs.getString("fj1"));
				mesInfo.setFJ2(rs.getString("fj2"));
				mesInfo.setFJ3(rs.getString("fj3"));
				mesInfos.add(mesInfo);
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);
		}
		return mesInfos;
	}
	
	
}

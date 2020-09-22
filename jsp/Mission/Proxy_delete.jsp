<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.seu.jdbc.JdbcUtils"%>
<%@ page import="com.seu.beans.UserInfo"%>
<%@ page import="com.seu.dao.impl.UserInfoDaoImpl"%>
<%@ page import="com.seu.ioutils.HandleFolder"%>
<%@ page import="com.seu.dao.impl.LogInfoDaoImpl"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="com.seu.jdbc.JdbcUtils"%>
<%
	/*
	 通知添加后台
	 */
	request.setCharacterEncoding("utf-8");//设置字符集
	
	String orinum = (String) request.getParameter("orinum");
	String oriname = (String) request.getParameter("oriname");
	String dstnum = (String) request.getParameter("dstnum");
	String dstname = (String) request.getParameter("dstname");
	String startdate = (String) request.getParameter("startdate");
	String enddate = (String) request.getParameter("enddate");
	//System.out.println(orinum + oriname + dstnum + dstname + startdate + enddate);
	String bh = (String) session.getAttribute("bh");
	
	Connection conn = null;
	PreparedStatement ps = null;
		
	try{
		conn = JdbcUtils.getConnection();
		String sql = "delete from OTHERUSERINFO where orinum =?";
		ps = conn.prepareStatement(sql);
			
		ps.setString(1, bh);
		
		ps.executeUpdate();
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		JdbcUtils.free(null, ps, conn);
	}
	
	
	
/* 	boolean check = false;
	try{
		check = userInfoDaoImpl.addUser(userInfo);
	}catch(Exception e){
		out.println("<script>");
		out.println("alert('用户已存在，请修改！');");
		out.println("history.go(-1)");
		//out.println("window.location='HexPfile.jsp'");
		out.println("</script>");
	}
 */
	


	if (true) {//操作成功
		out.println("<script>");
		out.println("alert('操作成功');");
		out.println("window.location='Proxy.jsp'");
		out.println("</script>");
	} else {//操作失败
			out.println("<script>");
			out.println("alert('操作失败');");
			out.println("history.go(-1)");
			//out.println("window.location='HexPfile.jsp'");
			out.println("</script>");
	}
	
%>